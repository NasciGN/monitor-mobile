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

  Future<bool> acknowledgeEvent(
      String eventId, String message, String severity, String action) async {
    try {
      String acknowledgedEventCall = await rootBundle
          .loadString('assets/json/events/acknowledge_event.json');
      final jsonRequest = await jsonDecode(acknowledgedEventCall);
      jsonRequest["params"]["eventids"] = eventId;
      jsonRequest["params"]["message"] = message ?? "";
      jsonRequest["params"]["severity"] = severity ?? "";
      jsonRequest["params"]["action"] = action;

      final eventResponse = await apiGet.getData(jsonRequest);
      if (eventResponse is Map<String, dynamic> &&
          eventResponse.containsKey("result") &&
          eventResponse["result"].containsKey("eventids")) {
        final eventIds = eventResponse["result"]["eventids"];
        if (eventIds is List && eventIds.isNotEmpty) {
          return true;
        }
      }
      return true;
    } catch (e) {
      print('Erro ao atualizar o evento: ($e)');
      return false;
    }
  }
}
