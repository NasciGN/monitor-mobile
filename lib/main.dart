import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/app.dart';
import 'package:monitor_mobile/src/controllers/notification/notification_service.dart';
import 'package:monitor_mobile/src/controllers/user/user_controller.dart';
import 'package:monitor_mobile/src/core/utils/hive_config.dart';

import 'src/controllers/backgroud_task/backgroud_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();
  await HiveConfig.startUserAdapter();
  await HiveConfig.openUserBox();

  Get.put(UserApi());

  await NotificationService().requestNotificationPermission();
  await NotificationService().initNotifications();

  await BackgroundService().initBackgroundFetch();

  runApp(MonitorMobile());
}
