import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/config/service_locater.dart';
import '../../../core/constants/colors/colors.dart';
import '../../../core/constants/strings/strings.dart';
import '../../../core/constants/style/text_style.dart';
import '../../../core/constants/widgets/filled_button.dart';
import '../../../core/constants/widgets/password_visibility.dart';
import '../../../core/constants/widgets/text_field.dart';
import '../../home/ui/home_page/home_page.dart';
import '../signup_page/signup_page.dart';
import 'service_login.dart';
import 'user_model_log.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool? isChecked = false;
  final TextEditingController email1 = TextEditingController();

  final TextEditingController password1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors().primary,
        body: Padding(
          padding: const EdgeInsets.only(left: 36, right: 36, top: 105),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(alignment: AlignmentDirectional.center, children: [
                Container(
                  width: 340,
                  height: 390,
                  decoration: BoxDecoration(
                    color: AppColors().gray,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1, color: AppColors().black),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 31, right: 31),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 50, left: 11, bottom: 8),
                          child: Text(
                            AppStrings().email,
                            textAlign: TextAlign.left,
                            style: AppTextStyles().logInStyle,
                          ),
                        ),
                        MyTextField(
                          controller: email1,
                          obscureText: false,
                          suffixIcon: null,
                        ),
                        const SizedBox(
                          height: 34,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 11, bottom: 8),
                          child: Text(
                            AppStrings().password,
                            textAlign: TextAlign.left,
                            style: AppTextStyles().logInStyle,
                          ),
                        ),
                        MyTextField(
                          controller: password1,
                          obscureText: true,
                          suffixIcon: const MyPasswordVisibility(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 50),
                          child: Row(children: [
                            Checkbox(
                              value: isChecked,
                              activeColor: AppColors().primary,
                              checkColor: AppColors().white,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  getIt
                                      .get<SharedPreferences>()
                                      .setBool("remeberMe", newValue = true);
                                  isChecked = newValue;
                                });
                                // print(isChecked);
                              },
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              AppStrings().rememberMe,
                              textAlign: TextAlign.left,
                              style: AppTextStyles().logInStyle,
                            ),
                          ]),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 400),
                  child: Container(
                    width: 140,
                    height: 140,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/Group 2.png'),
                      ),
                    ),
                  ),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: MyFilledButton(
                    minimumSize: const Size(325, 60),
                    style: AppTextStyles().logInTextstyle,
                    buttonText: AppStrings().logInTitle,
                    onPressed: () async {
                      bool status = await login(
                        UserModelLogIn(
                            email1: email1.text, password1: password1.text),
                      );
                      if (status) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Success"),
                          backgroundColor: Color(0xFFFA9A0C),
                        ));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ));
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Failed"),
                          backgroundColor: Colors.red,
                        ));
                      }
                      print(token2);
                      print(refresh2);
                    }),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings().logInDes,
                      style: AppTextStyles().logInDesStyle,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const SignUpPage();
                        }));
                      },
                      child: Text(
                        AppStrings().signUpTitle,
                        style: AppTextStyles().logInDesSignStyle,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
