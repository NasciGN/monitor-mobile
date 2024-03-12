import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/core/routes/custom_pages.dart';
import 'package:monitor_mobile/src/core/themes/custom_dark_theme.dart';

// ignore: use_key_in_widget_constructors
class MonitorMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Monitor Mobile',
      theme: customDarkTheme(),
      getPages: customGetPages,
      initialRoute: '/home',
    );
  }
}
