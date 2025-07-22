import 'package:flutter/material.dart';
import 'package:tcc/Decoracao/DecoracaoAutenticacao.dart';

class Pagina6Data {
  String brinquedos;
  String coisasfavoritas;
  String acessoriofavoritos;
  String animaisfavoritos;
  String historiacoisasfavoritas;
  String historiacoisasNaofavoritas;
  String selecionadoParentesco;
  String  selecionadoProcessoAlf;

  Pagina6Data({
   required  this.brinquedos,
   required  this.coisasfavoritas,
    required this.acessoriofavoritos,
    required this.animaisfavoritos,
    required this.historiacoisasfavoritas,
    required this.historiacoisasNaofavoritas,
    required this.selecionadoParentesco,
    required this.selecionadoProcessoAlf,
  });

  Map<String, dynamic> toJson() => {
    'Brinquedos': brinquedos,
    'Coisas_favoritas': coisasfavoritas,
    'AcessorioFavorito': acessoriofavoritos,
    'AnimaisFavoritos': animaisfavoritos,
    'HistoriaCoisasFavoritas': historiacoisasfavoritas,
    'HistoriaCoisasNaoFavoritas': historiacoisasNaofavoritas,
    'Parentesco': selecionadoProcessoAlf,
    'ProcessoDeAlfadetizacao': selecionadoProcessoAlf,
  };
}

class Pagina6FormCrianca extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  final ValueChanged<Pagina6Data> onDataChanged;
  const Pagina6FormCrianca({
    super.key,
    required this.formKey,
    required this.onDataChanged,
  });

  @override
  State<Pagina6FormCrianca> createState() => _Pagina6FormCriancaState();
}

List<String> Parentesco = [
  "Pai/ Mãe",
  "Avô/ Avó",
  "Irmão/ Irmã",
  "Tio/ Tia",
  "Outro",
  "Prefiro não responder",
];
List<String> ProcessoDeALFAlfdetizacao = [
  "Sim",
  "Não",
  "Não sei informar",
  "Prefiro não responder",
];

final _formKey = GlobalKey<FormState>();

class _Pagina6FormCriancaState extends State<Pagina6FormCrianca> {
  final TextEditingController brinquedos = TextEditingController();
  final TextEditingController coisasfavoritas = TextEditingController();
  final TextEditingController acessoriofavoritos = TextEditingController();
  final TextEditingController animaisfavoritos = TextEditingController();
  final TextEditingController historiacoisasfavoritas = TextEditingController();
  final TextEditingController historiacoisasNaofavoritas =
      TextEditingController();
  String selecionadoParentesco = Parentesco[0];
  String selecionadoProcessoAlf = ProcessoDeALFAlfdetizacao[0];
  late Pagina6Data _pagina6Data;
  void _sendDataToParent() {
    widget.onDataChanged(_pagina6Data);
  }

  @override
  void initState() {
    super.initState();

    _pagina6Data = Pagina6Data(
      brinquedos: brinquedos.text,
      coisasfavoritas: coisasfavoritas.text,
      acessoriofavoritos: acessoriofavoritos.text,
      animaisfavoritos: animaisfavoritos.text,
      historiacoisasfavoritas: historiacoisasfavoritas.text,
      historiacoisasNaofavoritas: historiacoisasNaofavoritas.text,
      selecionadoParentesco: selecionadoParentesco,
      selecionadoProcessoAlf: selecionadoProcessoAlf,
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
              const Padding(padding: EdgeInsets.only(top: 30)),

              SizedBox(
                width: 350,
                height: 50,
                child: TextFormField(
                  controller: brinquedos,
                  decoration: getAutenticationInputDecoration(
                    "Brinquedo ou objeto favorito",
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Este campo não pode ser vazio";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _pagina6Data.brinquedos = value;
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
                  controller: coisasfavoritas,
                  decoration: getAutenticationInputDecoration(
                    "Música(s), filme(s), desenho(s),ou personagem favorito",
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Este campo não pode ser vazio";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _pagina6Data.coisasfavoritas = value;
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
                  controller: acessoriofavoritos,
                  decoration: getAutenticationInputDecoration(
                    "Roupas ou acessórios ele/ ela tem algum(a) favorito(a)",
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Este campo não pode ser vazio";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _pagina6Data.acessoriofavoritos = value;
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
                  controller: animaisfavoritos,
                  decoration: getAutenticationInputDecoration(
                    "Animais ou insetos que ele/ ela gosta ",
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Este campo não pode ser vazio";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _pagina6Data.animaisfavoritos = value;
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
                  controller: historiacoisasfavoritas,
                  decoration: getAutenticationInputDecoration(
                    "Escreva o que não pode faltar na história",
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Este campo não pode ser vazio";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _pagina6Data.historiacoisasfavoritas = value;
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
                  controller: historiacoisasNaofavoritas,
                  decoration: getAutenticationInputDecoration(
                    "Escreva o que deve ser evitado na história",
                  ),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Este campo não pode ser vazio";
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      _pagina6Data.historiacoisasNaofavoritas = value;
                      _sendDataToParent();
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Parentesco com a criança",
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
                          "Pai/ Mãe",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: Parentesco[0],
                          groupValue: selecionadoParentesco,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoParentesco = value.toString();
                              _pagina6Data.selecionadoParentesco =
                                  selecionadoParentesco;
                              _sendDataToParent();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Avô/ Avó",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: Parentesco[1],
                          groupValue: selecionadoParentesco,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoParentesco = value.toString();
                              _pagina6Data.selecionadoParentesco =
                                  selecionadoParentesco;
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
                          "Irmão/ Irmã",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: Parentesco[2],
                          groupValue: selecionadoParentesco,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoParentesco = value.toString();
                              _pagina6Data.selecionadoParentesco =
                                  selecionadoParentesco;
                              _sendDataToParent();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Tio/ Tia",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: Parentesco[3],
                          groupValue: selecionadoParentesco,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoParentesco = value.toString();
                              _pagina6Data.selecionadoParentesco =
                                  selecionadoParentesco;
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
                          "Outro",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: Parentesco[4],
                          groupValue: selecionadoParentesco,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoParentesco = value.toString();
                              _pagina6Data.selecionadoParentesco =
                                  selecionadoParentesco;
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
                          value: Parentesco[5],
                          groupValue: selecionadoParentesco,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoParentesco = value.toString();
                              _pagina6Data.selecionadoParentesco =
                                  selecionadoParentesco;
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
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  "Ele/ ela está em processo de alfabetização?",
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
                          "Sim",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: ProcessoDeALFAlfdetizacao[0],
                          groupValue: selecionadoProcessoAlf,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoProcessoAlf = value.toString();
                              _pagina6Data.selecionadoProcessoAlf =
                                  selecionadoProcessoAlf;
                              _sendDataToParent();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Não",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: ProcessoDeALFAlfdetizacao[1],
                          groupValue: selecionadoProcessoAlf,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoProcessoAlf = value.toString();
                              _pagina6Data.selecionadoProcessoAlf =
                                  selecionadoProcessoAlf;
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
                          value: ProcessoDeALFAlfdetizacao[2],
                          groupValue: selecionadoProcessoAlf,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoProcessoAlf = value.toString();
                              _pagina6Data.selecionadoProcessoAlf =
                                  selecionadoProcessoAlf;
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
                          value: ProcessoDeALFAlfdetizacao[3],
                          groupValue: selecionadoProcessoAlf,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoProcessoAlf = value.toString();
                              _pagina6Data.selecionadoProcessoAlf =
                                  selecionadoProcessoAlf;
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
    );
  }
}
