import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tcc/Model/QuestinarioModel.dart';
import 'package:tcc/TelaParaCadastraCrianca/Pagina1.dart';
import 'package:tcc/TelaParaCadastraCrianca/Pagina2.dart';
import 'package:tcc/TelaParaCadastraCrianca/Pagina3.dart';
import 'package:tcc/TelaParaCadastraCrianca/Pagina4.dart';
import 'package:tcc/TelaParaCadastraCrianca/Pagina5.dart';
import 'package:tcc/TelaParaCadastraCrianca/Pagina6.dart';
import 'package:tcc/TelaParaCadastraCrianca/Pagina7.dart';
import 'package:tcc/Telas/TelaPrincipalApp.dart';
import 'package:tcc/servicos/AdicionarQuestionario.dart';

class TelaDeFormularioCrianca extends StatefulWidget {
  final DocumentSnapshot? doc;
  const TelaDeFormularioCrianca({super.key, this.doc});

  @override
  State<TelaDeFormularioCrianca> createState() =>
      _TelaDeFormularioCriancaState();
}

class _TelaDeFormularioCriancaState extends State<TelaDeFormularioCrianca> {
  final PageController _pageController = PageController(initialPage: 0);

  final Map<int, GlobalKey<FormState>> formKeys = {
    0: GlobalKey<FormState>(),
    1: GlobalKey<FormState>(),
    2: GlobalKey<FormState>(),
    3: GlobalKey<FormState>(),
    4: GlobalKey<FormState>(),
    5: GlobalKey<FormState>(),
    6: GlobalKey<FormState>(),
  };

  final Map<int, dynamic> _formData = {
    0: Pagina1Data(
      nomecrianca: '',
      idade: '',
      apelido: '',
      selecionadoOculos: '',
      selecionadaTea: '',
      selecionadoNivel: '',
    ),
    1: Pagina2Data(
      selecionadoGenero: '',
      selecionadoVerbo: '',
      selecionadoEletronico: '',
      selecionadoEtapaEducacaoBasica: '',
    ),
    2: Pagina3Data(
      selecionadoAcompanhamento: '',
      selecionadoRelacaoLivros: '',
      selecionadoRelacaoComTecnologia: '',
    ),
    3: Pagina4Data(
      selecionadoBrinquedo: '',
      selecionadoCor: '',
      selecionadoVeiculoFavorito: '',
    ),
    4: Pagina5Data(
      selecionadaComidaFavorita: '',
      selecionadaAtividadeFavorita: '',
      selecionadoMovimentoFavoritos: '',
    ),
    5: Pagina6Data(
      brinquedos: '',
      coisasfavoritas: '',
      acessoriofavoritos: '',
      animaisfavoritos: '',
      historiacoisasfavoritas: '',
      historiacoisasNaofavoritas: '',
      selecionadoParentesco: '',
      selecionadoProcessoAlf: '',
    ),
    6: Pagina7Data(
      moracomcrianca: '',
      amigos: '',
      atividadequegosta: '',
      atividadequeNaogosta: '',
      animalestimacao: '',
      hiperfoco: '',
    ),
  };
  late QuestionarioModel? _currentQuestionario;
  late final List<Widget> paginas;

  int _currentPageIndex = 0;
  void _updatePageData(int pageIndex, dynamic data) {
    _formData[pageIndex] = data;
  }

