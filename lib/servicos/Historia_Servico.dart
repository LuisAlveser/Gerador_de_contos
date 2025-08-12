import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tcc/Model/HistoriaModeloreal.dart';

class HistoriaService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<bool> cadastrarHistoria({
    required HistoriaModeloReal historiamodel,
    required BuildContext context,
  }) async {
    User? currentUser = _auth.currentUser;
    String docId =
        historiamodel.idhistoria.isNotEmpty
            ? historiamodel.idhistoria
            : _firestore.collection('historias').doc().id;
    historiamodel.idhistoria = docId;
    if (currentUser != null) {
      try {
        await _firestore
            .collection('responsaveis')
            .doc(currentUser.uid)
            .collection('questionario')
            .doc(historiamodel.idquestionario)
            .collection("historias")
            .doc(docId)
            .set(historiamodel.toMap());
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("História salva com sucesso!"),
              backgroundColor: Colors.green,
            ),
          );
          return true;
        }
      } on FirebaseException catch (e) {
        if (context.mounted) {
          print("Erro do Firebase: ${e.code} - ${e.message}");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Erro ao salvar a história: ${e.message}"),
              backgroundColor: Colors.red,
            ),
          );
        }
      } catch (e) {
        if (context.mounted) {
          print("Ocorreu um erro inesperado: $e");
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Ocorreu um erro inesperado."),
              backgroundColor: Colors.red,
            ),
          );
          return false;
        }
      }
    }
    return false;
  }

  Future<List<QueryDocumentSnapshot<Object?>>>
  getHistoriasPorQuestionarios() async {
    User? currentUser = _auth.currentUser;
    print(currentUser);

    final questionariosSnapshot =
        await _firestore
            .collection('responsaveis')
            .doc(currentUser?.uid)
            .collection('questionario')
            .get();

    List<QueryDocumentSnapshot> todasHistorias = [];

    for (var doc in questionariosSnapshot.docs) {
      final historiasSnapshot =
          await _firestore
              .collection('responsaveis')
              .doc(currentUser?.uid)
              .collection('questionario')
              .doc(doc.id)
              .collection('historias')
              .get();

      todasHistorias.addAll(historiasSnapshot.docs);
    }

    return todasHistorias;
  }

  Future<void> excluirHistoriaPorId({
    required String idHistoria,
    required String idquestionario,
  }) async {
    User? currentUser = _auth.currentUser;

    if (currentUser != null) {
      try {
        await _firestore
            .collection('responsaveis')
            .doc(currentUser.uid)
            .collection('questionario')
            .doc(idquestionario)
            .collection('historias')
            .doc(idHistoria)
            .delete();

        print("História com ID '$idHistoria' excluída com sucesso.");
        getHistoriasPorQuestionarios();
      } on FirebaseException catch (e) {
        SnackBar(
          content: Text("Ocorreu um erro inesperado: ${e.toString()}"),
          backgroundColor: Colors.red,
        );
      } catch (e) {
        SnackBar(
          content: Text("Ocorreu um erro inesperado: ${e.toString()}"),
          backgroundColor: Colors.red,
        );
      }
    }
  }

  
}
