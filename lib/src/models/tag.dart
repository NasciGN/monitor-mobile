class Tag {
  String tag;
  String value;

  Tag({
    required this.tag,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      tag: json['tag'] ?? '',
      value: json['value'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tag': tag,
      'value': value,
    };
  }
}
