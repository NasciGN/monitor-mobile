import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/controllers.dart';
import 'package:monitor_mobile/src/models/models.dart';

class ProblemDataController {
  final GetData apiGet = GetData();

  Future<void> fetchProblems() async {}
  Future<List<Problem>> fetchProblemsByHost(String hostId) async {
    try {
      String getHostItensCall = await rootBundle
          .loadString('assets/json/host_problem/get_host_problems.json');
      final jsonRequest = await jsonDecode(getHostItensCall);
      jsonRequest["params"]["hostids"] = hostId;
      List<dynamic> problemsData = await apiGet.getData(jsonRequest);
      List<Problem> problems =
          problemsData.map((item) => Problem.fromJson(item)).toList();
      return problems;
    } catch (e) {
      Get.snackbar('Erro', 'Não foi possível buscar os incidentes deste Host.');
      return [];
    }
  }
}
