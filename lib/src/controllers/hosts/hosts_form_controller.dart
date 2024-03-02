import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/models/group.dart';
import 'package:monitor_mobile/src/models/template.dart';

class HostFormController extends GetxController {
  bool isEdit = false;

  TextEditingController id = TextEditingController();
  TextEditingController host = TextEditingController();
  TextEditingController name = TextEditingController();
  final parentTemplates = List<Template>;
  final ihostGroups = List<Group>;

  @override
  onClose() {
    id.dispose();
    host.dispose();
    name.dispose();
  }
}
