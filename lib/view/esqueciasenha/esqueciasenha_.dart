import 'package:flutter/material.dart';
import 'package:list_shopping/control/c_firebase.dart';
import 'package:list_shopping/custom/customText.dart';

class esqueciasenha_ extends StatefulWidget {
  const esqueciasenha_({Key? key}) : super(key: key);

  @override
  _esqueciasenha_State createState() => _esqueciasenha_State();
}

class _esqueciasenha_State extends State<esqueciasenha_> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _emailController.removeListener(_validateForm);
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      // Utilizei a função `isEmpty` diretamente, pois ela já retorna um valor booleano
      _formKey.currentState?.validate();
    });
  }

  String? _validateInput(String? value) {
    return value?.isEmpty ?? true ? 'Preencha o campo' : null;
  }

  @override
  Widget build(BuildContext context) {
    RedefinirSenha redefinirSenha = RedefinirSenha(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  title: 'Informe o e-mail que será recuperada a senha',
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _emailController,
                  decoration: InputDecoration(
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: _formKey.currentState?.validate() == null
                            ? Colors.blue
                            : Colors.red,
                      ),
                    ),
                    labelText: 'E-mail',
                  ),
                  validator: _validateInput,
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  child: Text('Enviar'),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      redefinirSenha.redefinirsenha(
                        _emailController.text,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
