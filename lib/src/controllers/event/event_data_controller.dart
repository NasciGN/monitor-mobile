import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:monitor_mobile/src/controllers/controllers.dart';
import 'package:monitor_mobile/src/models/event.dart';

class EventDataController {
  final GetData apiGet = GetData();

  Future<List<Event>> fetchEventByHost(String hostId) async {
    try {
      String getHostItensCall = await rootBundle
          .loadString('assets/json/events/get_events_by_host.json');
      final jsonRequest = await jsonDecode(getHostItensCall);
      jsonRequest["params"]["hostids"] = hostId;
      List<dynamic> eventsData = await apiGet.getData(jsonRequest);
      List<Event> events =
          eventsData.map((item) => Event.fromJson(item)).toList();
      return events;
    } catch (e) {
      print('Erro ao buscar os problemas do host pelo nome: (e)');
      return [];
    }
  }

  Future<List<Event>> fetchEvents() async {
    try {
      String getHostItensCall =
          await rootBundle.loadString('assets/json/events/get_events.json');
      final jsonRequest = await jsonDecode(getHostItensCall);

      List<dynamic> eventsData = await apiGet.getData(jsonRequest);

      List<Event> events =
          eventsData.map((item) => Event.fromJson(item)).toList();
      return events;
    } catch (e) {
      print('Erro ao buscar os problemas do host pelo nome: (e)');
      return [];
    }
  }

  Future<List<Event>> fetchEventsByTrigger(List<String> eventids) async {
    try {
      String getHostItensCall = await rootBundle
          .loadString('assets/json/events/get_events_by_id.json');
      final jsonRequest = await jsonDecode(getHostItensCall);
      jsonRequest["params"]["eventids"] = eventids;

      List<dynamic> eventsData = await apiGet.getData(jsonRequest);
      List<Event> events =
          eventsData.map((item) => Event.fromJson(item)).toList();
      return events;
    } catch (e) {
      print('Erro ao buscar os problemas do host pelo nome: (e)');
      return [];
    }
  }
}
