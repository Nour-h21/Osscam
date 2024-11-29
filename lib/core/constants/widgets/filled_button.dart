import 'package:flutter/material.dart';

import '../colors/colors.dart';

class MyFilledButton extends StatelessWidget {
  final String buttonText;
  final TextStyle style;
  final VoidCallback onPressed;
  final Size minimumSize;
  const MyFilledButton({
    super.key,
    required this.style,
    required this.minimumSize,
    required this.buttonText,
    required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
                    style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                      minimumSize: minimumSize,
                      backgroundColor: AppColors().secondary ,
                    ),
                    onPressed: onPressed,
                    child: Text(buttonText,
                        style:style));
              
  }
}