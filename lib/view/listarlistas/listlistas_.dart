import 'package:flutter/material.dart';
import 'package:list_shopping/view/listarlistas/listagemlistas.dart';

class Listas_ extends StatefulWidget {
  const Listas_({super.key});

  @override
  State<Listas_> createState() => _Listas_State();
}

class _Listas_State extends State<Listas_> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListagemListas(),
        ],
      ),
    );
  }
}
