import 'package:flutter/material.dart';
import 'package:tcc/TelaParaCadastraCrianca/Pagina1.dart';
import 'package:tcc/TelaParaCadastraCrianca/Pagina2.dart';

class TelaDeFormularioCrianca extends StatefulWidget {
  const TelaDeFormularioCrianca({super.key});

  @override
  State<TelaDeFormularioCrianca> createState() =>
      _TelaDeFormularioCriancaState();
}

class _TelaDeFormularioCriancaState extends State<TelaDeFormularioCrianca> {
  List<Widget> paginas = [Pagina1FormCrianca(), Pagina2FormCrianca()];
  final controller = PageController(initialPage: 0);

  // Mapeia o índice da página para sua GlobalKey
  final Map<int, GlobalKey<FormState>> formKeys = {
    // 0: pagina1FormKey, // Chave da Pagina1FormCrianca
    //  1: pagina2FormKey, // Chave da Pagina2FormCrianca
  };
  int _currentPageIndex = 0; //Página atual

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

      body: PageView(
        controller: controller,
        children: const <Widget>[Pagina1FormCrianca(), Pagina2FormCrianca()],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(4.0),
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
                    controller.jumpToPage(0);
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
                    controller.jumpToPage(1);
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
                        "Proxímo",
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
    );
  }
}
