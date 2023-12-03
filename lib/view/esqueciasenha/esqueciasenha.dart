import 'package:flutter/material.dart';
import 'package:list_shopping/view/esqueciasenha/esqueciasenha_.dart';

class EsqueciASenha extends StatefulWidget {
  const EsqueciASenha({super.key});

  @override
  State<EsqueciASenha> createState() => _EsqueciASenhaState();
}

class _EsqueciASenhaState extends State<EsqueciASenha> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: esqueciasenha_(),
    );
  }
}
