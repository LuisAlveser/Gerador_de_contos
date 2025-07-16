import 'package:flutter/material.dart';

class Pagina3FormCrianca extends StatefulWidget {
  const Pagina3FormCrianca({super.key});

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
List<String> RelacaoComTecnologia = ["Celular","Televisão","Tablet","Computador"];

class _Pagina3FormCriancaState extends State<Pagina3FormCrianca> {
  String selecionadoAcompanhamento = AcompanhamentoProfissional[0];
  String selecionadoRelacaoLivros = RelacaoComLivros[0];
  String selecionadoRelacaoComTecnologia = RelacaoComTecnologia[0];
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
                            ),
                          ),
                          leading: Radio(
                            value: RelacaoComLivros[0],
                            groupValue: selecionadoRelacaoLivros,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoRelacaoLivros = value.toString();
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
                            ),
                          ),
                          leading: Radio(
                            value: RelacaoComLivros[1],
                            groupValue: selecionadoRelacaoLivros,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoRelacaoLivros = value.toString();
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
                            ),
                          ),
                          leading: Radio(
                            value: RelacaoComLivros[2],
                            groupValue: selecionadoRelacaoLivros,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoRelacaoLivros = value.toString();
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
                            ),
                          ),
                          leading: Radio(
                            value: RelacaoComLivros[3],
                            groupValue: selecionadoRelacaoLivros,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoRelacaoLivros = value.toString();
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
                            ),
                          ),
                          leading: Radio(
                            value: RelacaoComLivros[4],
                            groupValue: selecionadoRelacaoLivros,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoRelacaoLivros = value.toString();
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
                            ),
                          ),
                          leading: Radio(
                            value: RelacaoComLivros[5],
                            groupValue: selecionadoRelacaoLivros,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoRelacaoLivros = value.toString();
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
                            ),
                          ),
                          leading: Radio(
                            value: RelacaoComLivros[6],
                            groupValue: selecionadoRelacaoLivros,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoRelacaoLivros = value.toString();
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
                            ),
                          ),
                          leading: Radio(
                            value: RelacaoComLivros[7],
                            groupValue: selecionadoRelacaoLivros,
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                selecionadoRelacaoLivros = value.toString();
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
                    "Com relação as tecnologias, com que freqüência ele/ ela utiliza?",
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
