import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_shopping/control/c_firebase.dart';
import 'package:list_shopping/custom/customText.dart';
import 'package:list_shopping/view/detalheslista/detalheslist.dart';

class ListagemListas extends StatefulWidget {
  const ListagemListas({Key? key}) : super(key: key);

  @override
  State<ListagemListas> createState() => _ListagemListasState();
}

class _ListagemListasState extends State<ListagemListas> {
  final ListListas listasController = ListListas();
  List<dynamic> listas = [];

  @override
  void initState() {
    super.initState();
    _carregarListas();
  }

  Future<void> _carregarListas() async {
    List<Map<String, dynamic>> listasData = await listasController.listListas();
    setState(() {
      listas = listasData.isNotEmpty ? listasData[0]['lista'] : [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listas.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final lista = listas[index];
        return Card(
          child: ListTile(
            title: CustomText(
              title: 'Nome: ${lista['nome']}',
            ),
            onTap: () {
              Get.to(
                DetalhesList(lista: lista),
              );
            },
          ),
        );
      },
    );
  }
}
