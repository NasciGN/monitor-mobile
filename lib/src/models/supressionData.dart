class SuppressionData {
  String maintenanceId;
  String suppressUntil;
  String userId;

  SuppressionData({
    required this.maintenanceId,
    required this.suppressUntil,
    required this.userId,
  });

  factory SuppressionData.fromJson(Map<String, dynamic> json) {
    return SuppressionData(
      maintenanceId: json['maintenanceid'] ?? '',
      suppressUntil: json['suppress_until'] ?? '',
      userId: json['userid'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'maintenanceid': maintenanceId,
      'suppress_until': suppressUntil,
      'userid': userId,
    };
  }
}
