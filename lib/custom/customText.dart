import 'package:flutter/material.dart';

class CustomText extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? color;

  const CustomText({Key? key, required this.title, this.color})
      : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontFamily: 'Arial',
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
