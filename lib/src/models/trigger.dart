import 'package:monitor_mobile/src/models/models.dart';

class Trigger {
  String triggerId;
  String expression;
  String description;
  String url;
  String status;
  String value;
  String priority;
  String lastChange;
  String comments;
  String error;
  String templateId;
  String type;
  String state;
  String flags;
  String recoveryMode;
  String recoveryExpression;
  String correlationMode;
  String correlationTag;
  String manualClose;
  String opData;
  String eventName;
  String uuid;
  String urlName;
  List<Host> hosts;

  Trigger({
    required this.triggerId,
    required this.expression,
    required this.description,
    required this.url,
    required this.status,
    required this.value,
    required this.priority,
    required this.lastChange,
    required this.comments,
    required this.error,
    required this.templateId,
    required this.type,
    required this.state,
    required this.flags,
    required this.recoveryMode,
    required this.recoveryExpression,
    required this.correlationMode,
    required this.correlationTag,
    required this.manualClose,
    required this.opData,
    required this.eventName,
    required this.uuid,
    required this.urlName,
    required this.hosts,
  });

  factory Trigger.fromJson(Map<String, dynamic> json) {
    return Trigger(
      triggerId: json['triggerid'] ?? '',
      expression: json['expression'] ?? '',
      description: json['description'] ?? '',
      url: json['url'] ?? '',
      status: json['status'] ?? '',
      value: json['value'] ?? '',
      priority: json['priority'] ?? '',
      lastChange: json['lastchange'] ?? '',
      comments: json['comments'] ?? '',
      error: json['error'] ?? '',
      templateId: json['templateid'] ?? '',
      type: json['type'] ?? '',
      state: json['state'] ?? '',
      flags: json['flags'] ?? '',
      recoveryMode: json['recovery_mode'] ?? '',
      recoveryExpression: json['recovery_expression'] ?? '',
      correlationMode: json['correlation_mode'] ?? '',
      correlationTag: json['correlation_tag'] ?? '',
      manualClose: json['manual_close'] ?? '',
      opData: json['opdata'] ?? '',
      eventName: json['event_name'] ?? '',
      uuid: json['uuid'] ?? '',
      urlName: json['url_name'] ?? '',
      hosts: (json['hosts'] as List<dynamic>? ?? [])
          .map((hostJson) => Host.fromJson(hostJson))
          .toList(),
     
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'triggerid': triggerId,
      'expression': expression,
      'description': description,
      'url': url,
      'status': status,
      'value': value,
      'priority': priority,
      'lastchange': lastChange,
      'comments': comments,
      'error': error,
      'templateid': templateId,
      'type': type,
      'state': state,
      'flags': flags,
      'recovery_mode': recoveryMode,
      'recovery_expression': recoveryExpression,
      'correlation_mode': correlationMode,
      'correlation_tag': correlationTag,
      'manual_close': manualClose,
      'opdata': opData,
      'event_name': eventName,
      'uuid': uuid,
      'url_name': urlName,
      'hosts': hosts.map((host) => host.toMap()).toList(),
    };
  }
}
