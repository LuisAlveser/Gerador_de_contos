import 'package:flutter/material.dart';

import 'package:tcc/Decoracao/DecoracaoAutenticacao.dart';
import 'package:tcc/Model/CriancaModelo.dart';
import 'package:tcc/Model/QuestinarioModel.dart';

class TelaDeFormularioHistoria extends StatefulWidget {
  final QuestionarioModel questionarioModel;
  const TelaDeFormularioHistoria({super.key, required this.questionarioModel});

  @override
  State<TelaDeFormularioHistoria> createState() =>
      _TelaDeFormularioHistoriaState();
}

class _TelaDeFormularioHistoriaState extends State<TelaDeFormularioHistoria> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),

        title: Text(
          "Personalize sua História",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      backgroundColor: const Color.fromARGB(167, 10, 134, 235),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Text(
                            "Personagens que ${widget.questionarioModel.nome} mais gosta são: ${widget.questionarioModel.coisasPreferidas} ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Padding(padding: EdgeInsets.only(top: 10)),
                          SizedBox(
                            width: 300.0,
                            height: 100,
                            child: TextFormField(
                              decoration: getAutenticationInputDecoration(
                                "Selecione 5 preferências",
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
                            //   Navigator.push(
                            //    context,
                            //   MaterialPageRoute(
                            //   builder:
                            //   (context) => TelaDeFormularioHistoria(), ir para a historia
                            //    ),
                            //   );
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
    );
  }
}
