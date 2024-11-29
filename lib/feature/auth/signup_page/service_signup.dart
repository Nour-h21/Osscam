import 'package:dio/dio.dart';

import 'user_model_sign.dart';

String token = "";
String refresh = "";
Future<bool> signup(UserModelSignUp user) async {
  try {
    Dio dio = Dio();
    Response response = await dio.post(
        'http://199.192.19.220:3011/api/v1/auth/register',
        data: user.toMap());
    if (response.statusCode == 200) {
      token = response.data["access_token"];
      refresh = response.data["refresh_token"];
      return true;
    } else {
      print('خطأ في عملية التسجيل');
      return false;
    }
  } catch (e) {
    print(e);
    return false;
  }
}
