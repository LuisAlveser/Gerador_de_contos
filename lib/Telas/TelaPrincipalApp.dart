import 'package:flutter/material.dart';
import 'package:tcc/Model/CriancaModelo.dart';
import 'package:tcc/Telas/TelaDeCadastroCrianca.dart';
import 'package:tcc/Telas/TelaDeFormularioHistoria.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  final bool lista_visivel = false;
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
      personagem_preferido: "Patrulha Canina",
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
                                          (context) =>
                                              TelaDeFormularioHistoria(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                ),
                                child: Text(
                                  "Gerar História",

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
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
    );
  }
}
