import 'package:flutter/material.dart';
import 'package:list_shopping/control/c_firebase.dart';
import 'package:list_shopping/custom/customText.dart';

class ListagemListas extends StatefulWidget {
  const ListagemListas({super.key});

  @override
  State<ListagemListas> createState() => _ListagemListasState();
}

class _ListagemListasState extends State<ListagemListas> {
  final ListListas Listaslist = ListListas();
  List<dynamic> listas = [];
  _carregarListas() async {
    List<Map<String, dynamic>> ListasData = await Listaslist.listListas();
    setState(() {
      listas = ListasData[0]['lista'];
    });
  }

  @override
  void initState() {
    super.initState();
    _carregarListas();
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
              title: '${lista['nome']}',
            ),
            subtitle: CustomText(
              title: '${lista['itens']}',
            ),
          ),
        );
      },
    );
  }
}
