import 'package:flutter/material.dart';

class esqueciasenha_ extends StatefulWidget {
  const esqueciasenha_({super.key});

  @override
  State<esqueciasenha_> createState() => _esqueciasenha_State();
}

class _esqueciasenha_State extends State<esqueciasenha_> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  bool _formValid = false;

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
      _formValid = _emailController.text.isNotEmpty;
    });
  }

  String? _validateInput(String? value) {
    return value?.isEmpty ?? true ? 'Preencha o campo' : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _emailController,
                  decoration: InputDecoration(
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: _formValid ? Colors.blue : Colors.red),
                    ),
                    labelText: 'E-mail',
                  ),
                  validator: _validateInput,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
