import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tcc/Model/QuestinarioModel.dart';

class Pagina3Data {
  String selecionadoAcompanhamento;
  String selecionadoRelacaoLivros;
  String selecionadoRelacaoComTecnologia;

  Pagina3Data({
   required  this.selecionadoAcompanhamento,
    required this.selecionadoRelacaoLivros,
    required this.selecionadoRelacaoComTecnologia,
  });
  Map<String, dynamic> toJson() {
    return {
      'Acompanhamento': selecionadoAcompanhamento,
      'RelacaoLivros': selecionadoRelacaoLivros,
      'RelacaoTecnologia': selecionadoRelacaoComTecnologia,
    };
  }
}

class Pagina3FormCrianca extends StatefulWidget {
  final GlobalKey<FormState> formKey;
 final DocumentSnapshot? doc;
  final ValueChanged<Pagina3Data> onDataChanged;
  const Pagina3FormCrianca({
    super.key,
    required this.formKey,
    required this.onDataChanged, 
    Pagina3Data? initialData,
   this.doc,
  });

  @override
  State<Pagina3FormCrianca> createState() => _Pagina3FormCriancaState();
}

List<String> AcompanhamentoProfissional = [
  "Educador especial",
  "Fonoaudiólogo(a)",
  "Nutricionista",
  "Psicólogo(a)",
  "Psicopedagogo",
  "Terapeuta ocupacional",
  "Somente os profissionais da escola",
  "Não tem nenhum tipo de acompanhamento.",
  "Prefiro não responder",
];

List<String> RelacaoComLivros = [
  "Gosta de folhar",
  "Gosta de riscar",
  "Gosta de ler histórias",
  "Gosta que leiam para ele/ela as histórias",
  "Gosta de ver as imagens / fotos",
  "Não demostra interesse por livros",
  "Não sei informar",
  "Prefiro não responder",
];
List<String> RelacaoComTecnologia = [
  "Celular",
  "Televisão",
  "Tablet",
  "Computador",
];

class _Pagina3FormCriancaState extends State<Pagina3FormCrianca> {
  String selecionadoAcompanhamento = AcompanhamentoProfissional[0];
  String selecionadoRelacaoLivros = RelacaoComLivros[0];
  String selecionadoRelacaoComTecnologia = RelacaoComTecnologia[0];
  late QuestionarioModel? _currentQuestionario;
  late Pagina3Data _pagina3Data;
  void _sendDataToParent() {
    widget.onDataChanged(_pagina3Data);
  }

