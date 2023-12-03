import 'dart:async';
import 'package:flutter/material.dart';
import 'package:list_shopping/custom/customText.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DateTime dataAtual;

  @override
  void initState() {
    super.initState();
    dataAtual = DateTime.now();
    _startTimer();
  }

  void _startTimer() {
    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (mounted) {
        _updateDateTime();
      }
    });
  }

  void _updateDateTime() {
    setState(() {
      dataAtual = DateTime.now();
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: CustomText(
                  title:
                      '${dataAtual.day}/${dataAtual.month}/${dataAtual.year} ${dataAtual.hour}:${dataAtual.minute}',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Image.asset(
                'imagens/logo.png',
                height: screenHeight * 0.6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
