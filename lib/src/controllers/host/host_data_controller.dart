import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:monitor_mobile/src/controllers/controllers.dart';
import 'package:monitor_mobile/src/models/models.dart';
import 'package:collection/collection.dart';

class HostsDataController {
  final GetData apiGet = GetData();
  final HostInterfaceDataController interfaceController =
      HostInterfaceDataController();

  Future<List<Host>> fetchHosts({
    String name = "",
  }) async {
    try {
      String getHostsJson =
          await rootBundle.loadString('assets/json/hosts/get_hosts.json');
      final getHostsRequest = await jsonDecode(getHostsJson);
      List<dynamic> getHostsResponse = await apiGet.getData(getHostsRequest);
      List<Host> hosts =
          getHostsResponse.map((host) => Host.fromJson(host)).toList();
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
      List<Interface> interfaces = await interfaceController.fetchInterfaces();
      for (int i = 0; i < hosts.length; i++) {
        Host host = hosts[i];
        host.hostInterfaces =
            interfaces.where((element) => element.hostId == (host.id)).toList();
        host.mainInterface = interfaces.firstWhere(
            (element) => element.main == '1' && element.hostId == (host.id));
      }
    } catch (e) {
      print('Erro: $e');
    }
  }

  void sortByNameHosts(List<Host> hosts) {
    hosts.sort((Host a, Host b) => a.host.compareTo(b.host));
  }

  List<Host> searchHostsFilter(String query, List<Host> hosts) {
    return hosts
        .where((element) =>
            element.host.toLowerCase().contains(query.toLowerCase()) ||
            element.name.toLowerCase().contains(query.toLowerCase()) ||
            element.description.toLowerCase().contains(query.toLowerCase()) ||
            element.hostInterfaces.any((element) => element.ip.contains(query)))
        .toList();
  }
}
