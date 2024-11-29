import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/static_pages/splash_screen/splash_screen/splash_screen.dart';


final getIt = GetIt.instance;

 setup() async {
  getIt.registerSingleton(await SharedPreferences.getInstance());
  getIt.get<SharedPreferences>().setBool('firstTime', true);
  getIt.registerSingleton<SplashScreen>(SplashScreen());
  // getIt.get<SharedPreferences>().getString("token");
}

// setToken() async {
//  getIt.get<SharedPreferences>().setString("token" , token);
// }
// getToken() async {
//  getIt.get<SharedPreferences>().getString("token");
// }