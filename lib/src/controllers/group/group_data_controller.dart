import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/controllers.dart';
import 'package:monitor_mobile/src/models/models.dart';

class GroupDataController {
  final GetData apiGet = GetData();

  Future<List<Group>> fetchGroups() async {
    try {
      String getGroupssCall =
          await rootBundle.loadString('assets/json/group/get_groups.json');

      final jsonRequest = await jsonDecode(getGroupssCall);
      List<dynamic> groupsData = await apiGet.getData(jsonRequest);

      List<Group> groups =
          groupsData.map((item) => Group.fromJson(item)).toList();
      print(groups.length);
      return groups;
    } catch (e) {
      print(e);
      Get.snackbar('Erro', 'Não foi possível buscar os grupos.');
      return [];
    }
  }

  List<Group> searchGroupsFilter(String query, List<Group> groups) {
    return groups
        .where((element) =>
            element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
