class Group {
  String groupId, name, flags, uuid;

  Group({
    required this.groupId,
    required this.name,
    required this.flags,
    required this.uuid,
  });

  Map<String, dynamic> toMap() {
    return {
      'groupid': groupId,
      'name': name,
      'flags': flags,
      'uuid': uuid,
    };
  }

  factory Group.fromJson(Map<String, dynamic>? json) {
    if (json != null && json.isNotEmpty) {
      return Group(
        groupId: json['groupid'],
        name: json['name'],
        flags: json['flags'],
        uuid: json['uuid'],
      );
    } else {
      return Group(groupId: '', name: '', flags: '', uuid: '');
    }
  }
}
