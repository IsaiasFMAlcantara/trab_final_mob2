import 'package:flutter/material.dart';
import 'package:list_shopping/custom/customAppBar.dart';
import 'package:list_shopping/custom/customDrawer.dart';
import 'package:list_shopping/view/gerenciarusuario/gerenciarusuario_.dart';

class GerenciarUsuario extends StatefulWidget {
  const GerenciarUsuario({super.key});

  @override
  State<GerenciarUsuario> createState() => _GerenciarUsuarioState();
}

class _GerenciarUsuarioState extends State<GerenciarUsuario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Gerenciar conta'),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: GerenciarUsuario_(),
      ),
    );
  }
}
