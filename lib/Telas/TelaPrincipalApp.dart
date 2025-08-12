import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tcc/Decoracao/DecoracaoAutenticacao.dart';

import 'package:tcc/Model/HistoriaModelo.dart';

import 'package:tcc/Telas/TelaDeCadastroCrianca.dart';
import 'package:tcc/Telas/TelaDaHistoria.dart';
import 'package:tcc/servicos/AdicionarQuestionario.dart';
import 'package:tcc/servicos/Historia_Servico.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  late final QuestionarioService _questionarioService = QuestionarioService();
  final HistoriaService _historiaService = HistoriaService();
  late DocumentSnapshot docRef;
  List<HistoriaModelo> historias = [
    HistoriaModelo(
      titulo: "A árvore de natal",
      texto: "guyuyuyu",
      data: DateTime.now(),
    ),
  ];

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: const Color.fromARGB(167, 10, 134, 235),
      appBar: AppBar(
        title: Text(
          "Crianças Cadastradas",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _questionarioService.getQuestionariosPorResponsavel(),
        builder: (_, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            case ConnectionState.done:
            case ConnectionState.active:
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot doc = snapshot.data!.docs[index];

                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.person, color: Colors.blue),
                                  SizedBox(width: 8),
                                  Text(
                                    doc["nome"],
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) =>
                                                  TelaDeFormularioCrianca(
                                                    doc: doc,
                                                  ),
                                        ),
                                      );
                                    },
                                    icon: Icon(Icons.edit),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      SnackBar snackBar = SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text(
                                          "Deseja remover ${doc['nome']} ?",
                                          selectionColor: Colors.white,
                                        ),

                                        action: SnackBarAction(
                                          label: "Remover",
                                          textColor: Colors.white,
                                          onPressed: () {
                                            _questionarioService
                                                .removerquestionario(
                                                  idquestionario:
                                                      doc["idquestionario"],
                                                );
                                          },
                                        ),
                                      );
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(snackBar);
                                    },
                                    icon: Icon(Icons.delete, color: Colors.red),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.cake, size: 20),
                              SizedBox(width: 6),
                              Text("Idade: ${doc["idade"]}"),
                            ],
                          ),
                          SizedBox(height: 6),
                          Row(
                            children: [
                              Icon(Icons.people_alt, size: 20),
                              SizedBox(width: 6),
                              Text("Gênero: ${doc["genero"]}"),
                            ],
                          ),
                          SizedBox(height: 12),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.asset(
                                    'assets/fundo_botao.jpg',
                                    width: 150,
                                    height: 40,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  width: 200,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          final TextEditingController
                                          preferencias_controller =
                                              TextEditingController();
                                          bool historia_padrao = false;

                                          return StatefulBuilder(
                                            builder: (
                                              BuildContext context,
                                              StateSetter setState,
                                            ) {
                                              return AlertDialog(
                                                backgroundColor: Color.fromARGB(
                                                  167,
                                                  10,
                                                  134,
                                                  235,
                                                ),
                                                title: Text(
                                                  "Selecione o Modo da História",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white,
                                                  ),
                                                ),

                                                content: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      TextButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            historia_padrao =
                                                                false;
                                                          });
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      Teladahistoria(
                                                                        doc:
                                                                            doc,
                                                                      ),
                                                            ),
                                                          );
                                                        },

                                                        child: Text(
                                                          "Modo História Rápida : Nesse modo são escolhidas cinco preferências da criança de modo aleatório. (Imagens não estão inclusas com a história)",
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                      Divider(
                                                        color: Colors.white,
                                                        thickness: 2.0,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                              top: 15,
                                                            ),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          setState(() {
                                                            historia_padrao =
                                                                true;
                                                          });
                                                        },
                                                        child: Text(
                                                          "Modo História Padrão : Nesse modo as preferências da criança são escolhidas pelo responsável. (Imagens inclusas com a história)",
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                      Divider(
                                                        color: Colors.white,
                                                        thickness: 2.0,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                              top: 15,
                                                            ),
                                                      ),

                                                      Visibility(
                                                        visible:
                                                            historia_padrao,
                                                        child: Form(
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                "As preferências de ${doc["nome"]} são : ${doc["coisas_preferidas"]}",
                                                                style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets.only(
                                                                      top: 10,
                                                                    ),
                                                              ),
                                                              SizedBox(
                                                                width: 350,
                                                                height: 50,
                                                                child: TextFormField(
                                                                  decoration:
                                                                      getAutenticationInputDecoration(
                                                                        "Digite cinco  preferências da criança",
                                                                      ),
                                                                  controller:
                                                                      preferencias_controller,
                                                                  validator: (
                                                                    String?
                                                                    value,
                                                                  ) {
                                                                    if (value ==
                                                                            null ||
                                                                        value
                                                                            .isEmpty) {
                                                                      return "Esse campo não pode ser vazio";
                                                                    }
                                                                    return null;
                                                                  },
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets.only(
                                                                      top: 20,
                                                                    ),
                                                              ),
                                                              SizedBox(
                                                                width: 150.0,
                                                                height: 30.0,

                                                                child: ElevatedButton(
                                                                  onPressed: () {
                                                                    Navigator.push(
                                                                      context,
                                                                      MaterialPageRoute(
                                                                        builder:
                                                                            (
                                                                              context,
                                                                            ) => Teladahistoria(
                                                                              doc:
                                                                                  doc,
                                                                              historiapadraoTexto:
                                                                                  preferencias_controller.text,
                                                                            ),
                                                                      ),
                                                                    );
                                                                  },
                                                                  style: ElevatedButton.styleFrom(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                            30.0,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  child: Stack(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,

                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(
                                                                              20.0,
                                                                            ),
                                                                        child: Image.asset(
                                                                          'assets/fundo_botao.jpg',
                                                                          height:
                                                                              double.infinity,
                                                                          width:
                                                                              double.infinity,
                                                                          fit:
                                                                              BoxFit.cover,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        "Gerar História",
                                                                        style: TextStyle(
                                                                          color:
                                                                              Colors.white,
                                                                          fontSize:
                                                                              15.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.transparent,
                                      shadowColor: Colors.transparent,
                                    ),
                                    child: Text(
                                      "Ir para História",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
          }
        },
      ),
      //crianças cadastradas
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 25, 72, 137),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: EdgeInsets.only(top: 50),
              color: Color.fromARGB(255, 25, 72, 137),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Histórias Salvas",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            Divider(color: Colors.white, thickness: 2),

            FutureBuilder<List<QueryDocumentSnapshot>>(
              future:
                  _historiaService
                      .getHistoriasPorQuestionarios(), //passar os questionarios ids
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  );
                }

                final docs = snapshot.data!;

                return ListView.builder(
                  itemCount: docs.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final dochistoria = docs[index];
                    final timestamp = dochistoria["data"];
                    final DateTime data = timestamp.toDate();

                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.menu_book, color: Colors.blue),
                                    SizedBox(width: 8),
                                    Text(
                                      "Título: ${dochistoria["texto"].toString().substring(2, 25)}..",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {
                                    print(dochistoria["id_historia"]);
                                    Navigator.of(context).pop();

                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text(
                                          "Deseja remover essa história ?",
                                          selectionColor: Colors.white,
                                        ),

                                        action: SnackBarAction(
                                          label: "Remover",
                                          textColor: Colors.white,
                                          onPressed: () {
                                            _historiaService.excluirHistoriaPorId(
                                              idHistoria:
                                                  dochistoria["id_historia"],
                                              idquestionario:
                                                  dochistoria["id_questionario"],
                                            );
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                  icon: Icon(Icons.delete, color: Colors.red),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Icon(Icons.calendar_month, size: 20),
                                SizedBox(width: 6),
                                Text(
                                  "Data: ${data.day} / ${data.month} / ${data.year}",
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: SizedBox(
                                    width: 100.0,
                                    height: 20.0,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => Teladahistoria(
                                                  historiadoc: dochistoria,
                                                ),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        padding: EdgeInsets.zero,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            30.0,
                                          ),
                                        ),
                                      ),
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Image.asset(
                                            'assets/fundo_botao.jpg',
                                            fit: BoxFit.cover,
                                            height: double.infinity,
                                            width: double.infinity,
                                          ),
                                          Text(
                                            "Ler Novamente",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),

      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: IconButton(onPressed: () {}, icon: Icon(Icons.exit_to_app)),
              label: 'Sair',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();
                },
                icon: Icon(Icons.bookmark_outline),
              ),
              label: 'Histórias Salvas',
            ),
            BottomNavigationBarItem(
              icon: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TelaDeFormularioCrianca(),
                    ),
                  );
                },
                icon: Icon(Icons.person_add_alt_outlined),
              ),
              label: 'Adicionar Criança',
            ),
          ],
        ),
      ),
    );
  }
}
