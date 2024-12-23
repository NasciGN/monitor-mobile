import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/core/routes/custom_pages.dart';
import 'package:monitor_mobile/src/core/themes/custom_dark_theme.dart';
import 'package:monitor_mobile/src/controllers/controllers.dart';

// ignore: use_key_in_widget_constructors
class MonitorMobile extends StatelessWidget {
  final UserApi userApi = Get.find<UserApi>();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: userApi.loadUserData(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            final bool isLoggedIn =
                userApi.apicode.isNotEmpty && userApi.url.isNotEmpty;
            return GetMaterialApp(
              title: 'Monitor Mobile',
              theme: customDarkTheme(),
              getPages: customGetPages,
              initialRoute: isLoggedIn ? '/dashboard' : '/login',
            );
          }
        }));
  }
}
