import 'package:flutter/material.dart';
import 'package:list_shopping/control/c_firebase.dart';
import 'package:list_shopping/custom/customText.dart';

class ListagemdeProdutos extends StatefulWidget {
  const ListagemdeProdutos({super.key});

  @override
  State<ListagemdeProdutos> createState() => _ListagemdeProdutosState();
}

class _ListagemdeProdutosState extends State<ListagemdeProdutos> {
  final ListarProdutos produtosListar = ListarProdutos();
  List<Map<String, dynamic>> produtos = [];

  Future<void> _carregarProdutos() async {
    final salasData = await produtosListar.listarProdutos();
    setState(() {
      produtos = salasData;
    });
  }

  @override
  void initState() {
    super.initState();
    _carregarProdutos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          final produto = produtos[index];
          return Card(
            child: ListTile(
              title: CustomText(
                title: '${produto['nome']}',
              ),
            ),
          );
        },
      ),
    );
  }
}
