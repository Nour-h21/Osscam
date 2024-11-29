import 'package:flutter/material.dart';
import 'package:osscam_project/core/constants/widgets/filled_button.dart';
import 'package:osscam_project/core/constants/widgets/password_visibility.dart';
import 'package:osscam_project/feature/home/ui/home_page/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/config/service_locater.dart';
import '../../../core/constants/colors/colors.dart';
import '../../../core/constants/strings/strings.dart';
import '../../../core/constants/style/text_style.dart';
import '../../../core/constants/widgets/text_field.dart';
import '../login_page/login_page.dart';
import 'service_signup.dart';
import 'user_model_sign.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool? isChecked = false;
  final TextEditingController firstName = TextEditingController();
  final TextEditingController lastName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors().primary,
        body: Padding(
          padding: const EdgeInsets.only(left: 36, right: 36, top: 30),
          child: ListView(
            children: [
              Stack(alignment: AlignmentDirectional.center, children: [
                Container(
                  width: 340,
                  height: 510,
                  decoration: BoxDecoration(
                    color: AppColors().gray,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(width: 1, color: AppColors().black),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 31, right: 31),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 70, left: 11, bottom: 8),
                          child: Text(
                            AppStrings().firstName,
                            textAlign: TextAlign.left,
                            style: AppTextStyles().logInStyle,
                          ),
                        ),
                        MyTextField(
                          controller: firstName,
                          obscureText: false,
                          suffixIcon: null,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 11, bottom: 8),
                          child: Text(
                            AppStrings().lastName,
                            textAlign: TextAlign.left,
                            style: AppTextStyles().logInStyle,
                          ),
                        ),
                        MyTextField(
                          controller: lastName,
                          obscureText: false,
                          suffixIcon: null,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 11, bottom: 8),
                          child: Text(
                            AppStrings().email,
                            textAlign: TextAlign.left,
                            style: AppTextStyles().logInStyle,
                          ),
                        ),
                        MyTextField(
                          controller: email,
                          obscureText: false,
                          suffixIcon: null,
                        ),
                        const SizedBox(
                          height: 15,
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
                          controller: password,
                          obscureText: true,
                          suffixIcon: const MyPasswordVisibility(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Row(children: [
                            Checkbox(
                              value: isChecked,
                              activeColor: AppColors().primary,
                              checkColor: AppColors().white,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  isChecked = newValue;
                                  getIt
                                      .get<SharedPreferences>()
                                      .setBool("remeberMe", newValue = true);
                                });
                                print(isChecked);
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
                  padding: const EdgeInsets.only(bottom: 520),
                  child: Container(
                    width: 130,
                    height: 130,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/Group 2.png'),
                      ),
                    ),
                  ),
                ),
              ]),
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: MyFilledButton(
                  minimumSize: const Size(325, 60),
                  style: AppTextStyles().logInTextstyle,
                  buttonText: AppStrings().signUpTitle,
                  onPressed: () async {
                    bool status = await signup(
                      UserModelSignUp(
                          firstName: firstName.text,
                          lastName: lastName.text,
                          email: email.text,
                          password: password.text),
                    );
                    // print(token);

                    if (status) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Success"),
                        backgroundColor: Color(0xFFFA9A0C),
                      ));
                      getIt.get<SharedPreferences>().setString("token", token);
                      print(getIt.get<SharedPreferences>().getString("token"));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomePage(),
                          ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Failed"),
                        backgroundColor: Colors.red,
                      ));
                    }
                    print(token);
                    print(refresh);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings().signUpDes,
                      style: AppTextStyles().logInDesStyle,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const LoginPage();
                        }));
                      },
                      child: Text(
                        AppStrings().logInTitle,
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
