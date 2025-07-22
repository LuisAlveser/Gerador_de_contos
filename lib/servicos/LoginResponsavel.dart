import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tcc/Model/ResponsavelModelo.dart';

class Loginresponsavel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<ResponsavelModel?> loginResponsavel({
    required String email,
    required String senha,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: senha,
      );
      User? user = userCredential.user;

      if (user != null) {
     
        DocumentSnapshot doc =
            await _firestore.collection('responsaveis').doc(user.uid).get();
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = "Nenhum usuário encontrado para esse e-mail.";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Senha incorreta.";
      } else if (e.code == 'invalid-email') {
        errorMessage = "O formato do e-mail é inválido.";
      } else {
        errorMessage = "Erro de login";
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Ocorreu um erro inesperado: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }
    return null;
  }
}
