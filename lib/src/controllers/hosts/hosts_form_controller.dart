import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/models/group.dart';
import 'package:monitor_mobile/src/models/template.dart';

class HostFormController extends GetxController {
  bool isEdit = false;
  TextEditingController host = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  final parentTemplates = List<Template>;
  final ihostGroups = List<Group>;

  @override
  onClose() {
    host.dispose();
    name.dispose();
    description.dispose();
  }
}
