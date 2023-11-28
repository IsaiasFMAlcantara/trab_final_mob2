import 'package:flutter/material.dart';
import 'package:list_shopping/control/c_firebase.dart';
import 'package:list_shopping/custom/customText.dart';

class ListagemdeProdutos extends StatefulWidget {
  const ListagemdeProdutos({Key? key}) : super(key: key);

  @override
  State<ListagemdeProdutos> createState() => _ListagemdeProdutosState();
}

class _ListagemdeProdutosState extends State<ListagemdeProdutos> {
  final ListProdutos produtosListar = ListProdutos();
  List<Map<String, dynamic>> produtos = [];

  Future<void> _carregarProdutos() async {
    produtos = await produtosListar.listprodutos();
    setState(() {});
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
