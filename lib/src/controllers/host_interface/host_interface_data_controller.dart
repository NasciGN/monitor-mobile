import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:monitor_mobile/src/models/models.dart';

import '../api/api_controller.dart';

class HostInterfaceDataController {
  final GetData apiGet = GetData();

  Future<List<Interface>> fetchInterfaces() async {
    try {
      String getInterfacesJson = await rootBundle
          .loadString('assets/json/host_interface/get_host_interfaces.json');
      final jsonRequest = await jsonDecode(getInterfacesJson);
      List<dynamic> getInterfacesResponse = await apiGet.getData(jsonRequest);
      List<Interface> interfaces = getInterfacesResponse
          .map((interface) => Interface.fromJson(interface))
          .toList();
      return interfaces;
    } catch (e) {
      print('Erro ao buscar as interfaces de host: $e');
      return [];
    }
  }
}
