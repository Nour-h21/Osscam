import 'package:flutter/material.dart';

import '../colors/colors.dart';
import '../style/text_style.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final dynamic suffixIcon;
 const MyTextField({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.suffixIcon,
    });
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                        width: 280,
                        height: 46,
                        child: TextField(
                          style: AppTextStyles().logInTextStyle,
                          textAlign: TextAlign.start,
                          controller: controller,
                          obscureText: obscureText,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColors().third,
                             suffixIcon: suffixIcon,
                            //labelStyle: AppTextStyle().emailStyle,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors().navyBlue, width: 1),
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: AppColors().navyBlue, width: 1),
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                          ),
                        ),
                      );
  }
}