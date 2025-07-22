import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tcc/Model/QuestinarioModel.dart';

class QuestionarioService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> salvarQuestionario({
    required QuestionarioModel questionario,
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

      if (questionario.idresponsavel != currentUser.uid) {
        questionario.idresponsavel = currentUser.uid;
        print(
          "Aviso: idresponsavel no modelo foi ajustado para o ID do usuário logado.",
        );
      }

      String docId =
          questionario.idquestionario.isNotEmpty
              ? questionario.idquestionario
              : _firestore.collection('questionarios').doc().id;
      questionario.idquestionario = docId;

      await _firestore
          .collection('responsaveis')
          .doc(currentUser.uid)
          .collection('Questionario')
          .doc(docId)
          .set(questionario.toMap());

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Questionário salvo com sucesso!"),
          backgroundColor: Colors.green,
        ),
      );
      return true;
    } on FirebaseException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Erro ao salvar questionário: ${e.message}"),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Ocorreu um erro inesperado: $e"),
          backgroundColor: Colors.red,
        ),
      );
      return false;
    }
  }

  Future<Stream<List<QuestionarioModel>>> getQuestionariosPorResponsavel() async {
    User? currentUser = _auth.currentUser;
     return _firestore
        .collection('responsaveis')
        .doc(currentUser!.uid)
        .collection('questionarios')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return QuestionarioModel.fromMap(doc.data());
      }).toList();
    });

  }
}
