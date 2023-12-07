import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:list_shopping/control/c_firebase.dart';

class AlertDialogs {
  static void showAddItemDialog(Function(String, int) onAdd, BuildContext context) {
    TextEditingController _nomeItemController = TextEditingController();
    TextEditingController _quantidadeItemController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cadastrar Item'),
          content: Wrap(
            children: [
              Column(
                children: [
                  TextFormField(
                    controller: _nomeItemController,
                    decoration: InputDecoration(
                      labelText: 'Nome do Item',
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _quantidadeItemController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      labelText: 'Quantidade do Item',
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      String nomeItem = _nomeItemController.text;
                      int quantidadeItem = int.tryParse(_quantidadeItemController.text) ?? 0;
                      onAdd(nomeItem, quantidadeItem);
                      Get.back();
                    },
                    child: Text('Cadastrar itens'),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  static void showEditItemDialog(ItemDeCompra item, Function(String, int) onEdit, BuildContext context) {
    TextEditingController _nomeItemController = TextEditingController(text: item.nome);
    TextEditingController _quantidadeItemController = TextEditingController(text: item.quantidade.toString());

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Editar Item'),
          content: Wrap(
            children: [
              Column(
                children: [
                  TextFormField(
                    controller: _nomeItemController,
                    decoration: InputDecoration(
                      labelText: 'Nome do Item',
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _quantidadeItemController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      labelText: 'Quantidade do Item',
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      String nomeItem = _nomeItemController.text;
                      int quantidadeItem = int.tryParse(_quantidadeItemController.text) ?? 0;
                      onEdit(nomeItem, quantidadeItem);
                      Get.back();
                    },
                    child: Text('Salvar alterações'),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
