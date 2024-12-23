import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/controllers.dart';
import 'package:monitor_mobile/src/models/models.dart';

class TemplateDataController {
  final GetData apiGet = GetData();

  Future<List<Template>> fetchTemplates() async {
    try {
      String getTemplatesCall = await rootBundle
          .loadString('assets/json/templates/get_templates.json');

      final jsonRequest = await jsonDecode(getTemplatesCall);
      List<dynamic> templatesData = await apiGet.getData(jsonRequest);
      List<Template> templates =
          templatesData.map((item) => Template.fromJson(item)).toList();
      return templates;
    } catch (e) {
      print(e);
      Get.snackbar('Erro', 'Não foi possível buscar os templates.');
      return [];
    }
  }
}
