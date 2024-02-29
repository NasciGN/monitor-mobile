import 'package:monitor_mobile/src/models/host_interface_detail.dart';

class Interface {
  String interfaceId,
      hostId,
      main,
      type,
      useIp,
      ip,
      dns,
      port,
      available,
      error,
      errorsFrom,
      disableUntil;
  InterfaceDetails details;

  Interface({
    required this.interfaceId,
    required this.hostId,
    required this.main,
    required this.type,
    required this.useIp,
    required this.ip,
    required this.dns,
    required this.port,
    required this.available,
    required this.error,
    required this.errorsFrom,
    required this.disableUntil,
    required this.details,
  });

  Map<String, dynamic> toMap() {
    return {
      'interfaceid': interfaceId,
      'hostid': hostId,
      'main': main,
      'type': type,
      'useip': useIp,
      'ip': ip,
      'dns': dns,
      'port': port,
      'available': available,
      'error': error,
      'errors_from': errorsFrom,
      'disable_until': disableUntil,
      'details': details.toMap(),
    };
  }

  factory Interface.fromJson(Map<String, dynamic>? json) {
    if (json != null && json.isNotEmpty) {
      return Interface(
        interfaceId: json['interfaceid'],
        hostId: json['hostid'],
        main: json['main'],
        type: json['type'],
        useIp: json['useip'],
        ip: json['ip'],
        dns: json['dns'],
        port: json['port'],
        available: json['available'],
        error: json['error'],
        errorsFrom: json['errors_from'],
        disableUntil: json['disable_until'],
        details: InterfaceDetails.fromJson(json['details']),
      );
    } else {
      return Interface(
        interfaceId: '',
        hostId: '',
        main: '',
        type: '',
        useIp: '',
        ip: '',
        dns: '',
        port: '',
        available: '',
        error: '',
        errorsFrom: '',
        disableUntil: '',
        details: InterfaceDetails(version: '', bulk: '', community: ''),
      );
    }
  }
}
