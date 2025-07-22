import 'package:flutter/material.dart';

class Pagina4Data {
  String selecionadoBrinquedo;
  String selecionadoCor;
  String selecionadoVeiculoFavorito;

  Pagina4Data({
   required  this.selecionadoBrinquedo,
     required this.selecionadoCor,
    required this.selecionadoVeiculoFavorito,
  });
  Map<String, dynamic> toJson() {
    return {
      'Brinquedo': selecionadoBrinquedo,
      'Cor': selecionadoCor,
      'VeiculoFavorito': selecionadoVeiculoFavorito,
    };
  }
}

class Pagina4FormCrianca extends StatefulWidget {
  final GlobalKey<FormState> formKey;

  final ValueChanged<Pagina4Data> onDataChanged;
  const Pagina4FormCrianca({
    super.key,
    required this.formKey,
    required this.onDataChanged,
  });

  @override
  State<Pagina4FormCrianca> createState() => _Pagina4FormCriancaState();
}

List<String> BrinquedosPreferidos = [
  "Com luzes", //0
  "Que giram", //1
  "Com música", //2
  "Que apitam", //3
  "Com sirene", //4
  "Com sons de carro", //5
  "Que brilham", //6
  "Com água", //7
  "De pintar", //8
  "Gelados", //9
  "Quentes", //10
  "Com pêlos ou penugem", //11
  "Bonecas ou bonecos de desenhos de ação", //12
  "Animais de pelúcia", //13
  "Cartas e/ou figurinhas", //14
  "Quebra-cabeça", //15
  "Legos ou blocos de montar", //16
  "Jogos de tabuleiro", //17
  "Desenhar ou pintar", //18
  "Fantasias e/ou disfarces", //19
];
List<String> CorFavorita = [
  "Azul",
  "Vermelho",
  "Preto",
  "Branco",
  "Rosa",
  "Amarelo",
  "Verde",
];
List<String> VeiculoFavorito = [
  "Ônibus",
  "Trem",
  "Carro",
  "Bicicleta",
  "Avião",
  "Barco",
  "Carroça",
  "Moto",
  "Táxi",
  "Foguete",
];

class _Pagina4FormCriancaState extends State<Pagina4FormCrianca> {
  String selecionadoBriquendo = BrinquedosPreferidos[0];
  String selecionadoCor = CorFavorita[0];
  String selecionadoVeiculoFavorito = VeiculoFavorito[0];
  late Pagina4Data _pagina4Data;
  void _sendDataToParent() {
    widget.onDataChanged(_pagina4Data);
  }