  @override
  void initState() {
    super.initState();
if (widget.doc != null) {
      _currentQuestionario = QuestionarioModel.fromMap(
        widget.doc!.data() as Map<String, dynamic>,
        widget.doc!.id,
      );
      selecionadoAcompanhamento = _currentQuestionario!.acompanhamentoProfissinal;
      selecionadoRelacaoComTecnologia = _currentQuestionario!.tecnologiasUsadasComFrequencia;
     selecionadoRelacaoLivros = _currentQuestionario!.relacaocomLivros;
    
    }
    _pagina3Data = Pagina3Data(
      selecionadoAcompanhamento: selecionadoAcompanhamento,
      selecionadoRelacaoLivros: selecionadoRelacaoLivros,
      selecionadoRelacaoComTecnologia: selecionadoRelacaoComTecnologia,
    );
    _sendDataToParent();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(167, 10, 134, 235),
      child: Form(
        key: widget.formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "Ele/Ela tem acompanhamento de algum profissional?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "Educador especial",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: AcompanhamentoProfissional[0],
                            groupValue: selecionadoAcompanhamento,
                            activeColor: Colors.white,

                            onChanged: (value) {
                              setState(() {
                                selecionadoAcompanhamento = value.toString();
                                _pagina3Data.selecionadoAcompanhamento =
                                    selecionadoAcompanhamento;
                                _sendDataToParent();
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "Fonoaudiólogo(a)",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: AcompanhamentoProfissional[1],
                            groupValue: selecionadoAcompanhamento,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoAcompanhamento = value.toString();
                                _pagina3Data.selecionadoAcompanhamento =
                                    selecionadoAcompanhamento;
                                _sendDataToParent();
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "Nutricionista",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: AcompanhamentoProfissional[2],
                            groupValue: selecionadoAcompanhamento,
                            activeColor: Colors.white,

                            onChanged: (value) {
                              setState(() {
                                selecionadoAcompanhamento = value.toString();
                                _pagina3Data.selecionadoAcompanhamento =
                                    selecionadoAcompanhamento;
                                _sendDataToParent();
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "Psicólogo(a)",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: AcompanhamentoProfissional[3],
                            groupValue: selecionadoAcompanhamento,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoAcompanhamento = value.toString();
                                _pagina3Data.selecionadoAcompanhamento =
                                    selecionadoAcompanhamento;
                                _sendDataToParent();
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "Psicopedagogo",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: AcompanhamentoProfissional[4],
                            groupValue: selecionadoAcompanhamento,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoAcompanhamento = value.toString();
                                _pagina3Data.selecionadoAcompanhamento =
                                    selecionadoAcompanhamento;
                                _sendDataToParent();
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "Terapeuta ocupacional",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: AcompanhamentoProfissional[5],
                            groupValue: selecionadoAcompanhamento,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoAcompanhamento = value.toString();
                                _pagina3Data.selecionadoAcompanhamento =
                                    selecionadoAcompanhamento;
                                _sendDataToParent();
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "Profissional da escola",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: AcompanhamentoProfissional[6],
                            groupValue: selecionadoAcompanhamento,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoAcompanhamento = value.toString();
                                _pagina3Data.selecionadoAcompanhamento =
                                    selecionadoAcompanhamento;
                                _sendDataToParent();
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "Sem \nacompanhamento.",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: AcompanhamentoProfissional[7],
                            groupValue: selecionadoAcompanhamento,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoAcompanhamento = value.toString();
                                _pagina3Data.selecionadoAcompanhamento =
                                    selecionadoAcompanhamento;
                                _sendDataToParent();
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "Prefiro não responder",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: AcompanhamentoProfissional[8],
                            groupValue: selecionadoAcompanhamento,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoAcompanhamento = value.toString();
                                _pagina3Data.selecionadoAcompanhamento =
                                    selecionadoAcompanhamento;
                                _sendDataToParent();
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(color: Colors.white, thickness: 2.0),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "Qual a relação dele/dela com livros de histórias:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "Gosta de folhar",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: RelacaoComLivros[0],
                            groupValue: selecionadoRelacaoLivros,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoRelacaoLivros = value.toString();
                                _pagina3Data.selecionadoRelacaoLivros =
                                    selecionadoRelacaoLivros;
                                _sendDataToParent();
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "Gosta de riscar",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: RelacaoComLivros[1],
                            groupValue: selecionadoRelacaoLivros,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoRelacaoLivros = value.toString();
                                _pagina3Data.selecionadoRelacaoLivros =
                                    selecionadoRelacaoLivros;
                                _sendDataToParent();
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "Gosta de ler histórias",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: RelacaoComLivros[2],
                            groupValue: selecionadoRelacaoLivros,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoRelacaoLivros = value.toString();
                                _pagina3Data.selecionadoRelacaoLivros =
                                    selecionadoRelacaoLivros;
                                _sendDataToParent();
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "Gosta que leiam para ele/ela as histórias",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: RelacaoComLivros[3],
                            groupValue: selecionadoRelacaoLivros,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoRelacaoLivros = value.toString();
                                _pagina3Data.selecionadoRelacaoLivros =
                                    selecionadoRelacaoLivros;
                                _sendDataToParent();
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "Gosta de ver as imagens / fotos",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: RelacaoComLivros[4],
                            groupValue: selecionadoRelacaoLivros,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoRelacaoLivros = value.toString();
                                _pagina3Data.selecionadoRelacaoLivros =
                                    selecionadoRelacaoLivros;
                                _sendDataToParent();
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "Não demostra interesse por livros",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: RelacaoComLivros[5],
                            groupValue: selecionadoRelacaoLivros,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoRelacaoLivros = value.toString();
                                _pagina3Data.selecionadoRelacaoLivros =
                                    selecionadoRelacaoLivros;
                                _sendDataToParent();
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "Não sei informar",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: RelacaoComLivros[6],
                            groupValue: selecionadoRelacaoLivros,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoRelacaoLivros = value.toString();
                                _pagina3Data.selecionadoRelacaoLivros =
                                    selecionadoRelacaoLivros;
                                _sendDataToParent();
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "Prefiro não responder",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: RelacaoComLivros[7],
                            groupValue: selecionadoRelacaoLivros,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoRelacaoLivros = value.toString();
                                _pagina3Data.selecionadoRelacaoLivros =
                                    selecionadoRelacaoLivros;
                                _sendDataToParent();
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(color: Colors.white, thickness: 2.0),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "Tecnologias, com que freqüência ele/ ela utiliza?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "Celular",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: RelacaoComTecnologia[0],
                            groupValue: selecionadoRelacaoComTecnologia,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoRelacaoComTecnologia =
                                    value.toString();
                                _pagina3Data.selecionadoRelacaoComTecnologia =
                                    selecionadoRelacaoComTecnologia;
                                _sendDataToParent();
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "Televisão",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: RelacaoComTecnologia[1],
                            groupValue: selecionadoRelacaoComTecnologia,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoRelacaoComTecnologia =
                                    value.toString();
                                _pagina3Data.selecionadoRelacaoComTecnologia =
                                    selecionadoRelacaoComTecnologia;
                                _sendDataToParent();
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "Tablet",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: RelacaoComTecnologia[2],
                            groupValue: selecionadoRelacaoComTecnologia,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoRelacaoComTecnologia =
                                    value.toString();
                                _pagina3Data.selecionadoRelacaoComTecnologia =
                                    selecionadoRelacaoComTecnologia;
                                _sendDataToParent();
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "Computador",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: RelacaoComTecnologia[3],
                            groupValue: selecionadoRelacaoComTecnologia,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoRelacaoComTecnologia =
                                    value.toString();
                                _pagina3Data.selecionadoRelacaoComTecnologia =
                                    selecionadoRelacaoComTecnologia;
                                _sendDataToParent();
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(color: Colors.white, thickness: 2.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