  @override
  void initState() {
    super.initState();
    if (widget.doc != null) {
      _currentQuestionario = QuestionarioModel.fromMap(
        widget.doc!.data() as Map<String, dynamic>,
        widget.doc!.id,
      );

      _formData[0] = Pagina1Data(
        nomecrianca: _currentQuestionario!.nome,
        idade: _currentQuestionario!.idade,
        apelido: _currentQuestionario!.apelido,
        selecionadoOculos: _currentQuestionario!.usaOculos,
        selecionadaTea: _currentQuestionario!.diagnosticoTEA,
        selecionadoNivel: _currentQuestionario!.nivelTEA,
      );

      _formData[1] = Pagina2Data(
        selecionadoGenero: _currentQuestionario!.genero,
        selecionadoVerbo: _currentQuestionario!.comunicacao,
        selecionadoEletronico: _currentQuestionario!.tecnologiaQueGosta,
        selecionadoEtapaEducacaoBasica: _currentQuestionario!.anoEscolar,
      );
      _formData[2] = Pagina3Data(
        selecionadoAcompanhamento:
            _currentQuestionario!.acompanhamentoProfissinal,
        selecionadoRelacaoLivros: _currentQuestionario!.relacaocomLivros,
        selecionadoRelacaoComTecnologia:
            _currentQuestionario!.tecnologiasUsadasComFrequencia,
      );
      _formData[3] = Pagina4Data(
        selecionadoBrinquedo: _currentQuestionario!.caracteristicaBrinquedo,
        selecionadoCor: _currentQuestionario!.corFavorita,
        selecionadoVeiculoFavorito: _currentQuestionario!.veiculosPreferidos,
      );

      _formData[4] = Pagina5Data(
        selecionadaComidaFavorita: _currentQuestionario!.alimentosNome,
        selecionadaAtividadeFavorita: _currentQuestionario!.atividadeFavorita,
        selecionadoMovimentoFavoritos:
            _currentQuestionario!.movimentoRealizadoComFrequencia,
      );
      _formData[5] = Pagina6Data(
        brinquedos: _currentQuestionario!.brinquedoNome,
        coisasfavoritas: _currentQuestionario!.coisasPreferidas,
        acessoriofavoritos: _currentQuestionario!.acessoriosPreferidos,
        animaisfavoritos: _currentQuestionario!.animaisPreferidos,
        historiacoisasfavoritas: _currentQuestionario!.deveTerNaHistoria,
        historiacoisasNaofavoritas: _currentQuestionario!.naoDeveTernaHistoria,
        selecionadoParentesco: _currentQuestionario!.parentesco,
        selecionadoProcessoAlf: _currentQuestionario!.processoDeAlfabetizacao,
      );
      _formData[6] = Pagina7Data(
        moracomcrianca: _currentQuestionario!.conjugeNomes,
        amigos: _currentQuestionario!.amigosNomes,
        atividadequegosta: _currentQuestionario!.atividadePreferida,
        atividadequeNaogosta: _currentQuestionario!.atividadeNaoGosta,
        animalestimacao: _currentQuestionario!.animalEstimacaoNome,
        hiperfoco: _currentQuestionario!.hiperfoco,
      );
    } else {
      _currentQuestionario = null;
    }
    paginas = [
      Pagina1FormCrianca(
        formKey: formKeys[0]!,
        onDataChanged: (data) => _updatePageData(0, data),
        initialData: _formData[0] as Pagina1Data,
        doc: widget.doc,
      ),

      Pagina2FormCrianca(
        formKey: formKeys[1]!,
        onDataChanged: (data) => _updatePageData(1, data),
        initialData: _formData[1] as Pagina2Data,
        doc: widget.doc,
      ),
      Pagina3FormCrianca(
        formKey: formKeys[2]!,
        onDataChanged: (data) => _updatePageData(2, data),
        initialData: _formData[2] as Pagina3Data,
        doc: widget.doc,
      ),
      Pagina4FormCrianca(
        formKey: formKeys[3]!,
        onDataChanged: (data) => _updatePageData(3, data),
        initialData: _formData[3] as Pagina4Data,
        doc: widget.doc,
      ),
      Pagina5FormCrianca(
        formKey: formKeys[4]!,
        onDataChanged: (data) => _updatePageData(4, data),
        initialData: _formData[4] as Pagina5Data,
        doc: widget.doc,
      ),
      Pagina6FormCrianca(
        formKey: formKeys[5]!,
        onDataChanged: (data) => _updatePageData(5, data),
        initialData: _formData[5] as Pagina6Data,
        doc: widget.doc,
      ),
      Pagina7FormCrianca(
        formKey: formKeys[6]!,
        onDataChanged: (data) => _updatePageData(6, data),
        initialData: _formData[6] as Pagina7Data,
        doc: widget.doc,
      ),
    ];

    _pageController.addListener(() {
      final page = _pageController.page?.round();
      if (page != null && page != _currentPageIndex) {
        setState(() {
          _currentPageIndex = page;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(167, 10, 134, 235),
      appBar: AppBar(
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(15)),
        ),

        title: Text(
          (widget.doc != null) ? "Atualizar Criança" : 'Cadastro da Criança',

          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
      ),

      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: paginas,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
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
                    onPressed: () {
                      setState(() {
                        _pageController.previousPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );
                      });
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
                          "Voltar",
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 100.0,
                  height: 40.0,

                  child: ElevatedButton(
                    onPressed: () async {
                      final currentFormKey = formKeys[_currentPageIndex];

                      if (currentFormKey != null &&
                          currentFormKey.currentState != null) {
                        final isValid = currentFormKey.currentState!.validate();

                        if (isValid) {
                          currentFormKey.currentState!.save();
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.linear,
                          );

                          if (_currentPageIndex == 6) {
                            User? currentUser =
                                FirebaseAuth.instance.currentUser;
                            final pagina1 = _formData[0] as Pagina1Data;
                            final pagina2 = _formData[1] as Pagina2Data;
                            final pagina3 = _formData[2] as Pagina3Data;
                            final pagina4 = _formData[3] as Pagina4Data;
                            final pagina5 = _formData[4] as Pagina5Data;
                            final pagina6 = _formData[5] as Pagina6Data;
                            final pagina7 = _formData[6] as Pagina7Data;

                            QuestionarioModel
                            questionarioModel = await QuestionarioModel(
                              idquestionario:
                                  widget.doc == null
                                      ? ""
                                      : widget.doc!["idquestionario"],
                              idresponsavel: currentUser!.uid,
                              nome: pagina1.nomecrianca,
                              apelido: pagina1.apelido,
                              idade: pagina1.idade,
                              usaOculos: pagina1.selecionadoOculos,
                              diagnosticoTEA: pagina1.selecionadaTea,
                              nivelTEA: pagina1.selecionadoNivel,
                              genero: pagina2.selecionadoGenero,
                              comunicacao: pagina2.selecionadoVerbo,
                              tecnologiaQueGosta: pagina2.selecionadoEletronico,
                              anoEscolar:
                                  pagina2.selecionadoEtapaEducacaoBasica,
                              acompanhamentoProfissinal:
                                  pagina3.selecionadoAcompanhamento,
                              relacaocomLivros:
                                  pagina3.selecionadoRelacaoLivros,
                              tecnologiasUsadasComFrequencia:
                                  pagina3.selecionadoRelacaoComTecnologia,
                              caracteristicaBrinquedo:
                                  pagina4.selecionadoBrinquedo,
                              corFavorita: pagina4.selecionadoCor,
                              veiculosPreferidos:
                                  pagina4.selecionadoVeiculoFavorito,
                              alimentosNome: pagina5.selecionadaComidaFavorita,
                              atividadePreferida:
                                  pagina5.selecionadaAtividadeFavorita,
                              movimentoRealizadoComFrequencia:
                                  pagina5.selecionadoMovimentoFavoritos,
                              brinquedoNome: pagina6.brinquedos,
                              coisasPreferidas: pagina6.coisasfavoritas,
                              acessoriosPreferidos: pagina6.acessoriofavoritos,
                              animaisPreferidos: pagina6.animaisfavoritos,
                              deveTerNaHistoria:
                                  pagina6.historiacoisasfavoritas,
                              naoDeveTernaHistoria:
                                  pagina6.historiacoisasNaofavoritas,
                              parentesco: pagina6.selecionadoParentesco,
                              processoDeAlfabetizacao:
                                  pagina6.selecionadoProcessoAlf,
                              conjugeNomes: pagina7.moracomcrianca,
                              amigosNomes: pagina7.amigos,
                              atividadeFavorita: pagina7.atividadequegosta,

                              atividadeNaoGosta: pagina7.atividadequeNaogosta,
                              animalEstimacaoNome: pagina7.animalestimacao,
                              hiperfoco: pagina7.hiperfoco,
                            );

                            QuestionarioService questionarioService =
                                QuestionarioService();

                            bool sucesso;
                            if (widget.doc == null) {
                              sucesso = await questionarioService
                                  .salvarQuestionario(
                                    questionario: questionarioModel,
                                    context: context,
                                  );
                            } else {
                              sucesso = await questionarioService
                                  .atualizarQuestionario(
                                    questionario: questionarioModel,
                                    context: context,
                                  );
                            }
                            if (sucesso) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    widget.doc == null
                                        ? "Criança Cadastrada com sucesso "
                                        : "Criança Atualizada com sucesso ",
                                  ),
                                  backgroundColor: Colors.green,
                                ),
                              );
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const TelaPrincipal(),
                                ),
                                (Route<dynamic> route) => false,
                              );
                            } else {
                              print("Falha ao salvar questionário.");
                            }
                          }
                        }
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Preencha todos os campos"),
                            backgroundColor: Colors.red,
                          ),
                        );
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
                          widget.doc != null && _currentPageIndex == 6
                              ? "Atualizar"
                              : _currentPageIndex == 6
                              ? "Cadastrar"
                              : "Proximo",
                          
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
      ),
    );
  }
}
