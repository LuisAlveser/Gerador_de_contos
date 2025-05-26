import 'package:flutter/material.dart';

import 'package:tcc/Decoracao/DecoracaoAutenticacao.dart';

class Pagina1FormCrianca extends StatefulWidget {
  const Pagina1FormCrianca({super.key});

  @override
  State<Pagina1FormCrianca> createState() => Pagina1FormCriancaState();
}

List<String> Alfabetizada = ["Sim", "Não"];
List<String> PossuiTEA = ["Sim", "Não"];
List<String> NivelSuporte = ["Nivel 1", "Nivel 2", "Nivel 3", "Não informado"];

class Pagina1FormCriancaState extends State<Pagina1FormCrianca> {
  String selecionadaAlf = Alfabetizada[0];
  String selecionadaTea = PossuiTEA[0];
  String selecionadoNivel = NivelSuporte[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(167, 10, 134, 235),
      body: Stack(
        children: [
          Form(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    SizedBox(
                      width: 350,
                      height: 50,
                      child: TextFormField(
                        decoration: getAutenticationInputDecoration("Nome"),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: 350,
                        height: 50,
                        child: TextFormField(
                          decoration: getAutenticationInputDecoration(
                            "Apelido",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: 350,
                        height: 50,
                        child: TextFormField(
                          decoration: getAutenticationInputDecoration("Idade"),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Alfabetizada",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        SizedBox(
                          width: 150,
                          child: ListTile(
                            title: Text(
                              "Sim",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            leading: Radio(
                              value: Alfabetizada[0],
                              groupValue: selecionadaAlf,
                              activeColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  selecionadaAlf = value.toString();
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150,

                          child: ListTile(
                            title: Text(
                              "Não",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            leading: Radio(
                              value: Alfabetizada[1],
                              groupValue: selecionadaAlf,
                              activeColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  selecionadaAlf = value.toString();
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Possui TEA",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        SizedBox(
                          width: 150,
                          child: ListTile(
                            title: Text(
                              "Sim",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            leading: Radio(
                              value: PossuiTEA[0],
                              groupValue: selecionadaTea,
                              activeColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  selecionadaTea = value.toString();
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150,

                          child: ListTile(
                            title: Text(
                              "Não",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            leading: Radio(
                              value: PossuiTEA[1],
                              groupValue: selecionadaTea,
                              activeColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  selecionadaTea = value.toString();
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Nivel de suporte",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        SizedBox(
                          width: 159,

                          child: ListTile(
                            title: Text(
                              "Nível 1",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            leading: Radio(
                              value: NivelSuporte[0],
                              groupValue: selecionadoNivel,
                              activeColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  selecionadoNivel = value.toString();
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 159,

                          child: ListTile(
                            title: Text(
                              "Nível 2",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            leading: Radio(
                              value: NivelSuporte[1],
                              groupValue: selecionadoNivel,
                              activeColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  selecionadoNivel = value.toString();
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,

                      children: [
                        SizedBox(
                          width: 160,

                          child: ListTile(
                            title: Text(
                              "Nível 3",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            leading: Radio(
                              value: NivelSuporte[2],
                              groupValue: selecionadoNivel,
                              activeColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  selecionadoNivel = value.toString();
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 170,

                          child: ListTile(
                            title: Text(
                              "Não sei",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            leading: Radio(
                              value: NivelSuporte[3],
                              groupValue: selecionadoNivel,
                              activeColor: Colors.white,
                              onChanged: (value) {
                                setState(() {
                                  selecionadoNivel = value.toString();
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
