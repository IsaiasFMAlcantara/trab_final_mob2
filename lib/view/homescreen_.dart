import 'package:flutter/material.dart';
import 'package:list_shopping/view/cadastrarlistacompras/lista.dart';
import 'package:list_shopping/view/home.dart';
import 'package:list_shopping/view/listarlistas/listlistas.dart';

class HomeScreen_ extends StatefulWidget {
  const HomeScreen_({super.key});

  @override
  State<HomeScreen_> createState() => _HomeScreen_State();
}

class _HomeScreen_State extends State<HomeScreen_> {
  int _paginaSelecionada = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _paginaSelecionada,
          children: [
            Home(),
            CadastrarLista(),
            Listas(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _paginaSelecionada,
          onTap: (int? novoValor) {
            setState(() {
              _paginaSelecionada = novoValor!;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add), label: 'Cadastrar Lista'),
            BottomNavigationBarItem(
                icon: Icon(Icons.list_alt), label: 'Listas'),
          ],
        ));
  }
}
