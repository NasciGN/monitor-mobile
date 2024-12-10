import 'package:monitor_mobile/src/core/utils/format_data.dart';

class Acknowledge {
  String acknowledgeId;
  String userId;
  String eventId;
  String clock;
  String message;
  String action;
  String oldSeverity;
  String newSeverity;
  String suppressUntil;
  String taskId;
  String username;
  String name;
  String surname;
  String newClock;

  Acknowledge(
      {required this.acknowledgeId,
      required this.userId,
      required this.eventId,
      required this.clock,
      required this.message,
      required this.action,
      required this.oldSeverity,
      required this.newSeverity,
      required this.suppressUntil,
      required this.taskId,
      required this.username,
      required this.name,
      required this.surname,
      this.newClock = ''});

  factory Acknowledge.fromJson(Map<String, dynamic> json) {
    FormatData formatData = FormatData();
    Acknowledge acknowledge = Acknowledge(
      acknowledgeId: json['acknowledgeid'] ?? '',
      userId: json['userid'] ?? '',
      eventId: json['eventid'] ?? '',
      clock: json['clock'] ?? '',
      message: json['message'] ?? '',
      action: json['action'] ?? '',
      oldSeverity: json['old_severity'] ?? '',
      newSeverity: json['new_severity'] ?? '',
      suppressUntil: json['suppress_until'] ?? '',
      taskId: json['taskid'] ?? '',
      username: json['username'] ?? '',
      name: json['name'] ?? '',
      surname: json['surname'] ?? '',
    );
    acknowledge.newClock = formatData.calcularTempoDecorrido(json['clock']);
    return acknowledge;
  }

  Map<String, dynamic> toMap() {
    return {
      'acknowledgeid': acknowledgeId,
      'userid': userId,
      'eventid': eventId,
      'clock': clock,
      'message': message,
      'action': action,
      'old_severity': oldSeverity,
      'new_severity': newSeverity,
      'suppress_until': suppressUntil,
      'taskid': taskId,
      'username': username,
      'name': name,
      'surname': surname,
    };
  }
}