  @override
  void initState() {
    super.initState();

    _pagina4Data = Pagina4Data(
      selecionadoBrinquedo: selecionadoBriquendo,
      selecionadoCor: selecionadoCor,
      selecionadoVeiculoFavorito: selecionadoVeiculoFavorito,
    );
    _sendDataToParent();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(167, 10, 134, 235),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
           key: widget.formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(
                  "Com relação a esses brinquedos ou objetos, como são as preferências dele/dela",
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
                          "Com luzes",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: BrinquedosPreferidos[0],
                          groupValue: selecionadoBriquendo,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoBriquendo = value.toString();
                              _pagina4Data.selecionadoBrinquedo =
                                  selecionadoBriquendo;
                              _sendDataToParent();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Que giram",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: BrinquedosPreferidos[1],
                          groupValue: selecionadoBriquendo,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoBriquendo = value.toString();
                              _pagina4Data.selecionadoBrinquedo =
                                  selecionadoBriquendo;
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
                          "Com música",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: BrinquedosPreferidos[2],
                          groupValue: selecionadoBriquendo,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoBriquendo = value.toString();
                              _pagina4Data.selecionadoBrinquedo =
                                  selecionadoBriquendo;
                              _sendDataToParent();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Que apitam",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: BrinquedosPreferidos[3],
                          groupValue: selecionadoBriquendo,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoBriquendo = value.toString();
                              _pagina4Data.selecionadoBrinquedo =
                                  selecionadoBriquendo;
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
                          "Com sirene",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: BrinquedosPreferidos[4],
                          groupValue: selecionadoBriquendo,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoBriquendo = value.toString();
                              _pagina4Data.selecionadoBrinquedo =
                                  selecionadoBriquendo;
                              _sendDataToParent();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Com sons de carro",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: BrinquedosPreferidos[5],
                          groupValue: selecionadoBriquendo,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoBriquendo = value.toString();
                              _pagina4Data.selecionadoBrinquedo =
                                  selecionadoBriquendo;
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
                          "Que brilham",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: BrinquedosPreferidos[6],
                          groupValue: selecionadoBriquendo,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoBriquendo = value.toString();
                              _pagina4Data.selecionadoBrinquedo =
                                  selecionadoBriquendo;
                              _sendDataToParent();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Com água",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: BrinquedosPreferidos[7],
                          groupValue: selecionadoBriquendo,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoBriquendo = value.toString();
                              _pagina4Data.selecionadoBrinquedo =
                                  selecionadoBriquendo;
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
                          "De pintar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: BrinquedosPreferidos[8],
                          groupValue: selecionadoBriquendo,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoBriquendo = value.toString();
                              _pagina4Data.selecionadoBrinquedo =
                                  selecionadoBriquendo;
                              _sendDataToParent();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Gelados",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: BrinquedosPreferidos[9],
                          groupValue: selecionadoBriquendo,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoBriquendo = value.toString();
                              _pagina4Data.selecionadoBrinquedo =
                                  selecionadoBriquendo;
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
                          "Quentes",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: BrinquedosPreferidos[10],
                          groupValue: selecionadoBriquendo,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoBriquendo = value.toString();
                              _pagina4Data.selecionadoBrinquedo =
                                  selecionadoBriquendo;
                              _sendDataToParent();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Com pêlos ou penugem",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: BrinquedosPreferidos[11],
                          groupValue: selecionadoBriquendo,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoBriquendo = value.toString();
                              _pagina4Data.selecionadoBrinquedo =
                                  selecionadoBriquendo;
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
                          "Bonecos(a)s de desenhos de ação",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: BrinquedosPreferidos[12],
                          groupValue: selecionadoBriquendo,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoBriquendo = value.toString();
                              _pagina4Data.selecionadoBrinquedo =
                                  selecionadoBriquendo;
                              _sendDataToParent();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Animais de pelúcia",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: BrinquedosPreferidos[13],
                          groupValue: selecionadoBriquendo,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoBriquendo = value.toString();
                              _pagina4Data.selecionadoBrinquedo =
                                  selecionadoBriquendo;
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
                          "Cartas e/ou figurinhas",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: BrinquedosPreferidos[14],
                          groupValue: selecionadoBriquendo,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoBriquendo = value.toString();
                              _pagina4Data.selecionadoBrinquedo =
                                  selecionadoBriquendo;
                              _sendDataToParent();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Quebra-cabeça",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: BrinquedosPreferidos[15],
                          groupValue: selecionadoBriquendo,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoBriquendo = value.toString();
                              _pagina4Data.selecionadoBrinquedo =
                                  selecionadoBriquendo;
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
                          "Legos ou blocos de montar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: BrinquedosPreferidos[16],
                          groupValue: selecionadoBriquendo,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoBriquendo = value.toString();
                              _pagina4Data.selecionadoBrinquedo =
                                  selecionadoBriquendo;
                              _sendDataToParent();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Jogos de tabuleiro",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: BrinquedosPreferidos[17],
                          groupValue: selecionadoBriquendo,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoBriquendo = value.toString();
                              _pagina4Data.selecionadoBrinquedo =
                                  selecionadoBriquendo;
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
                          "Desenhar ou pintar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: BrinquedosPreferidos[18],
                          groupValue: selecionadoBriquendo,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoBriquendo = value.toString();
                              _pagina4Data.selecionadoBrinquedo =
                                  selecionadoBriquendo;
                              _sendDataToParent();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Fantasias e/ou disfarces",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: BrinquedosPreferidos[19],
                          groupValue: selecionadoBriquendo,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoBriquendo = value.toString();
                              _pagina4Data.selecionadoBrinquedo =
                                  selecionadoBriquendo;
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
                  "Com relação as cores, quais as preferências dele/ dela?",
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
                          "Azul",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: CorFavorita[0],
                          groupValue: selecionadoCor,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoCor = value.toString();
                              _pagina4Data.selecionadoCor = selecionadoCor;
                              _sendDataToParent();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Vermelho",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: CorFavorita[1],
                          groupValue: selecionadoCor,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoCor = value.toString();
                              _pagina4Data.selecionadoCor = selecionadoCor;
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
                          "Preto",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: CorFavorita[2],
                          groupValue: selecionadoCor,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoCor = value.toString();
                              _pagina4Data.selecionadoCor = selecionadoCor;
                              _sendDataToParent();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Branco",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: CorFavorita[3],
                          groupValue: selecionadoCor,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoCor = value.toString();
                              _pagina4Data.selecionadoCor = selecionadoCor;
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
                          "Rosa",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: CorFavorita[4],
                          groupValue: selecionadoCor,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoCor = value.toString();
                              _pagina4Data.selecionadoCor = selecionadoCor;
                              _sendDataToParent();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Amarelo",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: CorFavorita[5],
                          groupValue: selecionadoCor,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoCor = value.toString();
                              _pagina4Data.selecionadoCor = selecionadoCor;
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
                          "Verde",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: CorFavorita[6],
                          groupValue: selecionadoCor,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoCor = value.toString();
                              _pagina4Data.selecionadoCor = selecionadoCor;
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
                  "Com relação a veículos, quais as preferências dele/ dela?",
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
                          "Ônibus",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: VeiculoFavorito[0],
                          groupValue: selecionadoVeiculoFavorito,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoVeiculoFavorito = value.toString();
                              _pagina4Data.selecionadoVeiculoFavorito =
                                  selecionadoVeiculoFavorito;
                              _sendDataToParent();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Trem",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: VeiculoFavorito[1],
                          groupValue: selecionadoVeiculoFavorito,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoVeiculoFavorito = value.toString();
                              _pagina4Data.selecionadoVeiculoFavorito =
                                  selecionadoVeiculoFavorito;
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
                          "Carro",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: VeiculoFavorito[2],
                          groupValue: selecionadoVeiculoFavorito,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoVeiculoFavorito = value.toString();
                              _pagina4Data.selecionadoVeiculoFavorito =
                                  selecionadoVeiculoFavorito;
                              _sendDataToParent();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Bicicleta",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: VeiculoFavorito[3],
                          groupValue: selecionadoVeiculoFavorito,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoVeiculoFavorito = value.toString();
                              _pagina4Data.selecionadoVeiculoFavorito =
                                  selecionadoVeiculoFavorito;
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
                          "Avião",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: VeiculoFavorito[4],
                          groupValue: selecionadoVeiculoFavorito,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoVeiculoFavorito = value.toString();
                              _pagina4Data.selecionadoVeiculoFavorito =
                                  selecionadoVeiculoFavorito;
                              _sendDataToParent();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Barco",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: VeiculoFavorito[5],
                          groupValue: selecionadoVeiculoFavorito,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoVeiculoFavorito = value.toString();
                              _pagina4Data.selecionadoVeiculoFavorito =
                                  selecionadoVeiculoFavorito;
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
                          "Carroça",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: VeiculoFavorito[6],
                          groupValue: selecionadoVeiculoFavorito,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoVeiculoFavorito = value.toString();
                              _pagina4Data.selecionadoVeiculoFavorito =
                                  selecionadoVeiculoFavorito;
                              _sendDataToParent();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Moto",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: VeiculoFavorito[7],
                          groupValue: selecionadoVeiculoFavorito,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoVeiculoFavorito = value.toString();
                              _pagina4Data.selecionadoVeiculoFavorito =
                                  selecionadoVeiculoFavorito;
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
                          "Táxi",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: VeiculoFavorito[8],
                          groupValue: selecionadoVeiculoFavorito,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoBriquendo = value.toString();
                              _pagina4Data.selecionadoVeiculoFavorito =
                                  selecionadoVeiculoFavorito;
                              _sendDataToParent();
                            });
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text(
                          "Foguete",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        leading: Radio(
                          value: VeiculoFavorito[9],
                          groupValue: selecionadoVeiculoFavorito,
                          activeColor: Colors.white,
                          onChanged: (value) {
                            setState(() {
                              selecionadoVeiculoFavorito = value.toString();
                              _pagina4Data.selecionadoVeiculoFavorito =
                                  selecionadoVeiculoFavorito;
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
