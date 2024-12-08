import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/controllers.dart';
import 'package:monitor_mobile/src/models/models.dart';

class TriggerDataController {
  final GetData apiGet = GetData();

  Future<Trigger> fetchTriggerById(String triggerid) async {
    try {
      String getTriggers = await rootBundle
          .loadString('assets/json/trigger/get_trigger_by_id.json');
      final jsonRequest = await jsonDecode(getTriggers);
      jsonRequest["params"]["triggerids"] = triggerid;
      List<dynamic> triggersData = await apiGet.getData(jsonRequest);
      List<Trigger> triggers = triggersData.map((item) {
        return Trigger.fromJson(item);
      }).toList();

      return triggers[0];
    } catch (e) {
      Get.snackbar('Erro', 'Não foi possível buscar triggers no servidor.');
      return Trigger(
          triggerId: '',
          expression: '',
          description: '',
          url: '',
          status: '',
          value: '',
          priority: '',
          lastChange: '',
          comments: '',
          error: '',
          templateId: '',
          type: '',
          state: '',
          flags: '',
          recoveryMode: '',
          recoveryExpression: '',
          correlationMode: '',
          correlationTag: '',
          manualClose: '',
          opData: '',
          eventName: '',
          uuid: '',
          urlName: '',
          hosts: []);
    }
  }

  Future<List<Trigger>> fetchActiveTriggers() async {
    try {
      String getTriggers =
          await rootBundle.loadString('assets/json/trigger/get_triggers.json');
      final jsonRequest = await jsonDecode(getTriggers);
      List<dynamic> triggersData = await apiGet.getData(jsonRequest);
      List<Trigger> triggers = triggersData.map((item) {
        return Trigger.fromJson(item);
      }).toList();

      return triggers;
    } catch (e) {
      print(e);
      Get.snackbar('Erro', 'Não foi possível buscar os incidentes.');
      return [];
    }
  }
}
