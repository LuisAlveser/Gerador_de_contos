import 'package:flutter/material.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
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
                //  Navigator.push(
                //   context,
                //  MaterialPageRoute(
                // builder: (context) => TelaDeFormularioCrianca(),
                //  ),
                //  );
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
