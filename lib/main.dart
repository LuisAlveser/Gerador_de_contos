import 'package:flutter/material.dart';
import 'package:tcc/Telas/TelaDeInicioApp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TelaDeInicio());
  }
}
