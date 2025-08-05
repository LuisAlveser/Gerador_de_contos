import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:io';
import 'package:flutter_gemini/flutter_gemini.dart';

class Teladahistoria extends StatefulWidget {
  final DocumentSnapshot doc;
  final String? historiapadraoTexto;

  const Teladahistoria({
    super.key,
    required this.doc,
    this.historiapadraoTexto,
  });

  @override
  State<Teladahistoria> createState() => _TeladahistoriaState();
}

class _TeladahistoriaState extends State<Teladahistoria> {
  String textoDaHistoria = "";
  bool carregandoHistoria = false;

  Future<void> gerarhistoria() async {
    setState(() {
      carregandoHistoria = true;
      textoDaHistoria = "";
    });

    try {
      final gemini = Gemini.instance;

      gemini.info(model: 'gemini-2.5-flash').then((info) => print(info));

      String prompt = '''
Crie uma história para uma criança de nome ${widget.doc["nome"]}, com idade de ${widget.doc["idade"]} e autismo de nível ${widget.doc["nivel_TEA"]}. 
Essa criança possui comunicação ${widget.doc["comunicacao"]}, está no ano escolar ${widget.doc["ano_escolar"]}, e tem como hiperfoco ${widget.doc["hiperfoco"]}.
A história deve conter: ${widget.doc["deve_ter_na_historia"]}.
A história não deve conter: ${widget.doc["nao_deve_ter_na_historia"]}.
Personagens secundários: ${widget.doc["conjuge_nomes"]} e ${widget.doc["amigos_nomes"]}.
A duração da história deve ser de:
- 1 a 2 páginas se nível TEA for 3,
- 3 a 4 páginas para nível 2,
- 5 páginas para nível 1.
''';
      print("Prompt enviado:\n$prompt");
      final value = await Gemini.instance.prompt(
        parts: [Part.text(prompt)],
        generationConfig: GenerationConfig(maxOutputTokens: 300),
      );
      if (value?.output != null) {
        print(" História recebida:\n${value?.output}");
        setState(() {
          textoDaHistoria = value!.output!;
          carregandoHistoria = false;
        });
      } else {
        print(' Nenhuma saída recebida da API do Gemini.');
        setState(() {
          carregandoHistoria = false;
          textoDaHistoria =
              'Não foi possível gerar a história. Por favor, tente novamente.';
        });
      }
    } catch (e) {
      print(' Erro ao gerar história: $e');
      setState(() {
        carregandoHistoria = false;
      });
    }
  }

  @override
  void initState() {
    final apiKey = dotenv.env["chave_google_texto"];

    if (apiKey != null && apiKey.isNotEmpty) {
      Gemini.init(apiKey: apiKey);
      print(" Gemini inicializado com sucesso!");
    } else {
      print(
        " Erro: chave_google_texto não encontrada no arquivo .env ou está vazia.",
      );

      textoDaHistoria = 'Erro: Chave de API do Gemini não configurada.';
    }
    super.initState();
    gerarhistoria();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(167, 10, 134, 235),
      appBar: AppBar(
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),
        title: Text(
          "História  para ${widget.doc["nome"]}",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child:
            carregandoHistoria
                ? Center(
                  child: const CircularProgressIndicator(color: Colors.white),
                )
                : Text(
                  textoDaHistoria,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ), //texto da história
                ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            bottom: 0.0,
            top: 5.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 100.0,
                  height: 40.0,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            'assets/fundo_botao.jpg',
                            fit: BoxFit.cover,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                        ),
                        const Text(
                          "Salvar História",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 100.0,
                  height: 40.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    onPressed: () {},
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset(
                            'assets/fundo_botao.jpg',
                            fit: BoxFit.cover,
                            height: double.infinity,
                            width: double.infinity,
                          ),
                        ),
                        const Text(
                          "Baixar História",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
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
      ),
    );
  }
}
