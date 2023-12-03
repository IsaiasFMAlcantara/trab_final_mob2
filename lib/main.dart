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
import 'package:list_shopping/view/cadastrarprodutos/listarprodutos.dart';
import 'view/cadastrodeusuario/cadastrodeusuario_.dart';
import 'view/esqueciasenha/esqueciasenha.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/login_',
      theme: FlexThemeData.light(scheme: FlexScheme.blueWhale),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.blueWhale),
      getPages: [
        GetPage(name: '/home', page: () => const HomeScreen()),
        GetPage(name: '/login', page: () => const Login()),
        GetPage(name: '/login_', page: () => const Login_()),
        GetPage(
            name: '/cadastrarusuario', page: () => const CadastroDeUsuario()),
        GetPage(
            name: '/cadastrarusuario_', page: () => const CadastroDeUsuario_()),
        GetPage(name: '/gerenciarconta', page: () => const GerenciarUsuario()),
        GetPage(name: '/listarprodutos', page: () => const ListarProdutos()),
        GetPage(name: '/esqueciasenha_', page: () => const EsqueciASenha()),
      ],
    );
  }
}
