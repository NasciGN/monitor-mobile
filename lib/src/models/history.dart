class History {
  String itemId, clock, value, ns;

  History({
    required this.itemId,
    required this.clock,
    required this.value,
    required this.ns,
  });

  Map<String, dynamic> toMap() {
    return {
      'itemid': itemId,
      'clock': clock,
      'value': value,
      'ns': ns,
    };
  }

  factory History.fromJson(Map<String, dynamic>? json) {
    if (json != null && json.isNotEmpty) {
      return History(
        itemId: json['itemid'],
        clock: json['clock'],
        value: json['value'],
        ns: json['ns'],
      );
    } else {
      return History(itemId: '', clock: '', value: '', ns: '');
    }
  }
}
