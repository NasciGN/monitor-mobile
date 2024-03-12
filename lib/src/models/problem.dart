import 'package:monitor_mobile/src/core/utils/format_data.dart';

class Problem {
  String eventid,
      name,
      objectid,
      object,
      clock,
      acknowledged,
      value,
      severity,
      newClock;

  Problem({
    required this.eventid,
    required this.name,
    required this.objectid,
    required this.object,
    required this.clock,
    this.newClock = '',
    required this.acknowledged,
    required this.value,
    required this.severity,
  });

  factory Problem.fromJson(Map<String, dynamic> json) {
    FormatData formatData = FormatData();
    Problem problem = Problem(
      eventid: json['eventid'] ?? '',
      objectid: json['objectid'] ?? '',
      name: json['name'] ?? '',
      object: json['object'] ?? '',
      clock: json['clock'] ?? '',
      acknowledged: json['acknowledged'] ?? '',
      value: json['value'] ?? '',
      severity: json['severity'] ?? '',
    );

    problem.newClock = formatData.formatDuration(json['clock']);

    return problem;
  }

  Map<String, dynamic> toJson() {
    return {
      'eventid': eventid,
      'name': name,
      'objectid': objectid,
      'object': object,
      'clock': clock,
      'acknowledged': acknowledged,
      'value': value,
      'severity': severity,
    };
  }
}
