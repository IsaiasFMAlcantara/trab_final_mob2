import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_shopping/custom/customText.dart';

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
              title: CustomText(title: 'Home'),
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
              title: CustomText(title: 'Login'),
              onTap: () {
                Get.toNamed('/login');
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.supervised_user_circle_sharp,
              ),
              title: CustomText(title: 'Cadastrar Usuário'),
              onTap: () {
                Get.toNamed('/cadastrarusuario');
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(
                Icons.exit_to_app,
              ),
              title: CustomText(title: 'Sair'),
              onTap: () {
                Get.toNamed('/login_');
              },
            ),
          ),
        ],
      ),
    );
  }
}
