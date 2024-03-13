import 'package:hive/hive.dart';
import 'package:monitor_mobile/src/models/models.dart';

class UserDataController {
  final userBox = Hive.box<User>('userBox');
  Future<void> saveUserLoginInfo(String apiCode, String server, String user,
      String pass, String apiVersion) async {
    await userBox.put(
      'userLoginInfo',
      User(
        apicode: apiCode,
        url: server,
        apiVersion: '',
        usuario: user,
        senha: pass,
      ),
    );
  }

  Future<User?> getUserLoginInfo() async {
    if (userBox.containsKey('userLoginInfo')) {
      return userBox.get('userLoginInfo');
    }
    return null;
  }

  Future<void> clearUserLoginInfo() async {
    await userBox.delete('userLoginInfo');
  }
}
