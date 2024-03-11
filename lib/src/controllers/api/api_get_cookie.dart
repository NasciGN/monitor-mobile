import 'package:dio/dio.dart';

class GetCookie {
  Dio dio = Dio();
  Future<String> getCookie(String user, String pass, String url) async {
    FormData formData = FormData.fromMap({
      "name": user,
      "password": pass,
      "enter": "Sign in",
    });

    try {
      Response<dynamic> response = await dio.post(
        "$url/index.php",
        data: formData,
        options: Options(
          followRedirects: false,
          validateStatus: (status) => status! < 500,
        ),
      );

      if (response.statusCode! >= 300 && response.statusCode! < 400) {
        String? setCookieHeader = response.headers.map['set-cookie']?.first;
        if (setCookieHeader != null) {
          String cookie = setCookieHeader.split(';')[0];
          return cookie;
        }
      }
      print('User authorization failed: Login name or password is incorrect.');
      return 'null';
    } catch (e) {
      print('Error during HTTP request: $e');
      return 'null';
    }
  }
}
