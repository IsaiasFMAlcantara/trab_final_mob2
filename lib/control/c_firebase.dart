import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserController extends GetxController {
  Rx<User?> _user = Rx<User?>(null);
  User? get user => _user.value;
  @override
  void onInit() {
    super.onInit();
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
  }
}

class LogarBaseFirebase {
  final BuildContext context;
  LogarBaseFirebase(this.context);
  Future<void> logarBase(String email, String senha) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );
      Get.toNamed('/home');
    } catch (e) {
      print('Erro: $e');
    }
  }
}

class DeslogarFirebase {
  Future<void> deslogar() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.toNamed('/login_');
    } catch (e) {
      print('Erro: $e');
    }
  }
}

class CadastrarUsuario {
  final BuildContext context;
  CadastrarUsuario(this.context);
  Future<void> cadastraruser(String email, String senha) async {
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: senha);
      final User? user = userCredential.user;
      if (user != null) {
        Get.toNamed('/login_');
      }
    } catch (e) {
      print('Erro: $e');
    }
  }
}

class ListProdutos {
  Future<List<Map<String, dynamic>>> listprodutos() async {
    final base = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await base.collection('produtos').get();
    List<Map<String, dynamic>> produtos = [];
    querySnapshot.docs.forEach((doc) {
      Map<String, dynamic> produtoData = doc.data() as Map<String, dynamic>;
      produtoData['id'] = doc.id;
      produtos.add(produtoData);
    });
    print(produtos);
    return produtos;
  }
}

Future<void> atualizarNomeUsuarioFirebase(
    String email, String nome, String senha) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: senha,
    );
    User? user = userCredential.user;
    if (user != null) {
      await user.updateDisplayName(nome);
    } else {
      print('Usuário nulo após o login');
    }
  } on FirebaseAuthException catch (e) {
    print('Erro de autenticação: $e');
  } catch (e) {
    print('Erro desconhecido: $e');
  }
}
