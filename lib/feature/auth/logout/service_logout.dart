import 'package:dio/dio.dart';

// String token = "";
Future<bool> logout(token1) async {
  try {
    Dio dio = Dio();
    Response response = await dio.put(
        'http://199.192.19.220:3011/api/v1/auth/logout',
        options: Options(headers: {"Authorization": "Bearer $token1"}));
    if (response.statusCode == 200) {
      print("successfully logged out");
      return true;
    } else {
      print("Error log out");
      return false;
    }
  } catch (e) {
    print(e);
    return false;
  }
}
