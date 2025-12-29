import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_ai/firebase_ai.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:tcc/Model/HistoriaModeloreal.dart';
import 'package:tcc/Telas/TelaPrincipalApp.dart';
import 'package:tcc/servicos/Historia_Servico.dart';
import 'package:http/http.dart' as http;
import 'package:tcc/servicos/Pdf_Servico.dart';

class Teladahistoria extends StatefulWidget {
  final DocumentSnapshot? doc;
  final String? historiapadraoTexto;
  final DocumentSnapshot? historiadoc;
  final int historiasSalvas;

  const Teladahistoria({
    super.key,
    this.doc,
    this.historiapadraoTexto,
    this.historiadoc,
    required this.historiasSalvas,
  });

  @override
  State<Teladahistoria> createState() => _TeladahistoriaState();
}

class _TeladahistoriaState extends State<Teladahistoria> {
  String textoDaHistoria = "";
  bool carregandoHistoria = false;
  bool salvandohistoria = false;
  bool carregandoImagem = false;
  bool baixandoPDF = false;
  List<String?> urls = List.filled(2, null);

  Future<void> gerarhistoria() async {
    setState(() {
      carregandoHistoria = true;
      carregandoImagem = true;
      textoDaHistoria = "";
      baixandoPDF = false;
      salvandohistoria = false;
    });

    try {
      final model = FirebaseAI.googleAI().generativeModel(
        model: 'gemini-2.5-flash',
      );

      String prompt =
          (widget.historiapadraoTexto != null &&
                  widget.historiapadraoTexto!.isNotEmpty)
              ? '''
Crie uma história para uma criança de nome ${widget.doc?["nome"]}, com idade de ${widget.doc?["idade"]} e autismo de nível ${widget.doc?["nivel_TEA"]}. 
Essa criança possui comunicação ${widget.doc?["comunicacao"]}, está no ano escolar ${widget.doc?["ano_escolar"]}, e tem como hiperfoco ${widget.doc?["hiperfoco"]}.
A história deve dar ênfase nesssas preferências : ${widget.historiapadraoTexto}.
A história não deve conter: ${widget.doc?["nao_deve_ter_na_historia"]}.
Personagens secundários: ${widget.doc?["conjuge_nomes"]} e ${widget.doc?["amigos_nomes"]}.
A duração da história deve ser de:
- 1 a 2 páginas se nível TEA for 3  ou se for  não sei informar ou ainda não foi diagnosticado ou prefiro não responder,
- 3 a 4 páginas para nível 2,
- 5 páginas para nível 1.
**IMPORTANTE: Não use aspas curvas (“ ” ‘ ’) ou reticências (…); use apenas aspas retas (") e apóstrofos retos (') e ao final do texto coloque essa frase História Gerada por ContoTEIA.**
'''
              : '''
Crie uma história para uma criança de nome ${widget.doc?["nome"]}, com idade de ${widget.doc?["idade"]} e autismo de nível ${widget.doc?["nivel_TEA"]}. 
Essa criança possui comunicação ${widget.doc?["comunicacao"]}, está no ano escolar ${widget.doc?["ano_escolar"]}, e tem como hiperfoco ${widget.doc?["hiperfoco"]}.
A história deve conter: ${widget.doc?["deve_ter_na_historia"]}.
A história não deve conter: ${widget.doc?["nao_deve_ter_na_historia"]}.
Personagens secundários: ${widget.doc?["conjuge_nomes"]} e ${widget.doc?["amigos_nomes"]}.
A duração da história deve ser de:
- 1 a 2 páginas se nível TEA for 3 ou se for não sei informar ou ainda não foi diagnosticado ou prefiro não responder,
- 3 a 4 páginas para nível 2,
- 5 páginas para nível 1.
**IMPORTANTE: Não use aspas curvas (“ ” ‘ ’) ou reticências (…); use apenas aspas retas (") e apóstrofos retos (') e ao final do texto coloque essa frase História Gerada por ContoTEIA.**
''';

      final contents = [Content.text(prompt)];

      final response = await model.generateContent(contents);

      if (response.text != null) {
        setState(() {
          textoDaHistoria = response.text!;
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

  gerarImagens(int i, String descricaoImagem) async {
    setState(() {
      carregandoImagem = true;
    });

    final apiKey = dotenv.env["chave_OpenAI_imagem"];

    final uri = Uri.parse("https://api.openai.com/v1/images/generations");
    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${apiKey}",
    };

    final body = jsonEncode({
      "model": "dall-e-3",
      "prompt":
          "Crie uma imagem em formato de desenho animado, com cores vibrantes e uma atmosfera alegre, com base nesse resumo${descricaoImagem.toString()} .A imagem  não deve ter direitos autorais.",
      "n": 1,
      "size": "1024x1024",
    });

    try {
      final response = await http.post(uri, headers: headers, body: body);
      print(response.body);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        setState(() {
          urls[i] = responseData["data"][0]["url"];
          print(urls[i]);
        });
      } else {
        print(
          "Erro ao gerar imagem: ${response.statusCode} - ${response.body}",
        );
      }
    } catch (e) {
      print("Erro: $e");
    }
    setState(() {
      carregandoImagem = false;
    });
  }

  @override
  void initState() {
    super.initState();
    baixandoPDF = false;
    salvandohistoria = false;

    if (widget.historiadoc != null) {
      urls[0] = widget.historiadoc?["urlimagem"]; //carrega as imagens salvas
      urls[1] = widget.historiadoc?["urlimagem2"];
      textoDaHistoria = widget.historiadoc?["texto"];
    }
    if (widget.doc != null && widget.historiapadraoTexto == null) {
      gerarhistoria();
    }

    if (widget.historiapadraoTexto != null) {
      gerarhistoria().then((_) async {
        final model = FirebaseAI.googleAI().generativeModel(
          model: 'gemini-2.5-flash',
        );

        final promptParaImagem =
            "Com base na seguinte história: '${textoDaHistoria.toString()}', gere um resumo detalhado contendo o começo,meio e fim da história.Esse resumo deve ter no máximo 1000 caracteres. ";

        final contents = [Content.text(promptParaImagem)];

        final response = await model.generateContent(contents);

        final descricaoImagem = response?.text;
        print(descricaoImagem);
        if (descricaoImagem == null || descricaoImagem.isEmpty) {
          print('Não foi possível gerar a descrição para a imagem.');
        }
        for (int i = 0; i < urls.length; i++) {
          await gerarImagens(i, descricaoImagem.toString());
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(167, 234, 235, 236),
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
        backgroundColor: Color.fromARGB(167, 10, 134, 235),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child:
            carregandoHistoria
                ? Center(child: CircularProgressIndicator(color: Colors.white))
                : Column(
                  children: [
                    urls[0] != null
                        ? carregandoImagem
                            ? Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                            : Image.network(
                              urls[0]!,
                              fit: BoxFit.cover,
                              loadingBuilder: (
                                context,
                                child,
                                loadingProgress,
                              ) {
                                if (carregandoImagem == false) {
                                  return child;
                                }
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                );
                              },
                            )
                        : Padding(padding: EdgeInsets.only(top: 20)),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Text(
                      textoDaHistoria,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ), //texto da história
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    urls[1] != null
                        ? Image.network(
                          urls[1]!,
                          fit: BoxFit.cover,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (carregandoImagem == false) {
                              return child;
                            }
                            return Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            );
                          },
                        )
                        : const SizedBox.shrink(),
                  ],
                ),
      ),

      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
        ),
        child: Container(
          color: Color.fromARGB(167, 10, 134, 235),
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
                            onPressed: () async {
                              setState(() {
                                salvandohistoria = true;
                              });
                              if (widget.historiapadraoTexto != null) {
                                if (widget.historiasSalvas == 3) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "Você excedeu o número de histórias salvas, exclua alguma para poder salvar uma nova",
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                } else {
                                  HistoriaService historiaService =
                                      HistoriaService();
                                  final file = await historiaService
                                      .baixarImagemDaUrl(urls[0]!);
                                  final file2 = await historiaService
                                      .baixarImagemDaUrl(urls[1]!);
                                  HistoriaModeloReal historiamodel =
                                      HistoriaModeloReal(
                                        idhistoria: "",
                                        idquestionario: widget.doc!.id,
                                        texto: textoDaHistoria,
                                        data: DateTime.now(),
                                        urlimagem: await historiaService
                                            .uploadImagemParaStorage(file),

                                        urlimagem2: await historiaService
                                            .uploadImagemParaStorage(file2),
                                        nota: 0,
                                      );

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
                                }
                              } else {
                                if (widget.historiasSalvas == 30) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "Você excedeu o número de histórias salvas, exclua alguma para poder salvar uma nova",
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                } else {
                                  //Historia sem imagem
                                  HistoriaService historiaService =
                                      HistoriaService();

                                  HistoriaModeloReal historiamodel =
                                      HistoriaModeloReal(
                                        idhistoria: "",
                                        idquestionario: widget.doc!.id,
                                        texto: textoDaHistoria,
                                        data: DateTime.now(),
                                        urlimagem: null,
                                        urlimagem2: null,

                                        nota: 0.0,
                                      );

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
                                  salvandohistoria ? "..." : "Salvar História",
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
                      setState(() {
                        baixandoPDF = true;
                      });

                      //baixar pdf

                      List<String> urlsImagensValidas =
                          urls
                              .whereType<String>()
                              .where((url) => url.isNotEmpty)
                              .toList();
                      print(urlsImagensValidas.length);
                      Pdf_servico pdf_servico = Pdf_servico();
                      pdf_servico.generateAndSavePdf(
                        texto: textoDaHistoria,
                        urlsImagens: urlsImagensValidas,
                      );
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
                        Text(
                          baixandoPDF ? "..." : "Baixar História",
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
