import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tcc/Model/ResponsavelModelo.dart';
import 'package:tcc/Telas/TelaDeInicioApp.dart';

class AutenticacaoResponsavel {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
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
          senha: "",
        );
        await _firestore
            .collection("responsaveis")
            .doc(user.uid)
            .set(responsavel.toMap());
        return user;
      }
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "email-already-in-use") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("O usuário já está cadastrado"),
            backgroundColor: Colors.red,
          ),
        );
      }

      return null;
    }
  }

  Future<DocumentSnapshot?> mostrarResponsavel() async {
    User? currentUser = _auth.currentUser;

    if (currentUser != null) {
      try {
        DocumentSnapshot snapshot =
            await _firestore
                .collection("responsaveis")
                .doc(currentUser.uid)
                .get();

        if (snapshot.exists) {
          return snapshot;
        } else {
          print("Documento do responsável não encontrado no Firestore.");
          return null;
        }
      } catch (e) {
        print("Erro ao buscar responsável: $e");
        return null;
      }
    }

    return null;
  }

  Future<bool> atualizarresponsavel({
    required String novo_nome,
    required String telefene,
    required BuildContext context,
  }) async {
    try {
      User? currentUser = _auth.currentUser;
      if (currentUser == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Erro: Nenhuma sessão de usuário ativa. Faça login novamente.",
            ),
            backgroundColor: Colors.red,
          ),
        );
        return false;
      }

      _firestore.collection('responsaveis').doc(currentUser.uid).update({
        "nome": novo_nome,
        "telefone": telefene,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Responsável atualizado com sucesso!"),
          backgroundColor: Colors.green,
        ),
      );
      mostrarResponsavel();

      return true;
    } on FirebaseException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Erro ao atualizar responsável: ${e.message}"),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Erro inesperado: $e"),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }

  Future<void> recuperarsenha(BuildContext context, String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "E-mail enviado com sucesso, verifique sua caixa de spam!",
          ),
          backgroundColor: Colors.green,
        ),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Erro: ${e.message}"),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Ocorreu um erro inesperado: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> excluirresponsavel({
    required BuildContext context,
    required String currentUser,
  }) async {
    try {
      User? user = _auth.currentUser;
     
       _firestore.collection('responsaveis').doc(currentUser).delete().then((_) {
        user!.delete();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Responsável excluido  com sucesso!"),
            backgroundColor: Colors.green,
          ),
        );
        if (context.mounted) {
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const TelaDeInicio()),
            (Route<dynamic> route) => false,
          );
        }
      });
    } on FirebaseException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Erro ao excluir responsável: ${e.message}"),
          backgroundColor: Colors.red,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Erro inesperado: $e"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
