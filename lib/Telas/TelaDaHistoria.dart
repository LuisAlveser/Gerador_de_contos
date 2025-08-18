import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'dart:io';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:tcc/Model/HistoriaModeloreal.dart';
import 'package:tcc/Telas/TelaPrincipalApp.dart';
import 'package:tcc/servicos/Historia_Servico.dart';
import 'package:http/http.dart' as http;
import 'package:tcc/servicos/Pdf_Servico.dart';

class Teladahistoria extends StatefulWidget {
  final DocumentSnapshot? doc;
  final String? historiapadraoTexto;
  final DocumentSnapshot? historiadoc;

  const Teladahistoria({
    super.key,
    this.doc,
    this.historiapadraoTexto,
    this.historiadoc,
  });

  @override
  State<Teladahistoria> createState() => _TeladahistoriaState();
}

class _TeladahistoriaState extends State<Teladahistoria> {
  String textoDaHistoria = "";
  bool carregandoHistoria = false;
  bool salvandohistoria = false;
  bool carregandoImagem = true;
  String? imagemUrl;
  Future<void> gerarhistoria() async {
    setState(() {
      carregandoHistoria = true;

      textoDaHistoria = "";
      carregandoImagem = true;
    });

    try {
      final gemini = Gemini.instance;

      gemini.info(model: 'gemini-2.5-flash').then((info) => print(info));

      String prompt = '''
Crie uma história para uma criança de nome ${widget.doc?["nome"]}, com idade de ${widget.doc?["idade"]} e autismo de nível ${widget.doc?["nivel_TEA"]}. 
Essa criança possui comunicação ${widget.doc?["comunicacao"]}, está no ano escolar ${widget.doc?["ano_escolar"]}, e tem como hiperfoco ${widget.doc?["hiperfoco"]}.
A história deve conter: ${widget.doc?["deve_ter_na_historia"]}.
A história não deve conter: ${widget.doc?["nao_deve_ter_na_historia"]}.
Personagens secundários: ${widget.doc?["conjuge_nomes"]} e ${widget.doc?["amigos_nomes"]}.
A duração da história deve ser de:
- 1 a 2 páginas se nível TEA for 3,
- 3 a 4 páginas para nível 2,
- 5 páginas para nível 1.
''';

      final value = await Gemini.instance.prompt(
        parts: [Part.text(prompt)],
        generationConfig: GenerationConfig(maxOutputTokens: 100),
      );
      if (value?.output != null) {
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

  gerarImagens() async {
    final apiKey = dotenv.env["chave_OpenAI_imagem"];

    final uri = Uri.parse("https://api.openai.com/v1/images/generations");
    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${apiKey}",
    };

    int numero_imagens;
    switch (widget.doc?["nivel_TEA"]) {
      case "Nível 1":
        numero_imagens = 4;
        break;
      case "Nível 2":
        numero_imagens = 3;
        break;
      case "Nível 3":
        numero_imagens = 1;
        break;
      default:
        numero_imagens = 2;
    }
    final body = jsonEncode({
      "model": "dall-e-3",
      "prompt":
          "Crie uma imagem do naruto  para uma criança de ${widget.doc?["idade"]} anos  de idade e que tem ${widget.doc?["nivel_TEA"]} de autismo.", //colocar prompt
      "size": "1024x1024",
      "n": 1,
    });

    try {
      final response = await http.post(uri, headers: headers, body: body);
      print(response.body);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        setState(() {
          carregandoImagem = false;
          imagemUrl = responseData["data"][0]["url"];
        });
      } else {
        print(
          "Erro ao gerar imagem: ${response.statusCode} - ${response.body}",
        );
      }
    } catch (e) {
      print("Erro: $e");
    }
  }

  @override
  void initState() {
    super.initState();
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
    if (widget.historiadoc != null) {
      textoDaHistoria = widget.historiadoc?["texto"];
    }
    if (widget.doc != null) {
      gerarhistoria();
    }

    if (widget.historiapadraoTexto != null) {
      gerarhistoria();
      //  gerarImagens();
    }
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
          widget.historiadoc != null
              ? "Relembrando a História "
              : "História  para ${widget.doc?["nome"]}",
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
                : Column(
                  children: [
                    Text(
                      textoDaHistoria,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ), //texto da história
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    if (imagemUrl != null)
                      Image.network(
                        imagemUrl!,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (carregandoImagem == false) {
                            return child;
                          }
                          return const Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          );
                        },
                      )
                    else
                      Container(),
                  ],
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
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 100.0,
                  height: 40.0,
                  child:
                      widget.historiadoc != null
                          ? null
                          : ElevatedButton(
                            onPressed:
                                salvandohistoria
                                    ? null
                                    : () async {
                                      setState(() {
                                        salvandohistoria = true;
                                      });
                                      HistoriaModeloReal historiamodel =
                                          HistoriaModeloReal(
                                            idhistoria: "",
                                            idquestionario: widget.doc!.id,
                                            texto: textoDaHistoria,
                                            data: DateTime.now(),
                                          );
                                      HistoriaService historiaService =
                                          HistoriaService();
                                      bool sucesso;
                                      sucesso = await historiaService
                                          .cadastrarHistoria(
                                            historiamodel: historiamodel,
                                            context: context,
                                          );
                                      if (sucesso) {
                                        setState(() {
                                          salvandohistoria = false;
                                        });
                                        if (widget.doc != null) {
                                          Navigator.pushAndRemoveUntil(
                                            context,
                                            MaterialPageRoute(
                                              builder:
                                                  (context) =>
                                                      const TelaPrincipal(),
                                            ),
                                            (Route<dynamic> route) => false,
                                          );
                                          setState(() {});
                                        }
                                      }
                                    },
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
                                Text(
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
                    onPressed: () async {
                      //baixar pdf
                      Pdf_servico pdf_servico = Pdf_servico();
                      Future<String> caminho = pdf_servico.generateAndSavePdf(
                        texto: textoDaHistoria,
                      );
                      pdf_servico.baixarPDF(await caminho);
                    },
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
