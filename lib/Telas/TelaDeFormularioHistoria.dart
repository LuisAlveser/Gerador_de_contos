import 'package:flutter/material.dart';

import 'package:tcc/Decoracao/DecoracaoAutenticacao.dart';

class TelaDeFormularioHistoria extends StatefulWidget {
  const TelaDeFormularioHistoria({super.key});

  @override
  State<TelaDeFormularioHistoria> createState() =>
      _TelaDeFormularioHistoriaState();
}

class _TelaDeFormularioHistoriaState extends State<TelaDeFormularioHistoria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(167, 10, 134, 235),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.9,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/fundo_form_hist.jpg"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Column(
              children: [
                AppBar(
                  title: Text(
                    "Personalize sua História",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  forceMaterialTransparency: true,
                ),
                Form(
                  child: Column(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 50.0),
                              child: SizedBox(
                                width: 300.0,
                                height: 100,
                                child: TextFormField(
                                  decoration: getAutenticationInputDecoration(
                                    "Título",
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              width: 300.0,
                              height: 100,
                              child: TextFormField(
                                decoration: getAutenticationInputDecoration(
                                  "Temática",
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              width: 300.0,
                              height: 100,
                              child: TextFormField(
                                decoration: getAutenticationInputDecoration(
                                  "Personagem Principal",
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              width: 300.0,
                              height: 100,
                              child: TextFormField(
                                decoration: getAutenticationInputDecoration(
                                  "Personagens Secundários",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 160.0),
                        child: SizedBox(
                          width: 200.0,
                          height: 50.0,

                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) => TelaDeFormularioHistoria(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                            ),
                            child: Stack(
                              alignment: Alignment.center,

                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Image.asset(
                                    'assets/fundo_botao.jpg',
                                    height: double.infinity,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  "Gerar História",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20.0,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
