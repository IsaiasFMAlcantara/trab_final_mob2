import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'view/homescreen.dart';
import 'view/login/login.dart';
import 'view/login/login_.dart';
import 'view/cadastrodeusuario/cadastrodeusuario.dart';
import 'package:list_shopping/view/gerenciarusuario/gerenciarusuario.dart';
import 'package:list_shopping/view/listarprodutos/listarprodutos.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login_',
      theme: FlexThemeData.light(scheme: FlexScheme.mandyRed),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.mandyRed),
      themeMode: ThemeMode.system,
      getPages: [
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/login', page: () => Login()),
        GetPage(name: '/login_', page: () => Login_()),
        GetPage(name: '/cadastrarusuario', page: () => CadastroDeUsuario()),
        GetPage(name: '/gerenciarconta', page: () => GerenciarUsuario()),
        GetPage(name: '/listarprodutos', page: () => ListarProdutos()),
      ],
    ),
  );
}
