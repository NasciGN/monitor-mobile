import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:monitor_mobile/src/controllers/api_controller.dart';
import 'package:monitor_mobile/src/models/models.dart';

class HostsDataController {
  final GetData apiGet = GetData();

  Future<List<Host>> fetchHosts() async {
    try {
      String getHostsCall =
          await rootBundle.loadString('assets/json/hosts/get_hosts.json');
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

  Future<List<Host>> fetchHostsByName(String name) async {
    try {
      String getHostsCall =
          await rootBundle.loadString('assets/json/hosts/get_hosts.json');
      final hostsJson = await jsonDecode(getHostsCall);
      hostsJson["params"]["search"]["name"] = name;
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
      String getInterfacesCall = await rootBundle.loadString(
          'assets/json/host_interface/get_host_interfaces.json.json');
      final interfacesJson = await jsonDecode(getInterfacesCall);
      List<dynamic> hostsInterface = await apiGet.getData(interfacesJson);

      for (int i = 0; i < hosts.length; i++) {
        List<dynamic> interfaceData;
        Host host = hosts[i];
        interfaceData = hostsInterface
            .where((element) => element["hostid"].contains(host.id))
            .toList();
        host.hostInterfaces = Host.interfaceFromJson(interfaceData);
      }
    } catch (e) {
      print('Erro: $e');
    }
  }

  Future<List<Item>> getHostItens(String hostId) async {
    try {
      String getHostItensCall = await rootBundle
          .loadString('assets/json/host_item/get_host_itens.json');
      final jsonRequest = await jsonDecode(getHostItensCall);

      jsonRequest["params"]["hostids"] = hostId;
      List<dynamic> itensData = await apiGet.getData(jsonRequest);
      List<Item> itens = itensData.map((item) => Item.fromJson(item)).toList();
      return itens;
    } catch (e) {
      print('Erro: $e');
      return [];
    }
  }

  Future<List<Event>> getHostEvents(String hostId) async {
    try {
      String getHostItensCall = await rootBundle
          .loadString('assets/json/host_event/get_host_events.json');
      final jsonRequest = await jsonDecode(getHostItensCall);

      jsonRequest["params"]["hostids"] = hostId;
      List<dynamic> eventsData = await apiGet.getData(jsonRequest);
      List<Event> events =
          eventsData.map((item) => Event.fromJson(item)).toList();
      return events;
    } catch (e) {
      print('Erro: $e');
      return [];
    }
  }

  Future<List<Problem>> getHostProblems(String hostId) async {
    try {
      String getHostItensCall = await rootBundle
          .loadString('assets/json/host_problem/get_host_problems.json');
      final jsonRequest = await jsonDecode(getHostItensCall);

      jsonRequest["params"]["hostids"] = hostId;
      List<dynamic> eventsData = await apiGet.getData(jsonRequest);
      List<Problem> problems =
          eventsData.map((item) => Problem.fromJson(item)).toList();
      return problems;
    } catch (e) {
      print('Erro: $e');
      return [];
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
