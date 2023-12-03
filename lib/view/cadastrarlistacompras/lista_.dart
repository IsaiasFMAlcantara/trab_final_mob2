import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CadastrarLista_ extends StatefulWidget {
  const CadastrarLista_({Key? key}) : super(key: key);

  @override
  State<CadastrarLista_> createState() => _CadastrarLista_State();
}

class _CadastrarLista_State extends State<CadastrarLista_> {
  final _formKey = GlobalKey<FormState>();

  bool _formValido = false;
  TextEditingController _nomeLista = TextEditingController();
  TextEditingController _compartilhamento = TextEditingController();
  DateTime _diaCompra = DateTime.now();

  String _validarEntrada(String? mensagem) {
    return mensagem == null || mensagem.isEmpty ? 'Preencha o campo' : '';
  }

  Future<void> _CadastrarLista_() async {
    try {
      await FirebaseFirestore.instance.collection('suacolecao').add({
        'nome': _nomeLista.text,
        'dia_compra': _diaCompra,
        'compartilhamento': _compartilhamento.text,
        'itens': [],
      });
    } catch (e) {
      print('Erro ao cadastrar lista: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: _formValido ? Colors.blue : Colors.red),
                      ),
                      labelText: "Nome da lista",
                    ),
                    onChanged: (value) {
                      setState(() {
                        _formValido = value.isNotEmpty;
                      });
                    },
                    validator: _validarEntrada,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _compartilhamento,
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: _formValido ? Colors.blue : Colors.red),
                      ),
                      labelText: "Compartilhamento",
                    ),
                    onChanged: (value) {
                      setState(() {
                        _formValido = value.isNotEmpty;
                      });
                    },
                    validator: _validarEntrada,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InputDatePickerFormField(
                    firstDate: DateTime(1000, 1, 1),
                    lastDate: DateTime(3100, 1, 1),
                    initialDate: DateTime.now(),
                    fieldHintText: '${DateTime.timestamp()}',
                    fieldLabelText: 'Data de compra',
                    onDateSubmitted: (DateTime value) {
                      setState(() {
                        _diaCompra = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() ?? false) {
                  _CadastrarLista_();
                }
              },
              child: Text('Cadastrar Lista'),
            ),
          ],
        ),
      ),
    );
  }
}
