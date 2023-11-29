import 'package:flutter/material.dart';
import 'package:list_shopping/control/c_firebase.dart';
import 'package:list_shopping/custom/customText.dart';

class ListagemdeProdutos extends StatefulWidget {
  const ListagemdeProdutos({Key? key}) : super(key: key);

  @override
  State<ListagemdeProdutos> createState() => _ListagemdeProdutosState();
}

class _ListagemdeProdutosState extends State<ListagemdeProdutos> {
  final ListProdutos produtoslist = ListProdutos();
  List<dynamic> produtos = [];
  _carregarProdutos() async {
    List<Map<String, dynamic>> produtosData = await produtoslist.listprodutos();
    setState(() {
      produtos = produtosData[0]['alimentos'];
    });
  }

  @override
  void initState() {
    super.initState();
    _carregarProdutos();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: produtos.length,
      shrinkWrap: true,
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
    );
  }
}
