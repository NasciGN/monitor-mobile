class Template {
  String templateId, name;

  Template({
    required this.templateId,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {
      'templateid': templateId,
      'name': name,
    };
  }

  factory Template.fromJson(Map<String, dynamic>? json) {
    if (json != null && json.isNotEmpty) {
      return Template(
        templateId: json['templateid'],
        name: json['name'],
      );
    } else {
      return Template(templateId: '', name: '');
    }
  }
}
