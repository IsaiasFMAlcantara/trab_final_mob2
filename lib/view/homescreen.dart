import 'package:flutter/material.dart';
import 'package:list_shopping/custom/customAppBar.dart';
import 'package:list_shopping/custom/customDrawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Home'),
      drawer: CustomDrawer(),
      body: const Column(
        children: [],
      ),
    );
  }
}
