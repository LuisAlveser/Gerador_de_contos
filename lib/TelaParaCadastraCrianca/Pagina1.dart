import 'package:flutter/material.dart';
import 'package:tcc/Decoracao/DecoracaoAutenticacao.dart';

class Pagina1Data {
  String? nomecrianca;
  String? idade;
  String? apelido;
  String? selecionadoOculos;
  String? selecionadaTea;
  String? selecionadoNivel;

  Pagina1Data({
    this.nomecrianca,
    this.idade,
    this.apelido,
    this.selecionadoOculos,
    this.selecionadaTea,
    this.selecionadoNivel,
  });
  Map<String, dynamic> toJson() {
    return {
      'nome_crianca': nomecrianca,
      'idade': idade,
      'apelido': apelido,
      'oculos': selecionadoOculos,
      'tea': selecionadaTea,
      'nivel_suporte': selecionadoNivel,
    };
  }
}

class Pagina1FormCrianca extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  final ValueChanged<Pagina1Data> onDataChanged;
  const Pagina1FormCrianca({
    super.key,
    required this.formKey,
    required this.onDataChanged,
  });

  @override
  State<Pagina1FormCrianca> createState() => Pagina1FormCriancaState();
}

List<String> PossuiOculos = ["Sim", "Não"];
List<String> PossuiTEA = [
  "Sim, com laudo médico",
  "Sim, com hipótese diagnóstica por profissionais",
  "Está em andamento",
  "Não",
  "Prefiro não responder",
];
List<String> NivelSuporte = [
  "Nível 1",
  "Nível 2",
  "Nível 3",
  "Não sei",
  "Ainda não foi diagnosticado(a)",
  "Prefiro não responder",
];

class Pagina1FormCriancaState extends State<Pagina1FormCrianca> {
  String selecionadoOculos = PossuiOculos[0];
  String selecionadaTea = PossuiTEA[0];
  String selecionadoNivel = NivelSuporte[0];
  final TextEditingController nomecrianca = TextEditingController();
  final TextEditingController apelido = TextEditingController();
  final TextEditingController idade = TextEditingController();
  late Pagina1Data _pagina1Data;
  void _sendDataToParent() {
    widget.onDataChanged(_pagina1Data);
  }

  void initState() {
    super.initState();
    _pagina1Data = Pagina1Data(
      nomecrianca: nomecrianca.text,
      idade:idade.text,
      apelido: apelido.text,
      selecionadoOculos: selecionadoOculos,
      selecionadaTea: selecionadaTea,
      selecionadoNivel: selecionadoNivel,
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
                const SizedBox(height: 15),

                SizedBox(
                  width: 350,
                  height: 50,
                  child: TextFormField(
                    controller: nomecrianca,
                    decoration: getAutenticationInputDecoration("Nome"),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Este campo não pode ser vazio";
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _pagina1Data.nomecrianca = value;
                        _sendDataToParent();
                      });
                    },
                  ),
                ),

                const SizedBox(height: 15),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 350,
                    height: 50,
                    child: TextFormField(
                      decoration: getAutenticationInputDecoration("Apelido"),
                      controller: apelido,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Este campo não pode ser vazio";
                        }
                        return null;
                      },
                       onChanged: (value) {
                      setState(() {
                        _pagina1Data.apelido = value;
                        _sendDataToParent();
                      });
                    },
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    width: 350,
                    height: 50,
                    child: TextFormField(
                      decoration: getAutenticationInputDecoration("Idade"),
                      controller: idade,
                      keyboardType: TextInputType.number,
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return "Este campo não pode ser vazio";
                        }
                        return null;
                      },
                       onChanged: (value) {
                      setState(() {
                        _pagina1Data.idade = value;
                        _sendDataToParent();
                      });
                    },
                    ),
                  ),
                ),

                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Ele/ ela utiliza óculos de grau? ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
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
                            value: PossuiOculos[0],
                            groupValue: selecionadoOculos,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoOculos = value.toString();
                                 _pagina1Data.selecionadoOculos = selecionadoOculos;
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
                            value: PossuiOculos[1],
                            groupValue: selecionadoOculos,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoOculos = value.toString();
                                 _pagina1Data.selecionadoOculos = selecionadoOculos;
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
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "Ele/Ela é diagnosticada no Transtorno do Espectro Autista (TEA)?",
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
                            "Sim, com laudo médico",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: PossuiTEA[0],
                            groupValue: selecionadaTea,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadaTea = value.toString();
                                 _pagina1Data.selecionadaTea = selecionadaTea;
                        _sendDataToParent();
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "Sim, com hipótese diagnóstica por profissionais",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: PossuiTEA[1],
                            groupValue: selecionadaTea,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadaTea = value.toString();
                                 _pagina1Data.selecionadaTea = selecionadaTea;
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
                            "Está em andamento",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: PossuiTEA[2],
                            groupValue: selecionadaTea,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadaTea = value.toString();
                                 _pagina1Data.selecionadaTea = selecionadaTea;
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
                            value: PossuiTEA[3],
                            groupValue: selecionadaTea,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadaTea = value.toString();
                                _pagina1Data.selecionadaTea = selecionadaTea;
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
                            value: PossuiTEA[4],
                            groupValue: selecionadaTea,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadaTea = value.toString();
                                _pagina1Data.selecionadaTea = selecionadaTea;
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
                const SizedBox(height: 10),

                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "Em qual nível de suporte ele/ela foi diagnosticado(a)?",
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
                            "Nível 1:  Pouco apoio",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: NivelSuporte[0],
                            groupValue: selecionadoNivel,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoNivel = value.toString();
                                 _pagina1Data.selecionadoNivel = selecionadoNivel;
                        _sendDataToParent();
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "Nível 2: Apoio moderado",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: NivelSuporte[1],
                            groupValue: selecionadoNivel,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoNivel = value.toString();
                               _pagina1Data.selecionadoNivel = selecionadoNivel;
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
                            "Nível 3: Apoio substancial",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: NivelSuporte[2],
                            groupValue: selecionadoNivel,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoNivel = value.toString();
                                _pagina1Data.selecionadoNivel = selecionadoNivel;
                        _sendDataToParent();
                              });
                            },
                          ),
                        ),
                      ),
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
                            value: NivelSuporte[3],
                            groupValue: selecionadoNivel,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoNivel = value.toString();
                                _pagina1Data.selecionadoNivel = selecionadoNivel;
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
                            "Ainda não foi diagnosticado(a)",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: NivelSuporte[4],
                            groupValue: selecionadoNivel,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoNivel = value.toString();
                                _pagina1Data.selecionadoNivel = selecionadoNivel;
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
                            value: NivelSuporte[5],
                            groupValue: selecionadoNivel,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoNivel = value.toString();
                                _pagina1Data.selecionadoNivel = selecionadoNivel;
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
