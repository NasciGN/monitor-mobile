import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/controllers.dart';
import 'package:monitor_mobile/src/models/models.dart';

class ItemDataController {
  final GetData apiGet = GetData();

  Future<void> fetchItems() async {}
  Future<List<Item>> fetchItemsByHost(String hostId) async {
    String getHostItensCall =
        await rootBundle.loadString('assets/json/items/get_items_by_host.json');
    final jsonRequest = await jsonDecode(getHostItensCall);
    jsonRequest["params"]["hostids"] = hostId;
    List<dynamic> itensData = await apiGet.getData(jsonRequest);
    List<Item> itens = itensData
        .map((item) => Item.fromJson(item))
        .where((element) => element.error == "")
        .toList();
    return itens;
  }

  Future<List<History>> fetchHistory(String itemsid, String unit) async {
    try {
      String getHostItensCall = await rootBundle
          .loadString('assets/json/problems/get_item_history.json');

      final jsonRequest = await jsonDecode(getHostItensCall);
      jsonRequest["params"]["itemsid"] = itemsid;
      List<dynamic> historyData = await apiGet.getData(jsonRequest);
      List<History> history =
          historyData.map((item) => History.fromJson(item)).toList();
      return history;
    } catch (e) {
      print(e);
      Get.snackbar('Erro', 'Não foi possível buscar os incidentes deste Host.');
      return [];
    }
  }

  List<Item> searchItensFilter(String query, List<Item> items) {
    return items
        .where((element) =>
            element.name.toLowerCase().contains(query.toLowerCase()) ||
            element.newUnits.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
