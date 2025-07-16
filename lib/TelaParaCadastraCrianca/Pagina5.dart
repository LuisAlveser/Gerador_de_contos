import 'package:flutter/material.dart';

class Pagina5FormCrianca extends StatefulWidget {
  const Pagina5FormCrianca({super.key});

  @override
  State<Pagina5FormCrianca> createState() => _Pagina5FormCriancaState();
}

List<String> ComidasPreferidas = [
  "Arroz", //0
  "Feijão", //1
  "Batata Frita", //2
  "Carnes e aves", //3
  "Macarrão", //4
  "Frutas", //5
  "Legumes", //6
  "Verduras", //7
  "Sorvete", //8
  "Bolachas", //9
  "Salgadinhos", //10
  "Pipoca", //11
  "Iogurte", //12
  "Lanches (pizza, hamburger e etc.)", //13
  "Outro alimento", //14
];
List<String> AtividadesFavoritas = [
  "Girar",
  "Balançar",
  "Lutar",
  "Correr",
  "Brincar de faz-de-conta",
  "Que alguém faça cócegas",
  "Que alguém leia",
  "Que alguém cante",
  "Que alguém conte história",
];

class _Pagina5FormCriancaState extends State<Pagina5FormCrianca> {
  String selecionadaComidaFavorita = ComidasPreferidas[0];
  String selecionadaAtividadeFavorita = AtividadesFavoritas[0];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(167, 10, 134, 235),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  "Com relação a alimentos, como são as preferências dele/ dela?",
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
                          "Arroz",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: ComidasPreferidas[0],
                          groupValue: selecionadaComidaFavorita,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadaComidaFavorita = value.toString();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Feijão",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: ComidasPreferidas[1],
                          groupValue: selecionadaComidaFavorita,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadaComidaFavorita = value.toString();
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
                          "Batata Frita",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: ComidasPreferidas[2],
                          groupValue: selecionadaComidaFavorita,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadaComidaFavorita = value.toString();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Carnes e aves",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: ComidasPreferidas[3],
                          groupValue: selecionadaComidaFavorita,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadaComidaFavorita = value.toString();
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
                          "Macarrão",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: ComidasPreferidas[4],
                          groupValue: selecionadaComidaFavorita,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadaComidaFavorita = value.toString();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Frutas",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: ComidasPreferidas[5],
                          groupValue: selecionadaComidaFavorita,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadaComidaFavorita = value.toString();
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
                          "Legumes",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: ComidasPreferidas[6],
                          groupValue: selecionadaComidaFavorita,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadaComidaFavorita = value.toString();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Verduras",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: ComidasPreferidas[7],
                          groupValue: selecionadaComidaFavorita,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadaComidaFavorita = value.toString();
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
                          "Sorvete",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: ComidasPreferidas[8],
                          groupValue: selecionadaComidaFavorita,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadaComidaFavorita = value.toString();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Bolachas",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: ComidasPreferidas[9],
                          groupValue: selecionadaComidaFavorita,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadaComidaFavorita = value.toString();
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
                          "Salgadinhos",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: ComidasPreferidas[10],
                          groupValue: selecionadaComidaFavorita,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadaComidaFavorita = value.toString();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Pipoca",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: ComidasPreferidas[11],
                          groupValue: selecionadaComidaFavorita,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadaComidaFavorita = value.toString();
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
                          "Iogurte",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: ComidasPreferidas[12],
                          groupValue: selecionadaComidaFavorita,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadaComidaFavorita = value.toString();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Lanches (pizza, hamburger e etc)",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: ComidasPreferidas[13],
                          groupValue: selecionadaComidaFavorita,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadaComidaFavorita = value.toString();
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
                          "Outro alimento",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: ComidasPreferidas[14],
                          groupValue: selecionadaComidaFavorita,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadaComidaFavorita = value.toString();
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
                  "Com relação as seguintes atividades, quais as preferências dele/ dela?",
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
                          "Girar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: AtividadesFavoritas[0],
                          groupValue: selecionadaAtividadeFavorita,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadaAtividadeFavorita = value.toString();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Balançar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: AtividadesFavoritas[1],
                          groupValue: selecionadaAtividadeFavorita,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadaAtividadeFavorita = value.toString();
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
                          "Lutar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: AtividadesFavoritas[2],
                          groupValue: selecionadaAtividadeFavorita,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadaAtividadeFavorita = value.toString();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Correr",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: AtividadesFavoritas[3],
                          groupValue: selecionadaAtividadeFavorita,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadaAtividadeFavorita = value.toString();
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
                          "Brincar de faz-de-conta",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: AtividadesFavoritas[4],
                          groupValue: selecionadaAtividadeFavorita,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadaAtividadeFavorita = value.toString();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Que alguém faça cócegas",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: AtividadesFavoritas[5],
                          groupValue: selecionadaAtividadeFavorita,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadaAtividadeFavorita = value.toString();
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
                          "Que alguém leia",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: AtividadesFavoritas[6],
                          groupValue: selecionadaAtividadeFavorita,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadaAtividadeFavorita = value.toString();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Que alguém cante",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: AtividadesFavoritas[7],
                          groupValue: selecionadaAtividadeFavorita,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadaAtividadeFavorita = value.toString();
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
                          "Que alguém conte história",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: AtividadesFavoritas[8],
                          groupValue: selecionadaAtividadeFavorita,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadaAtividadeFavorita = value.toString();
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
