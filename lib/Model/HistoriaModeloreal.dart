import 'dart:ffi';

class HistoriaModeloReal {
  String idhistoria;
  String idquestionario;
  String texto;
  DateTime data;
  String? urlimagem;
  String? urlimagem2;
 
  double nota;

  HistoriaModeloReal({
    required this.idhistoria,
    required this.idquestionario,
    required this.texto,
    required this.data,
    this.urlimagem,
    this.urlimagem2,
   
    required this.nota,
  });

  HistoriaModeloReal.fromMap(Map<String, dynamic> map)
    : idhistoria = map["id_historia"],
      idquestionario = map["id_questionario"],
      texto = map["texto"],
      data = map["data"],
      urlimagem = map["urlimagem"],
      urlimagem2 = map["urlimagem2"],
      
      nota = map["nota"];

  Map<String, dynamic> toMap() {
    return {
      "id_historia": idhistoria,
      "id_questionario": idquestionario,
      "texto": texto,
      "data": data,
      "urlimagem": urlimagem,
      "urlimagem2": urlimagem2,
      "nota":nota,      
    };
  }
}
