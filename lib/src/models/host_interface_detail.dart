class InterfaceDetails {
  String version;
  String bulk;
  String community;

  InterfaceDetails({
    required this.version,
    required this.bulk,
    required this.community,
  });

  Map<String, dynamic> toMap() {
    return {
      'version': version,
      'bulk': bulk,
      'community': community,
    };
  }

  factory InterfaceDetails.fromJson(Map<String, dynamic> json) {
    if (json.isNotEmpty) {
      return InterfaceDetails(
        version: json['version'],
        bulk: json['bulk'],
        community: json['community'],
      );
    } else {
      return InterfaceDetails(version: '', bulk: '', community: '');
    }
  }
}
