class Event {
  String eventId, name, clock, severity, objectid, suppressed;

  Event({
    required this.eventId,
    required this.name,
    required this.clock,
    required this.severity,
    required this.objectid,
    required this.suppressed,
  });

  Map<String, dynamic> toMap() {
    return {
      'eventId': eventId,
      'name': name,
      'clock': clock,
      'severity': severity,
      'objectid': objectid,
    };
  }

  factory Event.fromJson(Map<String, dynamic>? json) {
    if (json != null && json.isNotEmpty) {
      return Event(
        eventId: json['eventid'] ?? '',
        name: json['name'] ?? '',
        clock: json['clock'] ?? '',
        severity: json['severity'] ?? '',
        objectid: json['objectid'] ?? '',
        suppressed: json['suppressed'] ?? '',
      );
    } else {
      return Event(
          eventId: '',
          name: '',
          clock: '',
          severity: '',
          objectid: '',
          suppressed: '');
    }
  }

  DateTime getDateTime() {
    return DateTime.fromMillisecondsSinceEpoch(int.tryParse(clock) ?? 0 * 1000);
  }
}
