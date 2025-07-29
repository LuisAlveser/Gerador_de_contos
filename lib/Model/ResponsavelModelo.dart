class ResponsavelModel {
  String? id;
  String nome;

  String telefone;
  String email;
  String senha;

  ResponsavelModel({
    this.id,

    required this.nome,
    required this.telefone,
    required this.email,
    required this.senha,
  });

  ResponsavelModel.fromMap(Map<String, dynamic> map)
    : id = map["id"],

      nome = map["nome"],
      telefone = map["telefone"],
      email = map["email"],
      senha = map["senha"];

  Map<String, dynamic> toMap() {
    return {"id": id, "nome": nome, "telefone": telefone, "email": email};
  }
}
