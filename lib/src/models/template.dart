class Template {
  String templateId;
  String name;
  String description;
  String proxyHostId;
  String host;
  String status;
  String ipmiAuthtype;
  String ipmiPrivilege;
  String ipmiUsername;
  String ipmiPassword;
  String maintenanceId;
  String maintenanceStatus;
  String maintenanceType;
  String maintenanceFrom;
  String flags;
  String tlsConnect;
  String tlsAccept;
  String tlsIssuer;
  String tlsSubject;
  String tlsPskIdentity;
  String tlsPsk;
  String proxyAddress;
  String autoCompress;
  String customInterfaces;
  String uuid;
  String vendorName;
  String vendorVersion;

  Template({
    required this.templateId,
    required this.name,
    required this.description,
    required this.proxyHostId,
    required this.host,
    required this.status,
    required this.ipmiAuthtype,
    required this.ipmiPrivilege,
    required this.ipmiUsername,
    required this.ipmiPassword,
    required this.maintenanceId,
    required this.maintenanceStatus,
    required this.maintenanceType,
    required this.maintenanceFrom,
    required this.flags,
    required this.tlsConnect,
    required this.tlsAccept,
    required this.tlsIssuer,
    required this.tlsSubject,
    required this.tlsPskIdentity,
    required this.tlsPsk,
    required this.proxyAddress,
    required this.autoCompress,
    required this.customInterfaces,
    required this.uuid,
    required this.vendorName,
    required this.vendorVersion,
  });

  Map<String, dynamic> toMap() {
    return {
      'templateid': templateId,
      'name': name,
      'description': description,
      'proxy_hostid': proxyHostId,
      'host': host,
      'status': status,
      'ipmi_authtype': ipmiAuthtype,
      'ipmi_privilege': ipmiPrivilege,
      'ipmi_username': ipmiUsername,
      'ipmi_password': ipmiPassword,
      'maintenanceid': maintenanceId,
      'maintenance_status': maintenanceStatus,
      'maintenance_type': maintenanceType,
      'maintenance_from': maintenanceFrom,
      'flags': flags,
      'tls_connect': tlsConnect,
      'tls_accept': tlsAccept,
      'tls_issuer': tlsIssuer,
      'tls_subject': tlsSubject,
      'tls_psk_identity': tlsPskIdentity,
      'tls_psk': tlsPsk,
      'proxy_address': proxyAddress,
      'auto_compress': autoCompress,
      'custom_interfaces': customInterfaces,
      'uuid': uuid,
      'vendor_name': vendorName,
      'vendor_version': vendorVersion,
    };
  }

  factory Template.fromJson(Map<String, dynamic>? json) {
    if (json != null && json.isNotEmpty) {
      return Template(
        templateId: json['templateid'] ?? '',
        name: json['name'] ?? '',
        description: json['description'] ?? '',
        proxyHostId: json['proxy_hostid'] ?? '',
        host: json['host'] ?? '',
        status: json['status'] ?? '',
        ipmiAuthtype: json['ipmi_authtype'] ?? '',
        ipmiPrivilege: json['ipmi_privilege'] ?? '',
        ipmiUsername: json['ipmi_username'] ?? '',
        ipmiPassword: json['ipmi_password'] ?? '',
        maintenanceId: json['maintenanceid'] ?? '',
        maintenanceStatus: json['maintenance_status'] ?? '',
        maintenanceType: json['maintenance_type'] ?? '',
        maintenanceFrom: json['maintenance_from'] ?? '',
        flags: json['flags'] ?? '',
        tlsConnect: json['tls_connect'] ?? '',
        tlsAccept: json['tls_accept'] ?? '',
        tlsIssuer: json['tls_issuer'] ?? '',
        tlsSubject: json['tls_subject'] ?? '',
        tlsPskIdentity: json['tls_psk_identity'] ?? '',
        tlsPsk: json['tls_psk'] ?? '',
        proxyAddress: json['proxy_address'] ?? '',
        autoCompress: json['auto_compress'] ?? '',
        customInterfaces: json['custom_interfaces'] ?? '',
        uuid: json['uuid'] ?? '',
        vendorName: json['vendor_name'] ?? '',
        vendorVersion: json['vendor_version'] ?? '',
      );
    } else {
      return Template(
        templateId: '',
        name: '',
        description: '',
        proxyHostId: '',
        host: '',
        status: '',
        ipmiAuthtype: '',
        ipmiPrivilege: '',
        ipmiUsername: '',
        ipmiPassword: '',
        maintenanceId: '',
        maintenanceStatus: '',
        maintenanceType: '',
        maintenanceFrom: '',
        flags: '',
        tlsConnect: '',
        tlsAccept: '',
        tlsIssuer: '',
        tlsSubject: '',
        tlsPskIdentity: '',
        tlsPsk: '',
        proxyAddress: '',
        autoCompress: '',
        customInterfaces: '',
        uuid: '',
        vendorName: '',
        vendorVersion: '',
      );
    }
  }
}
