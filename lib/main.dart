import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/app.dart';
import 'package:monitor_mobile/src/controllers/user/user_api.dart';

void main() {
  Get.put(UserApi());
  runApp(MonitorMobile());
}
