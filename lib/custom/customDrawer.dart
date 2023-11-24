import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Card(
            child: ListTile(
              leading: Icon(
                Icons.home,
              ),
              title: Text('Home'),
              onTap: () {
                Get.toNamed('/home');
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.login,
              ),
              title: Text('Login'),
              onTap: () {
                Get.toNamed('/login');
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.exit_to_app,
              ),
              title: Text('Sair'),
              onTap: () {
                Get.toNamed('/login');
              },
            ),
          ),
        ],
      ),
    );
  }
}
