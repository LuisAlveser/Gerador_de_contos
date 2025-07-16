import 'package:flutter/material.dart';

class Pagina2FormCrianca extends StatefulWidget {
  const Pagina2FormCrianca({super.key});

  @override
  State<Pagina2FormCrianca> createState() => _Pagina2FormCriancaState();
}

List<String> Genero = ["Masculino", "Feminino", "Prefiro não responder"];
List<String> Verbal = [
  "Verbal",
  "Não verbal",
  "Não sei informar",
  "Prefiro não responder",
];
List<String> EletronicosAtividade = [
  "Assistir vídeos",
  "Usar joguinhos",
  "Escutar músicas",
];
List<String> EtapaEducacaoBasica = [
  "Pré-escola",
  "1º ano do Ensino Fundamental",
  "2º ano do Ensino Fundamental",
  "3º ano do Ensino Fundamental",
  "4º ano do Ensino Fundamental",
  "Do 5º ao 9º ano do Ensino Fundamental",
  "Não está no Ensino Fundamental",
  "Prefiro não responder",
];

class _Pagina2FormCriancaState extends State<Pagina2FormCrianca> {
  String selecionadoGenero = Genero[0];
  String selecionadoVerbo = Verbal[0];
  String selecionadoEletronico = Verbal[0];
  String selecionadoEtapaEducacaoBasica = EtapaEducacaoBasica[0];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(167, 10, 134, 235),

      child: Form(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "Qual o gênero dele/ dela?",
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
                            "Masculino",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          leading: Radio(
                            value: Genero[0],
                            groupValue: selecionadoGenero,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoGenero = value.toString();
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "Feminino",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          leading: Radio(
                            value: Genero[1],
                            groupValue: selecionadoGenero,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoGenero = value.toString();
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
                            ),
                          ),
                          leading: Radio(
                            value: Genero[2],
                            groupValue: selecionadoGenero,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoGenero = value.toString();
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
                    "Ele/ ela é",
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
                            "Verbal",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          leading: Radio(
                            value: Verbal[0],
                            groupValue: selecionadoVerbo,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoVerbo = value.toString();
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "Não verbal",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          leading: Radio(
                            value: Verbal[1],
                            groupValue: selecionadoVerbo,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoVerbo = value.toString();
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
                            ),
                          ),
                          leading: Radio(
                            value: Verbal[2],
                            groupValue: selecionadoVerbo,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoVerbo = value.toString();
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
                            ),
                          ),
                          leading: Radio(
                            value: Verbal[3],
                            groupValue: selecionadoVerbo,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoVerbo = value.toString();
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
                    "Como são as preferências dele/ dela por eletrônicos?",
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
                            "Assistir vídeos",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          leading: Radio(
                            value: EletronicosAtividade[0],
                            groupValue: selecionadoEletronico,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoEletronico = value.toString();
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "Usar joguinhos",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          leading: Radio(
                            value: EletronicosAtividade[1],
                            groupValue: selecionadoEletronico,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoEletronico = value.toString();
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
                            "Escutar músicas",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          leading: Radio(
                            value: EletronicosAtividade[2],
                            groupValue: selecionadoEletronico,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoEletronico = value.toString();
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
                    "Em qual etapa da Educação Básica ele/ela está:",
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
                            "Pré-escola",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: EtapaEducacaoBasica[0],
                            groupValue: selecionadoEtapaEducacaoBasica,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoEtapaEducacaoBasica =
                                    value.toString();
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "1º ano do Ensino Fundamental",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: EtapaEducacaoBasica[1],
                            groupValue: selecionadoEtapaEducacaoBasica,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoEtapaEducacaoBasica =
                                    value.toString();
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
                            "2º ano do Ensino Fundamental",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: EtapaEducacaoBasica[2],
                            groupValue: selecionadoEtapaEducacaoBasica,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoEtapaEducacaoBasica =
                                    value.toString();
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "3º ano do Ensino Fundamental",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: EtapaEducacaoBasica[3],
                            groupValue: selecionadoEtapaEducacaoBasica,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoEtapaEducacaoBasica =
                                    value.toString();
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
                            "4º ano do Ensino Fundamental",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: EtapaEducacaoBasica[4],
                            groupValue: selecionadoEtapaEducacaoBasica,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoEtapaEducacaoBasica =
                                    value.toString();
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            "5º ao 9º ano do Ensino \nFundamental",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: EtapaEducacaoBasica[5],
                            groupValue: selecionadoEtapaEducacaoBasica,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoEtapaEducacaoBasica =
                                    value.toString();
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
                            "Não está no Ensino Fundamental",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                          leading: Radio(
                            value: EtapaEducacaoBasica[6],
                            groupValue: selecionadoEtapaEducacaoBasica,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoEtapaEducacaoBasica =
                                    value.toString();
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
                            value: EtapaEducacaoBasica[7],
                            groupValue: selecionadoEtapaEducacaoBasica,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoEtapaEducacaoBasica =
                                    value.toString();
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
