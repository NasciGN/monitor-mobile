import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:monitor_mobile/src/controllers/api_controller.dart';
import '../../models/host.dart';

class HostsDataController {
  final GetData apiGet = GetData();

  Future<List<Host>> fetchHosts() async {
    try {
      String getHostsCall =
          await rootBundle.loadString('assets/json/hosts/getHosts.json');
      final hostsJson = await jsonDecode(getHostsCall);
      List<dynamic> hostsData = await apiGet.getData(hostsJson);
      List<Host> hosts = hostsData.map((host) => Host.fromJson(host)).toList();
      await fetchHostInterfaces(hosts);
      sortByNameHosts(hosts);
      return hosts;
    } catch (e) {
      print('Erro: $e');
      return [];
    }
  }

  Future<void> fetchHostInterfaces(List<Host> hosts) async {
    try {
      String getInterfacesCall = await rootBundle
          .loadString('assets/json/host_interface/getHostInterfaces.json');
      final interfacesJson = await jsonDecode(getInterfacesCall);

      final List<Future> futureHostInterfaces = [];

      for (var host in hosts) {
        interfacesJson["params"]["hostids"] = host.id;
        futureHostInterfaces.add(apiGet.getData(interfacesJson));
      }

      final List<dynamic> interfacesData =
          await Future.wait(futureHostInterfaces);

      for (int i = 0; i < hosts.length; i++) {
        Host host = hosts[i];
        var interfaceData = interfacesData[i];
        host.hostInterfaces = Host.interfaceFromJson(interfaceData);
      }
    } catch (e) {
      print('Erro: $e');
    }
  }

  void sortByNameHosts(List<Host> hosts) {
    hosts.sort((Host a, Host b) => a.host.compareTo(b.host));
  }

  List<Host> searchFilter(String query, List<Host> hosts) {
    return hosts
        .where((element) =>
            element.host.toLowerCase().contains(query.toLowerCase()) ||
            element.name.toLowerCase().contains(query.toLowerCase()) ||
            element.description.toLowerCase().contains(query.toLowerCase()) ||
            element.hostInterfaces.any((element) => element.ip.contains(query)))
        .toList();
  }
}
