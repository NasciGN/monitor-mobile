import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/models.dart';

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
