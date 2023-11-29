import 'package:flutter/material.dart';
import 'package:list_shopping/view/cadastrarlistacompras/lista_.dart';

class CadastrarLista extends StatefulWidget {
  const CadastrarLista({super.key});

  @override
  State<CadastrarLista> createState() => Cadastrar_ListaState();
}

class Cadastrar_ListaState extends State<CadastrarLista> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CadastrarLista_(),
    );
  }
}
