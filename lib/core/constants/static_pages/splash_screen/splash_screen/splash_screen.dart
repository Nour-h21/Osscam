import 'package:flutter/material.dart';
import 'package:osscam_project/feature/auth/signup_page/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../../../config/service_locater.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        getIt.get<SharedPreferences>().setBool('firstTime', true);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignUpPage(),),);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.shade300,
    );
  }
}