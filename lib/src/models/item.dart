import 'package:monitor_mobile/src/core/utils/format_data.dart';
import 'package:monitor_mobile/src/models/models.dart';

class Item {
  String itemId,
      type,
      snmpOid,
      hostId,
      name,
      delay,
      history,
      units,
      trends,
      status,
      valueType,
      templateId,
      inventoryLink,
      statusCodes,
      error,
      description,
      lastClock,
      lastNs,
      lastValue,
      prevValue,
      newLastValue,
      newUnits,
      newLastClock,
      newStatus,
      newType;
  List<History> historyList;

  Item({
    required this.itemId,
    required this.type,
    required this.snmpOid,
    required this.hostId,
    required this.name,
    required this.delay,
    required this.history,
    required this.trends,
    required this.status,
    required this.valueType,
    required this.templateId,
    this.inventoryLink = '',
    required this.statusCodes,
    required this.error,
    required this.units,
    required this.description,
    this.lastClock = '',
    required this.lastNs,
    required this.lastValue,
    required this.prevValue,
    this.newLastValue = '',
    this.newUnits = '',
    this.newLastClock = '',
    this.newStatus = '',
    this.newType = '',
    this.historyList = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'itemid': itemId,
      'type': type,
      'snmp_oid': snmpOid,
      'hostid': hostId,
      'name': name,
      'delay': delay,
      'history': history,
      'trends': trends,
      'status': status,
      'value_type': valueType,
      'templateid': templateId,
      'inventory_link': inventoryLink,
      'status_codes': statusCodes,
      'error': error,
      'units': units,
      'description': description,
      'lastclock': lastClock,
      'lastns': lastNs,
      'lastvalue': lastValue,
      'prevvalue': prevValue,
    };
  }

  factory Item.fromJson(Map<String, dynamic>? json) {
    if (json != null && json.isNotEmpty) {
      var item = Item(
        itemId: json['itemid'] ?? '',
        type: json['type'] ?? '',
        snmpOid: json['snmp_oid'] ?? '',
        hostId: json['hostid'] ?? '',
        name: json['name'] ?? '',
        delay: json['delay'] ?? '',
        history: json['history'] ?? '',
        trends: json['trends'] ?? '',
        status: json['status'] ?? '',
        valueType: json['value_type'] ?? '',
        templateId: json['templateid'] ?? '',
        units: json['units'] ?? '',
        inventoryLink: json['inventory_link'] ?? '',
        statusCodes: json['status_codes'] ?? '',
        error: json['error'] ?? '',
        description: json['description'] ?? '',
        lastClock: json['lastclock'] ?? '',
        lastNs: json['lastns'] ?? '',
        lastValue: json['lastvalue'] ?? '',
        prevValue: json['prevvalue'] ?? '',
      );

      final FormatData formatData = FormatData();
      Map<String, dynamic> convertedData = formatData.convertData(json);
      final dynamic valuesMap = json['valuemap'];

      if (valuesMap is Map<String, dynamic>) {
        item.newLastValue = formatData.aplicateValueMap(valuesMap, json);
        item.newUnits = "";
      } else {
        item.newLastValue = convertedData["newValue"];
        item.newUnits = convertedData["newUnits"];
      }
      item.newStatus = formatData.statusValueMap(json["status"]);
      item.newType = formatData.typeItensValueMap(json["type"]);
      item.newLastClock = formatData.calcularTempoDecorrido(json["lastclock"]);

      return item;
    } else {
      return Item(
        itemId: '0',
        type: '0',
        snmpOid: '',
        hostId: '0',
        name: '',
        delay: '',
        history: '',
        units: '',
        trends: '0',
        status: '0',
        valueType: '0',
        templateId: '0',
        inventoryLink: '0',
        statusCodes: '0',
        error: '',
        description: '',
        lastClock: '0',
        lastNs: '0',
        lastValue: '0',
        prevValue: '0',
      );
    }
  }
}
