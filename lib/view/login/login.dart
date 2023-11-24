import 'package:flutter/material.dart';
import 'package:list_shopping/custom/customAppBar.dart';
import 'package:list_shopping/custom/customDrawer.dart';
import 'login_.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Área de Login'),drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Login_(),
      ),
    );
  }
}
