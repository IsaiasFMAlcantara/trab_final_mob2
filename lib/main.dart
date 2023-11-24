import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

import 'view/homescreen.dart';
import 'view/login/login.dart';
import 'view/login/login_.dart';
import 'view/cadastrodeusuario/cadastrodeusuario.dart';
import 'view/cadastrodeusuario/cadastrodeusuario_.dart';

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
        GetPage(name: '/login', page: () => Login()),
        GetPage(name: '/login_', page: () => Login_()),
        GetPage(name: '/cadastrarusuario', page: () => CadastroDeUsuario()),
        GetPage(name: '/cadastrarusuario_', page: () => CadastroDeUsuario_()),
      ],
    ),
  );
}
