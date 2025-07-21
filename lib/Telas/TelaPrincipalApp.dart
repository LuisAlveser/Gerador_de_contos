import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tcc/Model/CriancaModelo.dart';
import 'package:tcc/Model/HistoriaModelo.dart';
import 'package:tcc/Telas/TelaDeCadastroCrianca.dart';
import 'package:tcc/Telas/TelaDeFormularioHistoria.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  List<CriancaModelo> criancas = [
    CriancaModelo(
      nome: "luis",
      idade: "13",
      sexo: "Masculino",
      personagem_preferido: "Naruto",
    ),
    CriancaModelo(
      nome: "Ana",
      idade: "7",
      sexo: "Feminino",
      personagem_preferido: "Patrulha",
    ),
  ];
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
      body: Visibility(
        visible: criancas.isNotEmpty,

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...List.generate(criancas.length, (index) {
              CriancaModelo criancaModelo = criancas[index];
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
                                criancaModelo.nome,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 200.0),
                              IconButton(
                                onPressed: () {
                                  // atualiza dados
                                },
                                icon: Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {
                                  // deleta criança
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
                          Text("Idade: ${criancaModelo.idade}"),
                        ],
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          Icon(Icons.people_alt, size: 20),
                          SizedBox(width: 6),
                          Text("Gênero: ${criancaModelo.sexo}"),
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => TelaDeFormularioHistoria(
                                            criancaModelo: criancaModelo,
                                          ),
                                    ),
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
            }),
          ],
        ),
      ), //crianças cadastradas
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 25, 72, 137),
        child: DrawerHeader(
          child: Column(
            children: [
              AppBar(
                iconTheme: IconThemeData(color: Colors.white),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back),
                ),
                title: Text(
                  "Histórias Salvas",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Colors.transparent,
              ),
              Divider(color: Colors.white, thickness: 2),
              Padding(padding: EdgeInsets.only(top: 2)),
              //histórias salvas
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...List.generate(historias.length, (index) {
                    HistoriaModelo historiaModelo = historias[index];
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
                                    Icon(Icons.menu_book, color: Colors.blue),
                                    SizedBox(width: 8),
                                    Text(
                                      "Titulo: ${historiaModelo.titulo}",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(width: 12),

                                    IconButton(
                                      onPressed: () {
                                        // deleta história
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                        size: 25,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            SizedBox(height: 10),

                            Row(
                              children: [
                                Icon(Icons.calendar_month, size: 20),
                                SizedBox(width: 6),
                                Text(
                                  "Data: ${historiaModelo.data.day}/${historiaModelo.data.month}/${historiaModelo.data.year}",
                                ),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 10)),
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
                                        //ir para historia salva
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
                  }),
                ],
              ),
            ],
          ),
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
