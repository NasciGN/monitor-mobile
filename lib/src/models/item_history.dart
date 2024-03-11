import 'package:monitor_mobile/src/core/utils/format_data.dart';

class ItemHistory {
  String itemId, clock, value, ns, newClock, newValue, newNs;

  ItemHistory({
    this.itemId = '',
    this.clock = '',
    this.value = '',
    this.ns = '',
    this.newClock = '',
    this.newValue = '',
    this.newNs = '',
  });

  factory ItemHistory.fromJson(Map<String, dynamic> json) {
    if (json.isNotEmpty) {
      ItemHistory history = ItemHistory(
        itemId: json['itemid'],
        clock: json['clock'],
        value: json['value'],
        ns: json['ns'],
      );

      final FormatData formatData = FormatData();

      history.newClock =
          formatData.calcularTempoDecorrido(json['clock']).toString();
      return history;
    } else {
      return ItemHistory();
    }
  }
}
