import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:tcc/Decoracao/DecoracaoAutenticacao.dart';
import 'package:tcc/Model/ResponsavelModelo.dart';
import 'package:tcc/Telas/TelaPrincipalApp.dart';
import 'package:tcc/servicos/Responsavel.dart';
import 'package:tcc/servicos/LoginResponsavel.dart';

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
  Loginresponsavel _loginresponsavel = new Loginresponsavel();

  bool recuperacaoSenha = false;
  bool temConta = true;

  bool _carregando = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(167, 10, 134, 235),
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
                          color: Colors.black,
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
                                setState(() {
                                  _carregando = true;
                                });

                                try {
                                  User? novoUser;
                                  User? userLogado;
                                  if (temConta) {
                                    novoUser = await _autenticacaoresponsavel
                                        .cadastrarResponsavel(
                                          nome: nome_controller.text,
                                          senha: senha_controller.text,
                                          telefone: telefone_controller.text,
                                          email: email_controller.text,
                                          context: context,
                                        );
                                    if (novoUser != null) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) =>
                                                  TelaPrincipal(user: novoUser),
                                        ),
                                      );
                                    }
                                  } else {
                                    userLogado = await _loginresponsavel
                                        .loginResponsavel(
                                          email: email_controller.text,
                                          senha: senha_controller.text,
                                          context: context,
                                        );
                                    print(userLogado);
                                    if (userLogado != null) {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder:
                                              (context) => TelaPrincipal(
                                                user: userLogado,
                                              ),
                                        ),
                                      );
                                    }
                                  }
                                } catch (e) {
                                  print("Erro inesperado na TelaDeInicio: $e");
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "Ocorreu um erro: ${e.toString()}",
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                } finally {
                                  setState(() {
                                    _carregando = false;
                                  });
                                }
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Formulário invalido"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                              setState(() {
                                _carregando = false;
                              });
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
                                _carregando
                                    ? const CircularProgressIndicator(
                                      color: Colors.white,
                                    )
                                    : Text(
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
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(5)),
                      TextButton(
                        onPressed: () async {
                          setState(() {
                            recuperacaoSenha = true;
                          });

                          if (email_controller.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Digite o email para a alteração de senha",
                                ),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                          try {
                            AutenticacaoResponsavel autenticacaoResponsavel =
                                AutenticacaoResponsavel();

                            await autenticacaoResponsavel.recuperarsenha(
                              context,
                              email_controller.text,
                            );
                          } catch (e) {
                            print("Erro ao recuperar senha: $e");
                          } finally {
                            setState(() {
                              recuperacaoSenha = false;
                            });
                          }
                        },
                        child: Text(
                          recuperacaoSenha
                              ? "Enviando Email"
                              : (temConta)
                              ? ""
                              : "Esqueceu sua senha ? Clique aqui !",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
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
