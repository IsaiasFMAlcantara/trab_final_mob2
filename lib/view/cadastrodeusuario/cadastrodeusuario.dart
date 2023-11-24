import 'package:flutter/material.dart';
import 'package:list_shopping/custom/customAppBar.dart';
import 'package:list_shopping/custom/customDrawer.dart';
import 'cadastrodeusuario_.dart';

class CadastroDeUsuario extends StatefulWidget {
  const CadastroDeUsuario({super.key});

  @override
  State<CadastroDeUsuario> createState() => _CadastroDeUsuarioState();
}

class _CadastroDeUsuarioState extends State<CadastroDeUsuario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: CustomAppBar(title: 'Cadastro de Usuário'),
      body: CadastroDeUsuario_(),
    );
  }
}
