import 'package:flutter/material.dart';
import 'package:list_shopping/custom/customAppBar.dart';
import 'package:list_shopping/custom/customDrawer.dart';
import 'listarprodutos_.dart';

class ListarProdutos extends StatefulWidget {
  const ListarProdutos({super.key});

  @override
  State<ListarProdutos> createState() => _ListarProdutosState();
}

class _ListarProdutosState extends State<ListarProdutos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Products List'),
      drawer: CustomDrawer(),
      body: ListarProdutos_(),
    );
  }
}
