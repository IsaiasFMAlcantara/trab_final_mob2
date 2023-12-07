import 'package:flutter/material.dart';
import 'package:list_shopping/view/CadastrarListas/cadLista_.dart';

class CadastrarListaN extends StatefulWidget {
  const CadastrarListaN({super.key});

  @override
  State<CadastrarListaN> createState() => _CadastrarListaNState();
}

class _CadastrarListaNState extends State<CadastrarListaN> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CadastrarLista_(),
    );
  }
}
