class HistoriaModeloReal {
  String idhistoria;
  String idquestionario;
  String texto;
  DateTime data;
  String? urlimagem;

  HistoriaModeloReal({
    required this.idhistoria,
    required this.idquestionario,
    required this.texto,
    required this.data,
    this.urlimagem,
  });

  HistoriaModeloReal.fromMap(Map<String, dynamic> map)
    : idhistoria = map["id_historia"],
      idquestionario = map["id_questionario"],
      texto = map["texto"],
      data = map["data"],
      urlimagem = map["urlimagem"];

  Map<String, dynamic> toMap() {
    return {
      "id_historia": idhistoria,
      "id_questionario": idquestionario,
      "texto": texto,
      "data": data,
      "urlimagem": urlimagem,
    };
  }
}
