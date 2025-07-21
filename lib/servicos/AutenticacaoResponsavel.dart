import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tcc/Model/ResponsavelModelo.dart';

class AutenticacaoResponsavel {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> cadastrarResponsavel({
    required String nome,
    required String senha,
    required String telefone,
    required String email,
    required BuildContext context,
  }) async {
    try {
      UserCredential responsavelCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: senha);
      User? user = responsavelCredential.user;
      if (user != null) {
        ResponsavelModel responsavel = ResponsavelModel(
          id: user.uid,
          nome: nome,
          telefone: telefone,
          email: email,
          senha: senha,
          questionariosIds: [],
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("O usuário já está cadastrado"),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
}
