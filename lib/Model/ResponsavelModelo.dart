import 'package:tcc/Model/QuestinarioModel.dart';

class ResponsavelModel {
  String id;
  String nome;
  String telefone;
  String email;
  String senha;
  List<String>?idquestionario;

  ResponsavelModel({
    required this.id,
     this.idquestionario,
    required this.nome,
    required this.telefone,
    required this.email,
    required this.senha, required List questionariosIds,
   
  });

  ResponsavelModel.fromMap(Map<String, dynamic> map)
    : id = map["id"],
    idquestionario=map["idquestionario"],
      nome = map["nome"],
      telefone = map["telefone"],
      email = map["email"],
      senha = map["senha"];


  Map<String, dynamic> toMap() {
    return {"id": id, "idquestionario":idquestionario,"nome": nome, "telefone": telefone, "email": email};
  }
}
