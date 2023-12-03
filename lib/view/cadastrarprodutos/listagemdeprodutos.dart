import 'dart:async';

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
  final StreamController<List<dynamic>> _streamController =
      StreamController<List<dynamic>>();

  _carregarProdutos() async {
    List<Map<String, dynamic>> produtosData = await produtoslist.listprodutos();
    setState(() {
      produtos = produtosData[0]['alimentos'];
    });

    // Adiciona a lista atualizada ao stream
    _streamController.add(produtos);

    // Adiciona um listener ao stream
    _streamController.stream.listen((produtos) {
      setState(() {
        this.produtos = produtos;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _carregarProdutos();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<dynamic>>(
      stream: _streamController.stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }

        return ListView.builder(
          itemCount: snapshot.data!.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final produto = snapshot.data![index];
            return Card(
              child: ListTile(
                title: CustomText(
                  title: '${produto['nome']}',
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }
}
