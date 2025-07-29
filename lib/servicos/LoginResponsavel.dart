import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tcc/Model/ResponsavelModelo.dart';

class Loginresponsavel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> loginResponsavel({
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
        print(
          "Loginresponsavel: Usuário autenticado com sucesso. UID: ${user.uid}",
        );

        DocumentSnapshot doc =
            await _firestore.collection('responsaveis').doc(user.uid).get();

        if (doc.exists && doc.data() != null) {
          try {
            return user;
          } catch (eFromMap) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  "Erro ao processar dados do responsável: ${eFromMap.toString()}",
                ),
                backgroundColor: Colors.red,
              ),
            );
            return null;
          }
        } else {
          print(
            "Loginresponsavel: Usuário logado, mas dados do responsável não encontrados no Firestore para UID: ${user.uid}",
          );
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Dados do responsável não encontrados. Por favor, tente novamente ou cadastre-se.",
              ),
              backgroundColor: Colors.orange,
            ),
          );
          return null;
        }
      }
      return null;
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      if (e.code == 'user-not-found') {
        errorMessage = "Nenhum usuário encontrado para esse e-mail.";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Senha incorreta.";
      } else if (e.code == 'invalid-email') {
        errorMessage = "O formato do e-mail é inválido.";
      } else if (e.code == 'too-many-requests') {
        errorMessage =
            "Muitas tentativas de login. Tente novamente mais tarde.";
      } else {
        errorMessage = "Erro de autenticação senha ou usuário incorretos";
      }
      print("Loginresponsavel: Erro de autenticação");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
      );
      return null;
    } catch (e) {
      print(
        "Loginresponsavel: Ocorreu um erro INESPERADO: ${e.runtimeType} - $e",
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Ocorreu um erro inesperado: ${e.toString()}"),
          backgroundColor: Colors.red,
        ),
      );
      return null;
    }
  }
}
