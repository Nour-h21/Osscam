import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/config/service_locater.dart';
import 'feature/auth/signup_page/signup_page.dart';
// import 'core/constants/static_pages/splash_screen/splash_screen/splash_screen.dart';
// import 'feature/auth/login_page/login_page.dart';
// import 'feature/auth/signup_page/service_signup.dart';
// import 'feature/home/ui/home_page/home_page.dart';


void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // setup();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print(getIt.get<SharedPreferences>().getString("token"));
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
       home: SignUpPage(),
    );
  }
}




