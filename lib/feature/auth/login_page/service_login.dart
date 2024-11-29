import 'package:dio/dio.dart';

import '../signup_page/service_signup.dart';
import 'user_model_log.dart';

String token2 = "";
String refresh2 = "";
Future<bool> login(UserModelLogIn user) async {
  try {
    Dio dio = Dio();
    Response response = await dio.post(
      'http://199.192.19.220:3011/api/v1/auth/login',
      data: user.toMap(),
      options: Options(headers: {"Authorization": "Bearer $token"}),
    );
    if (response.statusCode == 200) {
      token2 = response.data["access_token"];
      refresh2 = response.data["refresh_token"];
      return true;
    } else {
      print("Error in login");
      return false;
    }
  } catch (e) {
    print(e);
    return false;
  }
}
