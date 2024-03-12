import 'dart:async';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

class UserApi extends GetxController {
  final dio = Dio();
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
      final response = await dio
          .post('$url/api_jsonrpc.php',
              data: json,
              options: Options(headers: {
                'Content-Type': 'application/json',
              }))
          .timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        if (response.data["result"] != null) {
          result = response.data["result"].toString();
        } else {
          throw Exception('Erro ao buscar dados da API');
        }
        Get.snackbar('Sucesso', 'Usuário logado com sucesso.',
            backgroundColor: const Color.fromARGB(255, 34, 95, 29),
            duration: const Duration(seconds: 5),
            snackPosition: SnackPosition.BOTTOM);
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
        Get.snackbar(
          'Url inválida',
          'Verifique a Url cadastrada, ela precisa estar de acordo com o seguinte exemplo: \nhttp(s)://Endereço_ou_Dominio_do_Servidor(/zabbix).',
          duration: const Duration(seconds: 5),
          backgroundColor: const Color.fromARGB(255, 128, 36, 46),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
      if (e
          .toString()
          .contains('Scheme not starting with alphabetic character')) {
        Get.snackbar('Url inválida',
            'Preencha o protcolo do endereço corretamente: (http://) ou (https://).',
            duration: const Duration(seconds: 5),
            backgroundColor: const Color.fromARGB(255, 128, 36, 46),
            snackPosition: SnackPosition.BOTTOM);
      }
    }
  }

  Future<void> getApiVersion() async {}
}
