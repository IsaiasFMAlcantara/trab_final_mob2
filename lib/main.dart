import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'view/homescreen.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      theme: FlexThemeData.light(scheme: FlexScheme.mandyRed),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
      themeMode: ThemeMode.system,
      getPages: [
        GetPage(name: '/home', page: () => HomeScreen()),
      ],
    ),
  );
}
