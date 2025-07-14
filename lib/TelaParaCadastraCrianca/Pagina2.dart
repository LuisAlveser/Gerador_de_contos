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

class _Pagina2FormCriancaState extends State<Pagina2FormCrianca> {
  String selecionadoGenero = Genero[0];
  String selecionadoVerbo = Verbal[0];
  String selecionadoEletronico = Verbal[0];
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
