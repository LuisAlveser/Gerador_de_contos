import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tcc/Telas/TelaDeInicioApp.dart';
import 'package:tcc/Telas/TelaPrincipalApp.dart';

InputDecoration getAutenticationInputDecoration(String labelText) {
  return InputDecoration(labelText: labelText);
}

void main() {
  group(
    'Testes da TelaDeInicio para verificar os campos de login e cadastro aparecem',
    () {
      testWidgets(
        'A tela inicial deve mostrar os campos de cadastro (nome, email, senha, confirmar senha)',
        (WidgetTester tester) async {
          await tester.pumpWidget(MaterialApp(home: TelaDeInicio()));

          expect(find.text('Iniciar Jornada'), findsOneWidget);
          expect(find.byKey(const Key('nome')), findsOneWidget);
          expect(find.byKey(const Key('email')), findsOneWidget);
          expect(find.byKey(const Key('senha')), findsOneWidget);
          expect(find.byKey(const Key('confirma_senha')), findsOneWidget);
          expect(find.text('Cadastrar'), findsOneWidget);
          expect(find.text('Já tem uma conta ? Entre aqui ! '), findsOneWidget);
        },
      );

      testWidgets(
        'Deve alternar para a tela de Login e ocultar o campo de nome e confirmação de senha',
        (WidgetTester tester) async {
          await tester.pumpWidget(MaterialApp(home: TelaDeInicio()));

          final Finder toggleButton = find.text(
            'Já tem uma conta ? Entre aqui ! ',
          );

          await tester.ensureVisible(toggleButton);
          await tester.pumpAndSettle();

          await tester.tap(toggleButton);
          await tester.pump();

          expect(find.text('Bem-vindo de Volta!'), findsOneWidget);
          expect(find.byKey(const Key('nome')), findsNothing);
          expect(find.byKey(const Key('confirma_senha')), findsNothing);
          expect(find.text('Entrar'), findsOneWidget);
          expect(
            find.text('Não tem conta? Cadastre-se aqui !'),
            findsOneWidget,
          );
        },
      );

      testWidgets('Deve mostrar erro de nome vazio no cadastro', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(MaterialApp(home: TelaDeInicio()));

        final Finder cadastrarButton = find.text('Cadastrar');

        await tester.ensureVisible(cadastrarButton);

        await tester.pumpAndSettle();

        await tester.tap(cadastrarButton);

        await tester.pump();

        expect(find.text('O nome não pode ser vazio'), findsOneWidget);
      });

      testWidgets('Deve mostrar erro de email inválido', (
        WidgetTester tester,
      ) async {
        await tester.pumpWidget(MaterialApp(home: TelaDeInicio()));

        await tester.enterText(find.byKey(const Key('email')), 'emailinvalido');
        await tester.tap(find.text('Cadastrar'));
        final Finder cadastrarButton = find.text('Cadastrar');

        await tester.ensureVisible(cadastrarButton);

        await tester.pumpAndSettle();

        await tester.tap(cadastrarButton);
        await tester.pump();

        expect(find.text('E-mail inválido'), findsOneWidget);
      });

      testWidgets(
        'Deve navegar para a TelaPrincipalApp após um cadastro bem-sucedido',
        (WidgetTester tester) async {
          await tester.pumpWidget(MaterialApp(home: TelaDeInicio()));

          await tester.enterText(find.byKey(const Key('nome')), 'Teste Nome');
          await tester.enterText(
            find.byKey(const Key('email')),
            'teste@exemplo.com',
          );
          await tester.enterText(find.byKey(const Key('senha')), 'senha123');
          await tester.enterText(
            find.byKey(const Key('confirma_senha')),
            'senha123',
          );
          final Finder cadastrarButton = find.text('Cadastrar');

          await tester.ensureVisible(cadastrarButton);

          await tester.pumpAndSettle();

          await tester.tap(cadastrarButton);

          await tester.tap(find.text('Cadastrar'));
          await tester.pumpAndSettle();

          expect(find.byType(TelaPrincipal), findsOneWidget);
        },
      );

      testWidgets(
        'Deve navegar para a TelaPrincipalApp após um login bem-sucedido',
        (WidgetTester tester) async {
          await tester.pumpWidget(MaterialApp(home: TelaDeInicio()));

          final Finder toggleButton = find.text(
            'Já tem uma conta ? Entre aqui ! ',
          );
          await tester.ensureVisible(toggleButton);
          await tester.pumpAndSettle();
          await tester.tap(toggleButton);
          await tester.pump();

          await tester.enterText(
            find.byKey(const Key('email')),
            'login@exemplo.com',
          );
          await tester.enterText(find.byKey(const Key('senha')), 'senha123');

          await tester.tap(find.text('Entrar'));
          await tester.pumpAndSettle();

          expect(find.byType(TelaPrincipal), findsOneWidget);
        },
      );
    },
  );
}
