import 'dart:ui';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../colors/colors.dart';

class MyDottedBorder extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final double width;
  final double height;

  const MyDottedBorder({
    super.key, 
    required this.onPressed, 
    required this.child ,
    required this.width,
    required this.height,});

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color:AppColors().white, 
      borderType: BorderType.RRect,
      dashPattern: const [8,5],
      strokeWidth: 2,
      radius: const Radius.circular(15),
      child: InkWell(
        onTap: onPressed,
        child:SizedBox(
          width: width,
          height: height,
          child:child,
        ),
      ),
    );
  }
}

