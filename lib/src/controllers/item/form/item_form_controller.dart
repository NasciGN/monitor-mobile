import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/models.dart';

class ItemFormController extends GetxController {
  bool isEdit = false;
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController key = TextEditingController();
  TextEditingController lastClock = TextEditingController();
  TextEditingController lastValue = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController status = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController history = TextEditingController();

  final parentTemplates = List<Template>;
  final ihostGroups = List<Group>;

  @override
  onClose() {
    name.dispose();
    description.dispose();
    key.dispose();
    lastClock.dispose();
    lastValue.dispose();
    state.dispose();
    status.dispose();
    type.dispose();
    history.dispose();
  }
}
