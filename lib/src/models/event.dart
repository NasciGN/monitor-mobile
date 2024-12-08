import 'package:monitor_mobile/src/core/utils/format_data.dart';
import 'package:monitor_mobile/src/models/models.dart';

class Event {
  String eventId;
  String source;
  String object;
  String objectId;
  String clock;
  String value;
  String acknowledged;
  String ns;
  String name;
  String severity;
  String rEventId;
  String cEventId;
  String correlationId;
  String userId;
  String causeEventId;
  String opData;
  String suppressed;
  List<Host> hosts;
  List<dynamic> urls;
  List<Acknowledge> acknowledges;
  List<Tag> tags;
  List<SuppressionData> suppressionData;
  String duration;

  Event({
    required this.eventId,
    required this.source,
    required this.object,
    required this.objectId,
    required this.clock,
    required this.value,
    required this.acknowledged,
    required this.ns,
    required this.name,
    required this.severity,
    required this.rEventId,
    required this.cEventId,
    required this.correlationId,
    required this.userId,
    required this.causeEventId,
    required this.opData,
    required this.suppressed,
    required this.hosts,
    required this.urls,
    required this.acknowledges,
    required this.tags,
    required this.suppressionData,
    this.duration = '',
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    FormatData formatData = FormatData();
    Event event = Event(
      eventId: json['eventid'] ?? '',
      source: json['source'] ?? '',
      object: json['object'] ?? '',
      objectId: json['objectid'] ?? '',
      clock: json['clock'] ?? '',
      value: json['value'] ?? '',
      acknowledged: json['acknowledged'] ?? '',
      ns: json['ns'] ?? '',
      name: json['name'] ?? '',
      severity: json['severity'] ?? '',
      rEventId: json['r_eventid'] ?? '',
      cEventId: json['c_eventid'] ?? '',
      correlationId: json['correlationid'] ?? '',
      userId: json['userid'] ?? '',
      causeEventId: json['cause_eventid'] ?? '',
      opData: json['opdata'] ?? '',
      suppressed: json['suppressed'] ?? '',
      hosts: (json['hosts'] as List<dynamic>? ?? [])
          .map((hostJson) => Host.fromJson(hostJson))
          .toList(),
      urls: json['urls'] ?? [],
      acknowledges: (json['acknowledges'] as List<dynamic>? ?? [])
          .map((ackJson) => Acknowledge.fromJson(ackJson))
          .toList(),
      tags: (json['tags'] as List<dynamic>? ?? [])
          .map((tagJson) => Tag.fromJson(tagJson))
          .toList(),
      suppressionData: (json['suppression_data'] as List<dynamic>? ?? [])
          .map((suppressionJson) => SuppressionData.fromJson(suppressionJson))
          .toList(),
    );
    event.duration = formatData.formatDuration(json['clock']);
    return event;
  }

  Map<String, dynamic> toMap() {
    return {
      'eventid': eventId,
      'source': source,
      'object': object,
      'objectid': objectId,
      'clock': clock,
      'value': value,
      'acknowledged': acknowledged,
      'ns': ns,
      'name': name,
      'severity': severity,
      'r_eventid': rEventId,
      'c_eventid': cEventId,
      'correlationid': correlationId,
      'userid': userId,
      'cause_eventid': causeEventId,
      'opdata': opData,
      'suppressed': suppressed,
      'hosts': hosts.map((host) => host.toMap()).toList(),
      'urls': urls,
      'acknowledges': acknowledges.map((ack) => ack.toMap()).toList(),
      'tags': tags.map((tag) => tag.toMap()).toList(),
      'suppression_data':
          suppressionData.map((suppression) => suppression.toMap()).toList(),
    };
  }
}
