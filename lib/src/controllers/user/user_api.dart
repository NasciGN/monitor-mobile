import 'dart:async';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserApi extends GetxController {
  RxString apicode = ''.obs;
  RxString url = ''.obs;
  RxString server = ''.obs;
  RxString apiVersion = ''.obs;
  RxString usuario = ''.obs;
  RxString senha = ''.obs;

  Future<void> login(String user, String pass, String urlSite) async {
    String json = await rootBundle.loadString('assets/json/user/login.json');
    String result = '';
    final jsonRequest = await jsonDecode(json);
    jsonRequest["params"]["username"] = user;
    jsonRequest["params"]["password"] = pass;
    try {
      final response = await http
          .post(
            Uri.parse('$urlSite/api_jsonrpc.php'),
            headers: {
              'Content-Type': 'application/json',
            },
            body: jsonEncode(jsonRequest),
          )
          .timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        if (responseBody["result"] != null) {
          result = responseBody["result"].toString();
        } else {
          throw Exception('Erro ao buscar dados da API');
        }
        url.value = urlSite;
        apicode.value = result;
        usuario.value = user;
        senha.value = pass;
        update();
      }
    } on TimeoutException {
      Get.snackbar('Erro',
          'O servidor cadastrado não respondeu, verifique se um endereço válido foi preenchido!',
          duration: const Duration(seconds: 5),
          snackPosition: SnackPosition.BOTTOM);
      return;
    } catch (e) {
      if (e.toString().contains('No host specified in URI')) {
        Get.snackbar('Url inválida',
            'Verifique a Url cadastrada, ela precisa estar de acordo com o seguinte exemplo: \nhttp(s)://Endereço_ou_Dominio_do_Servidor(/zabbix).',
            duration: const Duration(seconds: 5),
            backgroundColor: const Color(0xFFFF485A),
            snackPosition: SnackPosition.BOTTOM);
      }
      if (e
          .toString()
          .contains('Scheme not starting with alphabetic character')) {
        Get.snackbar('Url inválida',
            'Preencha o protcolo do endereço corretamente: (http://) ou (https://).',
            duration: const Duration(seconds: 5),
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

  Future<void> getApiVersion() async {}
}
