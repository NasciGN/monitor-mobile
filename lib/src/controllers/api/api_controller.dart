import 'dart:async';
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/api/api_get_cookie.dart';
import 'package:monitor_mobile/src/controllers/user/user_controller.dart';
import 'package:dio/dio.dart';

class GetData {
  final dio = Dio();

  UserApi userapi;
  GetCookie cookiesManager = GetCookie();
  late String token;
  late String url;
  late String user;
  late String pass;

  GetData() : userapi = Get.find<UserApi>() {
    token = userapi.apicode.value;
    url = '${userapi.url.value}/api_jsonrpc.php';
    user = userapi.usuario.value;
    pass = userapi.senha.value;
  }

  Future<dynamic> getData(var json, [String? code]) async {
    json["auth"] = code ?? token;

    try {
      final response = await dio
          .post(url,
              data: json,
              options: Options(headers: {
                'Content-Type': 'application/json',
              }))
          .timeout(const Duration(seconds: 5));
      if (response.statusCode == 200) {
        final result = response.data["result"];
        return result;
      } else {
        return {};
      }
    } on TimeoutException {
      Get.snackbar('Erro',
          'O servidor cadastrado não respondeu, verifique se um endereço válido foi preenchido!',
          duration: const Duration(seconds: 5),
          snackPosition: SnackPosition.BOTTOM);
      return;
    } catch (e) {
      Get.snackbar('Erro', 'Erro ao buscar os dados no servidor.',
          duration: const Duration(seconds: 5),
          snackPosition: SnackPosition.BOTTOM);
      return;
    }
  }

  Future<String> getCookie() async {
    String cookie =
        await cookiesManager.getCookie(user, pass, userapi.url.value);
    return cookie;
  }
}
