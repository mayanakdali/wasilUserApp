import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class UserText extends StatelessWidget {
  final String title;
  final Color textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;

  const UserText(
      {Key? key,
        required this.title,
        this.textColor = Colors.black,
        this.fontWeight,
  this.letterSpacing,
        this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: textColor,
          fontSize: fontSize ?? 11.sp,
          fontWeight: fontWeight ?? FontWeight.normal,
      letterSpacing: letterSpacing),
    );
  }
}