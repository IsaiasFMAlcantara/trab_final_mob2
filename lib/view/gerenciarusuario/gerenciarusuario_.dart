import 'package:flutter/material.dart';
import 'package:list_shopping/control/c_firebase.dart';

class GerenciarUsuario_ extends StatefulWidget {
  const GerenciarUsuario_({Key? key}) : super(key: key);

  @override
  State<GerenciarUsuario_> createState() => _GerenciarUsuario_State();
}

class _GerenciarUsuario_State extends State<GerenciarUsuario_> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        TextField(
          controller: _emailController,
          decoration: InputDecoration(labelText: 'Email'),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: _nameController,
          decoration: InputDecoration(labelText: 'Nome'),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          controller: _senhaControler,
          decoration: InputDecoration(labelText: 'Senha'),
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
          onPressed: () async {
            await atualizarNomeUsuarioFirebase(_emailController.text,
                _nameController.text, _senhaControler.text);
          },
          child: Text('Confirmar'),
        ),
      ],
    ));
  }
}
