import 'package:flutter/material.dart';
import 'package:list_shopping/custom/customAppBar.dart';
import 'package:list_shopping/custom/customDrawer.dart';
import 'package:list_shopping/custom/customText.dart';

class DetalhesList extends StatefulWidget {
  final Map<String, dynamic> lista;

  const DetalhesList({required this.lista});

  @override
  State<DetalhesList> createState() => _DetalhesListState();
}

class _DetalhesListState extends State<DetalhesList> {
  @override
  Widget build(BuildContext context) {
    final dadosLista = widget.lista;

    return Scaffold(
      appBar: CustomAppBar(
        title: '${widget.lista['nome']}',
      ),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomText(
              title: 'Criador: ${dadosLista['criador']}',
            ),
            CustomText(
              title: 'Compartilhamento: ${dadosLista['compartilhamento']}',
            ),
            dadosLista['itens'].isEmpty
                ? CustomText(
                    title: 'Lista Vazia',
                  )
                : ListView.builder(
                    itemCount: dadosLista['itens'].length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final item = dadosLista['itens'][index];
                      return Card(
                        child: ListTile(
                          title: CustomText(
                            title: 'Item: ${item['nome']}',
                          ),
                          subtitle: CustomText(
                              title: 'Quantidade: ${item['quantidade']}'),
                        ),
                      );
                    },
                  )
          ],
        ),
      ),
    );
  }
}
