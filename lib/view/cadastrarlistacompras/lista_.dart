import 'package:flutter/material.dart';

class CadastrarLista_ extends StatefulWidget {
  const CadastrarLista_({super.key});

  @override
  State<CadastrarLista_> createState() => _CadastrarLista_State();
}

class _CadastrarLista_State extends State<CadastrarLista_> {
  final _formkey = GlobalKey<FormState>();

  bool _formValido = false;
  TextEditingController _nomelista = TextEditingController();

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
    _nomelista.addListener(_validacaoFormulario);
  }

  @override
  void dispose() {
    super.dispose();
    _nomelista.removeListener(_validacaoFormulario);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Form(
              key: _formkey,
              child: Column(
                children: [
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _nomelista,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
