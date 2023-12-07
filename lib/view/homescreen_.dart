import 'package:flutter/material.dart';
import 'package:list_shopping/view/cadastrarlistas/cadLista.dart';
import 'package:list_shopping/view/home.dart';
import 'package:list_shopping/view/listarlistas/listlistas.dart';

class HomeScreen_ extends StatefulWidget {
  const HomeScreen_({Key? key}) : super(key: key);

  @override
  State<HomeScreen_> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen_> {
  int _paginaSelecionada = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _paginaSelecionada,
        children: [
          Home(),
          CadastrarListaN(),
          Listas(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _paginaSelecionada,
        onTap: (int novoValor) {
          _atualizarPagina(novoValor);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add), label: 'Cadastrar Lista'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt), label: 'Listas'),
        ],
      ),
    );
  }

  void _atualizarPagina(int novoValor) {
    setState(() {
      _paginaSelecionada = novoValor;
    });
  }
}
