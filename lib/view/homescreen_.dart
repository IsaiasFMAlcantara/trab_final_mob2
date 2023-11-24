import 'package:flutter/material.dart';
import 'package:list_shopping/view/home.dart';

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
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Listas'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Favoritas'),
          ],
        ));
  }
}
