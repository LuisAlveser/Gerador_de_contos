import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tcc/Decoracao/DecoracaoAutenticacao.dart';
import 'package:tcc/Model/QuestinarioModel.dart';

class Pagina7Data {
  String moracomcrianca;
  String amigos;
  String atividadequegosta;
  String atividadequeNaogosta;
  String animalestimacao;
  String hiperfoco;

  Pagina7Data({
    required this.moracomcrianca,
    required this.amigos,
    required this.atividadequegosta,
    required this.atividadequeNaogosta,
    required this.animalestimacao,
    required this.hiperfoco,
  });

  Map<String, dynamic> toJson() => {
    'MoraComCriança': moracomcrianca,
    'Amigos': amigos,
    'AtividadesGosta': atividadequegosta,
    'AtividadesNAOGosta': atividadequeNaogosta,
    'AnimalEestimacao': animalestimacao,
    'Hiperfoco': hiperfoco,
  };
}

class Pagina7FormCrianca extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final DocumentSnapshot? doc;
  final ValueChanged<Pagina7Data> onDataChanged;
  const Pagina7FormCrianca({
    super.key,
    required this.formKey,
    required this.onDataChanged,
    Pagina7Data? initialData,
    this.doc,
  });

  @override
  State<Pagina7FormCrianca> createState() => _Pagina7FormCriancaState();
}

final TextEditingController moracomcrianca = TextEditingController();
final TextEditingController amigos = TextEditingController();
final TextEditingController atividadequegosta = TextEditingController();
final TextEditingController atividadequeNaogosta = TextEditingController();
final TextEditingController animalestimacao = TextEditingController();
final TextEditingController hiperfoco = TextEditingController();
final _formKey = GlobalKey<FormState>();
late QuestionarioModel? _currentQuestionario;

class _Pagina7FormCriancaState extends State<Pagina7FormCrianca> {
  late Pagina7Data _pagina7Data;
  void _sendDataToParent() {
    widget.onDataChanged(_pagina7Data);
  }

  @override
  void initState() {
    super.initState();
    if (widget.doc != null) {
      _currentQuestionario = QuestionarioModel.fromMap(
        widget.doc!.data() as Map<String, dynamic>,
        widget.doc!.id,
      );
      moracomcrianca.text = _currentQuestionario!.conjugeNomes;
      amigos.text = _currentQuestionario!.amigosNomes;
      atividadequegosta.text = _currentQuestionario!.atividadeFavorita;
      atividadequeNaogosta.text = _currentQuestionario!.atividadeNaoGosta;
      animalestimacao.text = _currentQuestionario!.animalEstimacaoNome;
      hiperfoco.text = _currentQuestionario!.hiperfoco;
    }
    _pagina7Data = Pagina7Data(
      moracomcrianca: moracomcrianca.text,
      amigos: amigos.text,
      atividadequegosta: atividadequegosta.text,
      atividadequeNaogosta: atividadequeNaogosta.text,
      animalestimacao: animalestimacao.text,
      hiperfoco: hiperfoco.text,
    );
    _sendDataToParent();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(167, 10, 134, 235),
      child: SingleChildScrollView(
        child: Form(
          key: widget.formKey,
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 30)),
              SizedBox(
                width: 350,
                height: 50,
                child: TextFormField(
                  controller: moracomcrianca,
                  decoration: getAutenticationInputDecoration(
                    "Nomes das pessoas que moram com a criança",
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Este campo não pode ser vazio";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _pagina7Data.moracomcrianca = value;
                      _sendDataToParent();
                    });
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 30)),
              SizedBox(
                width: 350,
                height: 50,
                child: TextFormField(
                  controller: amigos,
                  decoration: getAutenticationInputDecoration(
                    "Nomes dos amigos(a) da criança",
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Este campo não pode ser vazio";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _pagina7Data.amigos = value;
                      _sendDataToParent();
                    });
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 30)),
              SizedBox(
                width: 350,
                height: 50,
                child: TextFormField(
                  controller: atividadequegosta,
                  decoration: getAutenticationInputDecoration(
                    "Atividades que ele/ela gosta",
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Este campo não pode ser vazio";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _pagina7Data.atividadequegosta = value;
                      _sendDataToParent();
                    });
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 30)),
              SizedBox(
                width: 350,
                height: 50,
                child: TextFormField(
                  controller: atividadequeNaogosta,
                  decoration: getAutenticationInputDecoration(
                    "Atividades que ele/ela não gosta",
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Este campo não pode ser vazio";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _pagina7Data.atividadequeNaogosta = value;
                      _sendDataToParent();
                    });
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 30)),
              SizedBox(
                width: 350,
                height: 50,
                child: TextFormField(
                  controller: animalestimacao,
                  decoration: getAutenticationInputDecoration(
                    "Nome do animal de estimação",
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Este campo não pode ser vazio";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _pagina7Data.animalestimacao = value;
                      _sendDataToParent();
                    });
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 30)),
              SizedBox(
                width: 350,
                height: 50,
                child: TextFormField(
                  controller: hiperfoco,
                  decoration: getAutenticationInputDecoration(
                    "Qual é o seu hiperfoco (fixação ou fascínio por um assunto)",
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Este campo não pode ser vazio";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _pagina7Data.hiperfoco = value;
                      _sendDataToParent();
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
