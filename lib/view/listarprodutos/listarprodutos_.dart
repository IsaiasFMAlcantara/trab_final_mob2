import 'package:flutter/material.dart';
import 'package:list_shopping/custom/customText.dart';
import 'package:list_shopping/view/listarprodutos/listagemdeprodutos.dart';

class ListarProdutos_ extends StatefulWidget {
  const ListarProdutos_({Key? key}) : super(key: key);

  @override
  _ListarProdutos_State createState() => _ListarProdutos_State();
}

class _ListarProdutos_State extends State<ListarProdutos_> {
  final _formkey = GlobalKey<FormState>();

  bool _formValido = false;
  TextEditingController _campovalido = TextEditingController();

  void _validacaoFormulario() {
    _formkey.currentState?.validate();
  }

  String _validarEntrada(String? mensagem) {
    if (mensagem == null || mensagem.isEmpty) {
      return 'Preencha o campo';
    } else {
      return 'Campo preenchido';
    }
  }

  @override
  void initState() {
    super.initState();
    _campovalido.addListener(_validacaoFormulario);
  }

  @override
  void dispose() {
    super.dispose();
    _campovalido.removeListener(_validacaoFormulario);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: _campovalido,
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: _formValido ? Colors.blue : Colors.red),
                        ),
                        labelText: "Nome do produto",
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
                    ElevatedButton(
                      onPressed: () {},
                      child: CustomText(title: 'Cadastrar Item'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: ListagemdeProdutos(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
