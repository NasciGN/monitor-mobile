import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/api/api_get_cookie.dart';
import 'package:monitor_mobile/src/controllers/user/user_api.dart';

class GetData {
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

  Future<dynamic> getData(var json) async {
    json["auth"] = token;
    try {
      final response = await http
          .post(
            Uri.parse(url),
            headers: {
              'Content-Type': 'application/json',
            },
            body: jsonEncode(json),
          )
          .timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        if (responseBody["result"] != null) {}
        final result = responseBody["result"];
        return result;
      } else {
        throw Exception(
            'Falha ao buscar dados: ERRO COD. ${response.statusCode}');
      }
    } on TimeoutException catch (e) {
      print('Timeout: $e');
    } catch (e) {
      if (e.toString().contains('No host specified in URI')) {
        print(
            'Url inválida. Verifique a Url cadastrada, ela precisa estar de acordo com o seguinte exemplo: http(s)://Endereço_ou_Dominio_do_Servidor(/zabbix)');
      }
      if (e
          .toString()
          .contains('Scheme not starting with alphabetic character')) {
        print(
            'URL invalida. Preencha o protcolo do endereço corretamente: (http://) ou (https://)');
      }
      throw Exception('Falha ao buscar dados: $e');
    }
  }

  Future<String> getCookie() async {
    String cookie =
        await cookiesManager.getCookie(user, pass, userapi.url.value);
    return cookie;
  }
}
