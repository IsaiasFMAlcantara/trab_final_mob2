import 'package:flutter/material.dart';
import 'package:list_shopping/custom/customText.dart';
import 'package:list_shopping/control/c_firebase.dart';

class CadastroDeUsuario_ extends StatefulWidget {
  const CadastroDeUsuario_({super.key});

  @override
  State<CadastroDeUsuario_> createState() => _CadastroDeUsuario_State();
}

class _CadastroDeUsuario_State extends State<CadastroDeUsuario_> {
  final _formkey = GlobalKey<FormState>();

  bool _formValido = false;
  TextEditingController _emailvalido = TextEditingController();

  TextEditingController _senhavalida = TextEditingController();

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
    _emailvalido.addListener(_validacaoFormulario);
    _senhavalida.addListener(_validacaoFormulario);
  }

  @override
  void dispose() {
    super.dispose();
    _emailvalido.removeListener(_validacaoFormulario);
    _senhavalida.removeListener(_validacaoFormulario);
  }

  @override
  Widget build(BuildContext context) {
    CadastrarUsuario cadastrarUsuario = CadastrarUsuario(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Form(
              key: _formkey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _emailvalido,
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: _formValido ? Colors.blue : Colors.red),
                      ),
                      labelText: "E-mail",
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
                    obscureText: true,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _senhavalida,
                    decoration: InputDecoration(
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: _formValido ? Colors.blue : Colors.red)),
                      labelText: "Password",
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
                    onPressed: () {
                      cadastrarUsuario.cadastraruser(
                          _emailvalido.text, _senhavalida.text);
                    },
                    child: CustomText(
                      title: 'Cadastrar Usuário',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
