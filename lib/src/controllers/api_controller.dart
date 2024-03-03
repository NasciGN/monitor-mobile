import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:monitor_mobile/src/controllers/user/user_api.dart';

class GetData {
  UserApi userapi;
  late String token;
  late String url;

  GetData() : userapi = Get.find<UserApi>() {
    // token = userapi.apicode.value;
    // url = '${userapi.url.value}/api_jsonrpc.php';
  }

  Future<dynamic> getData(var json) async {
    json["auth"] = token;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(json),
      );

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final result = responseBody["result"];
        print(result);
        return result;
      } else {
        throw Exception(
            'Falha ao buscar dados: ERRO COD. ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Falha ao buscar dados: $error');
    }
  }
}
