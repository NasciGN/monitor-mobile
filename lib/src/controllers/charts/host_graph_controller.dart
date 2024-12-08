import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:monitor_mobile/src/models/models.dart';

import '../api/api_controller.dart';

class HostGraphDataController {
  final GetData apiGet = GetData();

  Future<List<Graph>> fetchGraphs(String hostId) async {
    try {
      String getGraphsJson =
          await rootBundle.loadString('assets/json/chart/get_chart.json');
      final jsonRequest = await jsonDecode(getGraphsJson);
      jsonRequest["params"]["hostids"] = hostId;
      List<dynamic> getInterfacesResponse = await apiGet.getData(jsonRequest);
      List<Graph> graphs = getInterfacesResponse
          .map((interface) => Graph.fromJson(interface))
          .toList();
      return graphs;
    } catch (e) {
      print('Erro ao buscar os graficos do host de ID $hostId: $e');
      return [];
    }
  }
}
