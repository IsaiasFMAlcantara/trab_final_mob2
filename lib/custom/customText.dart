import 'package:flutter/material.dart';

class CustomText extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextDecoration textDecoration;

  const CustomText({
    Key? key,
    required this.title,
    this.color,
    this.fontSize = 20,
    this.fontWeight = FontWeight.bold,
    this.textAlign = TextAlign.left,
    this.textDecoration = TextDecoration.none,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: _getTextStyle(),
      textAlign: textAlign,
    );
  }

  TextStyle _getTextStyle() {
    return TextStyle(
      fontFamily: 'Arial',
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? Colors.white,
      decoration: textDecoration,
    );
  }
}
