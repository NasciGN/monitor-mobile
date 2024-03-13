import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:monitor_mobile/src/models/models.dart';
import 'package:path_provider/path_provider.dart';

class HiveConfig {
  static start() async {
    Directory dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);
  }

  static startUserAdapter() {
    Hive.registerAdapter(UserAdapter());
  }

  static openUserBox() async {
    await Hive.openBox<User>('userBox');
  }
}
