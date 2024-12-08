import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/models.dart';

class EventoFormController extends GetxController {
  bool isEdit = false;
  TextEditingController name = TextEditingController();
  TextEditingController severity = TextEditingController();
  TextEditingController duration = TextEditingController();

  final tags = List<Tag>;

  @override
  onClose() {
    name.dispose();
    severity.dispose();
    duration.dispose();
  }
}
