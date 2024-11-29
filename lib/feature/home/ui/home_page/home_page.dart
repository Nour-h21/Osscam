import 'package:flutter/material.dart';
import 'package:osscam_project/core/constants/colors/colors.dart';
import 'package:osscam_project/core/constants/strings/strings.dart';
import 'package:osscam_project/core/constants/widgets/filled_button.dart';
import 'package:osscam_project/core/constants/widgets/Dotted_Border.dart';
import 'package:osscam_project/feature/auth/logout/service_logout.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/config/service_locater.dart';
import '../../../../core/constants/style/text_style.dart';
import '../../../auth/login_page/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors().primary,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 8,
              ),
              Image.asset(
                'assets/images/Group 34.png',
              ),
              MyFilledButton(
                  minimumSize: const Size(310, 60),
                  style: AppTextStyles().createStyle,
                  buttonText: AppStrings().create,
                  onPressed: () {}),
              const SizedBox(
                height: 40,
              ),
              MyDottedBorder(
                width: 290,
                height: 48,
                onPressed: () {getIt.get<SharedPreferences>().clear();},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/add (2) 1.png',
                      width: 45,
                      height: 45,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      AppStrings().join,
                      style: AppTextStyles().joinStyle,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              IconButton(
                  onPressed: () async {
                    final token1 = getIt.get<SharedPreferences>().getString("token");
                    final success = await logout(token1);
                    if (success) {
                      // getIt.get<SharedPreferences>().clear();
                      getIt.get<SharedPreferences>().getBool('remeberMe') == false;
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ));
                    } else {
                      print('Error');
                    }
                  },
                  icon: Icon(Icons.logout,color: AppColors().white,))
            ],
          ),
        ),
      ),
    );
  }
}
