import 'package:flutter/material.dart';
import 'package:tcc/TelaParaCadastraCrianca/Pagina1.dart';
import 'package:tcc/TelaParaCadastraCrianca/Pagina2.dart';
import 'package:tcc/TelaParaCadastraCrianca/Pagina3.dart';
import 'package:tcc/TelaParaCadastraCrianca/Pagina4.dart';
import 'package:tcc/TelaParaCadastraCrianca/Pagina5.dart';
import 'package:tcc/TelaParaCadastraCrianca/Pagina6.dart';
import 'package:tcc/TelaParaCadastraCrianca/Pagina7.dart';

class TelaDeFormularioCrianca extends StatefulWidget {
  const TelaDeFormularioCrianca({super.key});

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
    0: Pagina1Data(),
    1: Pagina2Data(),
    2: Pagina3Data(),
    3: Pagina4Data(),
    4: Pagina5Data(),
    5: Pagina6Data(),
    6: Pagina7Data(),
  };

  late final List<Widget> paginas;
  int _currentPageIndex = 0;
  void _updatePageData(int pageIndex, dynamic data) {
    _formData[pageIndex] = data;
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      final page = _pageController.page?.round();
      if (page != null && page != _currentPageIndex) {
        setState(() {
          _currentPageIndex = page;
        });
      }
    });

    paginas = [
      Pagina1FormCrianca(
        formKey: formKeys[0]!,
        onDataChanged: (data) => _updatePageData(0, data),
      ),

      Pagina2FormCrianca(
        formKey: formKeys[1]!,
        onDataChanged: (data) => _updatePageData(1, data),
      ),
      Pagina3FormCrianca(
        formKey: formKeys[2]!,
        onDataChanged: (data) => _updatePageData(2, data),
      ),
      Pagina4FormCrianca(
        formKey: formKeys[3]!,
        onDataChanged: (data) => _updatePageData(3, data),
      ),
      Pagina5FormCrianca(
        formKey: formKeys[4]!,
        onDataChanged: (data) => _updatePageData(4, data),
      ),
      Pagina6FormCrianca(
        formKey: formKeys[5]!,
        onDataChanged: (data) => _updatePageData(5, data),
      ),
      Pagina7FormCrianca(
        formKey: formKeys[6]!,
        onDataChanged: (data) => _updatePageData(6, data),
      ),
    ];
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

        title: const Text(
          'Cadastro da Criança',

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
                    onPressed: () {
                      final currentFormKey = formKeys[_currentPageIndex];

                      if (currentFormKey != null &&
                          currentFormKey.currentState != null) {
                        final isValid = currentFormKey.currentState!.validate();

                        if (isValid) {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.linear,
                          );

                          if (_currentPageIndex == 6) {
                            final pagina1 = _formData[0] as Pagina1Data;
                            final pagina2 = _formData[1] as Pagina2Data;
                            final pagina3 = _formData[2] as Pagina3Data;
                            final pagina4 = _formData[3] as Pagina4Data;
                            final pagina5 = _formData[4] as Pagina5Data;
                            final pagina6 = _formData[5] as Pagina6Data;
                            final pagina7 = _formData[6] as Pagina7Data;
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
                          _currentPageIndex == 6 ? "Cadastrar" : "Proximo",
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
