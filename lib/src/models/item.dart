import 'package:intl/intl.dart';

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
      newLastClock;

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
  });

  static Map<String, dynamic> convertData(json) {
    Map<String, dynamic> result = {};
    if (json["units"] == 'bps') {
      List<String> convertedValues = convertBitsPerSecond(json["lastvalue"]);
      result['newValue'] = convertedValues[0];
      result['newUnits'] = convertedValues[1];
    } else if (json["units"] == 'B') {
      List<String> convertedValues = convertBytsPerSecond(json["lastvalue"]);
      result['newValue'] = convertedValues[0];
      result['newUnits'] = convertedValues[1];
    } else if (json["units"] == '%') {
      result['newValue'] = percentageConverter(json["lastvalue"]);
      result['newUnits'] = '%';
    } else {
      result['newValue'] = json["lastvalue"];
      result["newUnits"] = json["units"];
    }
    return result;
  }

  static percentageConverter(String doubleValue) {
    double value = double.parse(doubleValue);
    return value.toStringAsFixed(2);
  }

  static convertBytsPerSecond(String stringBps) {
    int bps = int.parse(stringBps);
    List<String> values = [];
    const int bistInKilobit = 1024;
    const int bitsInMegabit = 1048576;
    const int bitsInGigabit = 1073741824;

    if (bps < bistInKilobit) {
      values.clear();
      values.add(bps.toStringAsFixed(2));
      values.add('B');
      return values;
    } else if (bps < bitsInMegabit) {
      double mbps = bps / bistInKilobit;
      values.clear();
      values.add(mbps.toStringAsFixed(2));
      values.add('KB');
      return values;
    } else if (bps < bitsInGigabit) {
      double gbps = bps / bitsInMegabit;
      values.clear();
      values.add(gbps.toStringAsFixed(2));
      values.add('MB');
      return values;
    } else {
      double tbps = bps / bitsInGigabit;
      values.clear();
      values.add(tbps.toStringAsFixed(2));
      values.add('GB');
      return values;
    }
  }

  static convertBitsPerSecond(String stringbps) {
    int bps = int.parse(stringbps);
    List<String> values = [];
    const int bistInKilobit = 1000;
    const int bitsInMegabit = 1000000;
    const int bitsInGigabit = 1000000000;

    if (bps < bistInKilobit) {
      values.clear();
      values.add(bps.toStringAsFixed(2));
      values.add('bps');
      return values;
    } else if (bps < bitsInMegabit) {
      double mbps = bps / bistInKilobit;
      values.clear();
      values.add(mbps.toStringAsFixed(2));
      values.add('Kbps');
      return values;
    } else if (bps < bitsInGigabit) {
      double gbps = bps / bitsInMegabit;
      values.clear();
      values.add(gbps.toStringAsFixed(2));
      values.add('Mbps');
      return values;
    } else {
      double tbps = bps / bitsInGigabit;
      values.clear();
      values.add(tbps.toStringAsFixed(2));
      values.add('Gbps');
      return values;
    }
  }

  static String formatarData(DateTime data) {
    final formatoLocal = DateFormat('yyyy-MM-dd HH:mm:ss');
    return formatoLocal.format(data);
  }

  static String calcularTempoDecorrido(String timestamp) {
    DateTime agora = DateTime.now();
    DateTime timeStamp =
        DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp) * 1000);

    Duration diferenca = agora.difference(timeStamp);
    DateTime dataExata = agora.subtract(diferenca);

    return formatarData(dataExata);
  }

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
      Map<String, dynamic> convertedData = convertData(json);
      item.newLastValue = convertedData["newValue"];
      item.newUnits = convertedData["newUnits"];
      item.newLastClock = calcularTempoDecorrido(json["lastclock"]);
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
