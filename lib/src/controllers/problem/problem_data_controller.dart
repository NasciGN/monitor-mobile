import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/controllers.dart';
import 'package:monitor_mobile/src/models/models.dart';

class ProblemDataController {
  final GetData apiGet = GetData();

  Future<List<Problem>> fetchProblems() async {
    try {
      String getHostItensCall =
          await rootBundle.loadString('assets/json/problems/get_problems.json');

      final jsonRequest = await jsonDecode(getHostItensCall);
      List<dynamic> problemsData = await apiGet.getData(jsonRequest);
      List<Problem> problems =
          problemsData.map((item) => Problem.fromJson(item)).toList();
      return problems;
    } catch (e) {
      print(e);
      Get.snackbar('Erro', 'Não foi possível buscar os incidentes deste Host.');
      return [];
    }
  }

  Future<List<Problem>> fetchProblemsByHost(String hostId) async {
    try {
      String getHostItensCall = await rootBundle
          .loadString('assets/json/problems/get_problems_by_host.json');
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

  Future<List<Problem>> fetchProblemsByTimestamp(DateTime timestamp) async {
    try {
      String getHostItensCall = await rootBundle.loadString(
          'assets/json/problems/get_problems_by_host_timestamp.json');
      final jsonRequest = await jsonDecode(getHostItensCall);
      // jsonRequest["params"]["time_from"] = timestamp;
      List<dynamic> problemsData = await apiGet.getData(jsonRequest);
      print('Dados: $problemsData');
      List<Problem> problems =
          problemsData.map((problem) => Problem.fromJson(problem)).toList();
      return problems;
    } catch (e) {
      Get.snackbar(
          'Erro', 'Não foi possível buscar os incidentes ativos no servidor.');
      return [];
    }
  }

  Future<List<Problem>> fetchProblemsWithToken(String token) async {
    int currentTimestamp = (DateTime.now().millisecondsSinceEpoch ~/ 1000);
    int timeThreshold = currentTimestamp - 960;
    try {
      String getHostItensCall =
          await rootBundle.loadString('assets/json/problems/get_problems.json');

      final jsonRequest = await jsonDecode(getHostItensCall);
      List<dynamic> problemsData = await apiGet.getData(jsonRequest);
      List<Problem> problems = problemsData
          .map((item) => Problem.fromJson(item))
          .where((problem) => int.parse(problem.clock) >= timeThreshold)
          .toList();
      return problems;
    } catch (e) {
      print(e);
      return [];
    }
  }
}
