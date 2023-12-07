import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'alert.dart';
import 'package:list_shopping/control/c_firebase.dart';

class CadastrarLista_ extends StatefulWidget {
  const CadastrarLista_({super.key});

  @override
  State<CadastrarLista_> createState() => _CadastrarLista_State();
}

class _CadastrarLista_State extends State<CadastrarLista_> {
  final _formKey = GlobalKey<FormState>();
  bool _formValid = false;
  TextEditingController _nomeLista = TextEditingController();
  List<ItemDeCompra> _itens = [];
  final DateTime now = DateTime.now();
  late DateTime dateSelection;

  void _validateForm() {}

  String _validarEntrada(String? mensagem) {
    return mensagem ?? '';
  }

  void _adicionarItem(String nome, int quantidade) {
    setState(() {
      _itens.add(ItemDeCompra(nome, quantidade));
    });
  }

  void _editarItem(int index) {
    ItemDeCompra item = _itens[index];
    AlertDialogs.showEditItemDialog(item, (nome, quantidade) {
      _atualizarItem(index, nome, quantidade);
    }, context);
  }

  void _atualizarItem(int index, String nome, int quantidade) {
    setState(() {
      _itens[index] = ItemDeCompra(nome, quantidade);
    });
  }

  void _removerItem(int index) {
    setState(() {
      _itens.removeAt(index);
    });
  }

  void _cadastrarLista() {
    String nomeLista = _nomeLista.text;
    ListaDeCompras novaLista = ListaDeCompras(nomeLista, _itens);
    _nomeLista.clear();
    setState(() {
      _itens.clear();
    });
    Get.snackbar('Sucesso', 'Lista de compras cadastrada com sucesso');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _nomeLista,
                      decoration: InputDecoration(
                        errorStyle: TextStyle(
                            color: _formValid ? Colors.blue : Colors.red),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: _formValid ? Colors.blue : Colors.red,
                          ),
                        ),
                        labelText: "Nome lista",
                      ),
                      onChanged: (value) {
                        setState(() {
                          _formValid = value.isNotEmpty;
                        });
                      },
                      validator: _validarEntrada,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _nomeLista,
                      onTap: () async {
                        dateSelection = (await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1980),
                          lastDate: DateTime(DateTime.now().year + 1),
                        ))!;
                      },
                      decoration: InputDecoration(
                        errorStyle: TextStyle(
                            color: _formValid ? Colors.blue : Colors.red),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: _formValid ? Colors.blue : Colors.red,
                          ),
                        ),
                        labelText: "Data da compra",
                      ),
                      onChanged: (value) {
                        setState(() {
                          _formValid = value.isNotEmpty;
                        });
                      },
                      validator: _validarEntrada,

                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _nomeLista,
                      decoration: InputDecoration(
                        errorStyle: TextStyle(
                            color: _formValid ? Colors.blue : Colors.red),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: _formValid ? Colors.blue : Colors.red,
                          ),
                        ),
                        labelText: "Compartilhar",
                      ),
                      onChanged: (value) {
                        setState(() {
                          _formValid = value.isNotEmpty;
                        });
                      },
                      validator: _validarEntrada,
                    ),

                  ],
                ),
              ),
              const Divider(),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _itens.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_itens[index].nome),
                      subtitle: Text('Quantidade: ${_itens[index].quantidade}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              _editarItem(index);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              _removerItem(index);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              AlertDialogs.showAddItemDialog(_adicionarItem, context);
            },
            child: const Icon(Icons.add),
          ),
          SizedBox(height: 16),
          FloatingActionButton(
            onPressed: _formValid ? _cadastrarLista : null,
            child: const Icon(Icons.save),
          ),
        ],
      ),
    );
  }
}
