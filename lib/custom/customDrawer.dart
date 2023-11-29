import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_shopping/control/c_firebase.dart';
import 'package:list_shopping/custom/customText.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final UserController _userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    DeslogarFirebase deslogarBaseFirebase = DeslogarFirebase();
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(_userController.user?.displayName ?? ''),
            accountEmail:
                Text(_userController.user?.email ?? 'No user logged in'),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: _userController.user?.email?.isNotEmpty == true
                  ? Text(
                      _userController.user!.email!
                          .substring(0, 1)
                          .toUpperCase(),
                      style: TextStyle(fontSize: 40.0),
                    )
                  : Image.asset('imagens/logo.png'),
            ),
          ),
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
                Icons.add,
              ),
              title: CustomText(title: 'Itens'),
              onTap: () {
                Get.toNamed('/listarprodutos');
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
                Icons.person,
              ),
              title: CustomText(title: 'Gerenciar Conta'),
              onTap: () {
                Get.toNamed('/gerenciarconta');
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
                deslogarBaseFirebase.deslogar();
              },
            ),
          ),
        ],
      ),
    );
  }
}
