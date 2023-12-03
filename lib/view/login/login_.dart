import 'package:flutter/material.dart';
import 'package:list_shopping/control/c_firebase.dart';
import 'package:list_shopping/custom/customText.dart';
import 'package:get/get.dart';

class Login_ extends StatefulWidget {
  const Login_({Key? key}) : super(key: key);

  @override
  _Login_State createState() => _Login_State();
}

class _Login_State extends State<Login_> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _formValid = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
  }

  @override
  void dispose() {
    _emailController.removeListener(_validateForm);
    _passwordController.removeListener(_validateForm);
    super.dispose();
  }

  void _validateForm() {
    setState(() {
      _formValid = _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
    });
  }

  String? _validateInput(String? value) {
    return value?.isEmpty ?? true ? 'Preencha o campo' : null;
  }

  @override
  Widget build(BuildContext context) {
    LogarBaseFirebase logarBaseFirebase = LogarBaseFirebase(context);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: _formValid ? Colors.blue : Colors.red),
                    ),
                    labelText: 'Password',
                  ),
                  validator: _validateInput,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/esqueciasenha_');
                      },
                      child: Text('Esqueci a senha!!'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed('/cadastrarusuario');
                      },
                      child: Text('Crie sua conta'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: _formValid
                      ? () {
                          logarBaseFirebase.logarBase(
                              _emailController.text, _passwordController.text);
                        }
                      : null,
                  child: CustomText(
                    title: 'Login',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
