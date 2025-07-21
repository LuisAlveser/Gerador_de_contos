import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:tcc/Decoracao/DecoracaoAutenticacao.dart';
import 'package:tcc/Model/ResponsavelModelo.dart';
import 'package:tcc/Telas/TelaPrincipalApp.dart';
import 'package:tcc/servicos/AutenticacaoResponsavel.dart';

class TelaDeInicio extends StatefulWidget {
  const TelaDeInicio({super.key});

  @override
  State<TelaDeInicio> createState() => _TelaDeInicioState();
}

class _TelaDeInicioState extends State<TelaDeInicio> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nome_controller = TextEditingController();
  final TextEditingController email_controller = TextEditingController();
  final TextEditingController senha_controller = TextEditingController();
  final TextEditingController senha_confirmada_controller =
      TextEditingController();
  final TextEditingController telefone_controller = TextEditingController();
  AutenticacaoResponsavel _autenticacaoresponsavel =
      new AutenticacaoResponsavel();

  bool temConta = true;

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
                      Padding(padding: EdgeInsets.all(5)),
                      Image.asset("assets/mascote.png", height: 200),
                      Padding(padding: EdgeInsets.only(top: 30.0)),
                      Text(
                        (temConta) ? "Iniciar Jornada" : "Bem-vindo de Volta!",
                        style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 30.0)),
                      Visibility(
                        visible: temConta,

                        child: SizedBox(
                          width: 350,
                          height: 50,
                          child: TextFormField(
                            decoration: getAutenticationInputDecoration("Nome"),
                            controller: nome_controller,
                            key: Key("nome"),
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return "O nome não pode ser vazio";
                              }

                              return null;
                            },
                          ),
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
                              "Telefone (xx) xxxxx-xxxx",
                            ),
                            controller: telefone_controller,

                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Por favor, insira um número de telefone';
                              }
                              if (value.length < 8) {
                                return 'Número de telefone inválido';
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
                          controller: email_controller,
                          key: Key("email"),
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "O e-mail não pode ser vazio";
                            }
                            if (value.length < 5) {
                              return "O e-mail é muito curto";
                            }
                            if (!value.contains("@")) {
                              return "E-mail inválido";
                            }
                            if (!value.contains(".com")) {
                              return "E-mail inválido";
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
                          controller: senha_controller,
                          key: Key("senha"),
                          obscureText: true,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "A sennha não pode ser vazia";
                            }
                            if (value.length < 5) {
                              return "A  senha é muito curta";
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
                            controller: senha_confirmada_controller,
                            key: Key("confirma_senha"),
                            obscureText: true,
                            validator: (String? value) {
                              if (senha_controller.text != (value)) {
                                return "A senha está diferente";
                              }
                              if (value == null || value.isEmpty) {
                                return "A senha não pode ser vazia";
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
                            key: Key("entrar"),
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                if (temConta) {
                                  User? user = await _autenticacaoresponsavel.cadastrarResponsavel(
                                    nome: nome_controller.text,
                                    senha: senha_controller.text,
                                    telefone: telefone_controller.text,
                                    email: email_controller.text,
                                    context: context, 
                                  );
                                }
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => TelaPrincipal(),
                                  ),
                                );
                              } else {
                                
                                print("Formuário invalido ");
                              }
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
