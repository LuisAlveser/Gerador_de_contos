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
    return Container(
      color: const Color.fromARGB(167, 10, 134, 235),

      child: Form(
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
                    decoration: getAutenticationInputDecoration("Nome"),
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
                      Expanded(
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
                ),
                Divider(color: Colors.white, thickness: 2.0),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "Possui TEA",
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
                      Expanded(
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
                ),
                Divider(color: Colors.white, thickness: 2.0),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    "Nível de suporte",
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
                      Expanded(
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
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
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
                      Expanded(
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
