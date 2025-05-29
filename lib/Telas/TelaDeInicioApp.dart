import 'package:flutter/material.dart';

import 'package:tcc/Decoracao/DecoracaoAutenticacao.dart';
import 'package:tcc/Telas/TelaPrincipalApp.dart';

class TelaDeInicio extends StatefulWidget {
  const TelaDeInicio({super.key});

  @override
  State<TelaDeInicio> createState() => _TelaDeInicioState();
}

class _TelaDeInicioState extends State<TelaDeInicio> {
  final _formKey = GlobalKey<FormState>();
  bool temConta = true;
  late final String senha_usuario;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(167, 10, 134, 235),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [
                      Text(
                        (temConta) ? "Cadastrar" : "Entrar",
                        style: TextStyle(
                          fontSize: 70,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      Image.asset("assets/mascote.png", height: 250),
                      Visibility(
                        visible: temConta,

                        child: SizedBox(
                          width: 350,
                          height: 50,
                          child: TextFormField(
                            decoration: getAutenticationInputDecoration("Nome"),
                            validator: (String? value) {
                              if (value == null) {
                                return "O nome não pode ser vazio";
                              }
                              if (value.length < 5) {
                                return " O nome é muito curto";
                              }

                              return null;
                            },
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      SizedBox(
                        width: 350,
                        height: 50,
                        child: TextFormField(
                          decoration: getAutenticationInputDecoration("E-mail"),
                          validator: (String? value) {
                            if (value == null) {
                              return "O e-mail não pode ser vazio";
                            }
                            if (value.length < 5) {
                              return " O e-mail é muito curto";
                            }
                            if (!value.contains("@")) {
                              return " E-mail inválido";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      SizedBox(
                        width: 350,
                        height: 50,

                        child: TextFormField(
                          decoration: getAutenticationInputDecoration("Senha"),
                          validator: (String? value) {
                            setState(() {
                              senha_usuario == value;
                            });

                            if (value == null) {
                              return "A sennha não pode ser vazia";
                            }
                            if (value.length < 5) {
                              return " A  senha é muito curta";
                            }
                            bool temMaiuscula = false;
                            for (int i = 0; i < value.length; i++) {
                              if (value[i] == value[i].toUpperCase() &&
                                  value[i] != value[i].toLowerCase()) {
                                temMaiuscula = true;
                                break;
                              }
                            }
                            if (!temMaiuscula) {
                              return "A senha deve conter pelo menos uma letra maiúscula";
                            }

                            return null;
                          },
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      Visibility(
                        visible: temConta,

                        child: SizedBox(
                          width: 350,
                          height: 50,
                          child: TextFormField(
                            decoration: getAutenticationInputDecoration(
                              "Confirmar Senha",
                            ),
                            validator: (String? value) {
                              if (senha_usuario == (value)) {}
                              if (value == null) {
                                return "A sennha não pode ser vazia";
                              }
                            },
                          ),
                        ),
                      ),

                      Padding(padding: EdgeInsets.only(top: 50.0)),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: SizedBox(
                          width: 200.0,
                          height: 50.0,

                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TelaPrincipal(),
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
                                Image.asset(
                                  'assets/fundo_botao.jpg',
                                  fit: BoxFit.cover,
                                  height: double.infinity,
                                  width: double.infinity,
                                ),
                                Text(
                                  (temConta) ? "Cadastrar" : "Entrar",
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
                      Padding(padding: EdgeInsets.all(10)),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            temConta = !temConta;
                          });
                        },
                        child: Text(
                          (temConta)
                              ? "Já tem uma conta ? Entre aqui ! "
                              : "Não tem conta? Cadastre-se aqui !",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      TextButton(
                        onPressed: () {
                          //recuperação de senha
                        },
                        child: Text(
                          (temConta)
                              ? ""
                              : "Esqueceu sua senha ? Clique aqui !",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
