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
    String urlAPI = '$urlSite/api_jsonrpc.php';
    Map<String, dynamic> requestBody = {
      "jsonrpc": "2.0",
      "method": "user.login",
      "params": {"username": user, "password": pass},
      "id": 1
    };
    String result = await jsonStringRequest(requestBody, urlAPI);
    apicode.value = result;
    url.value = urlSite;
    usuario.value = user;
    senha.value = pass;

    update();
  }

  Future<void> getApiVersion() async {}

  Future<String> jsonStringRequest(jsonBody, String url) async {
    String requestBodyJson = jsonEncode(jsonBody);

    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{"Content-Type": "application/json"},
      body: requestBodyJson,
    );

    if (response.statusCode == 200) {
      print(jsonDecode(response.body)["result"].toString());
      return jsonDecode(response.body)["result"].toString();
    } else {
      return '';
    }
  }
}
