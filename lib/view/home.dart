import 'package:flutter/material.dart';
import 'package:list_shopping/control/c_firebase.dart';
import 'package:list_shopping/custom/customText.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            children: [],
          ),
        ),
      ),
    );
  }
}
