import 'package:aula_testes/app/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'Testes do campo de e-mail',
    () {
      testWidgets(
        'Deve confirmar que o campo de e-mail aparece na tela corretamente',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: RegisterPage(),
            ),
          );

          final Finder emailKey = find.byKey(const Key('email_key'));
          expect(emailKey, findsOneWidget);
        },
      );

      testWidgets(
        'Deve exibir uma SnackBar com a mensagem de erro caso o e-mail seja nulo',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: RegisterPage(),
            ),
          );

          final registerButton = find.byKey(const Key('register_button_key'));
          await tester.tap(registerButton);
          await tester.pumpAndSettle();

          expect(find.text('O e-mail é obrigatório'), findsOneWidget);
        },
      );

      testWidgets(
        'Deve exibir uma SnackBar com a mensagem de erro caso o e-mail seja vazio',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: RegisterPage(),
            ),
          );

          final Finder emailKey = find.byKey(const Key('email_key'));
          await tester.tap(emailKey);
          await tester.pumpAndSettle();

          await tester.enterText(emailKey, '');
          await tester.pumpAndSettle();

          final registerButton = find.byKey(const Key('register_button_key'));
          await tester.tap(registerButton);
          await tester.pumpAndSettle();

          expect(find.text('O e-mail é obrigatório'), findsOneWidget);
        },
      );

      testWidgets(
        'Deve exibir uma SnackBar com a mensagem de erro caso o e-mail seja inválido',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: RegisterPage(),
            ),
          );

          final Finder emailKey = find.byKey(const Key('email_key'));
          await tester.tap(emailKey);
          await tester.pumpAndSettle();

          await tester.enterText(emailKey, 'lucas');
          await tester.pumpAndSettle();

          final registerButton = find.byKey(const Key('register_button_key'));
          await tester.tap(registerButton);
          await tester.pumpAndSettle();

          expect(find.text('O e-mail é inválido'), findsOneWidget);
        },
      );

      testWidgets(
        'Deve exibir uma SnackBar com a mensagem de erro caso o e-mail esteja correto',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: RegisterPage(),
            ),
          );

          final Finder emailKey = find.byKey(const Key('email_key'));
          await tester.tap(emailKey);
          await tester.pumpAndSettle();

          await tester.enterText(emailKey, 'lucas@gmail.com');
          await tester.pumpAndSettle();

          final registerButton = find.byKey(const Key('register_button_key'));
          await tester.tap(registerButton);
          await tester.pumpAndSettle();

          expect(find.text('O e-mail é inválido'), findsNothing);
        },
      );
    },
  );

  group(
    'Testes do campo de senha',
    () {
      testWidgets(
        'Deve confirmar que o campo de senha aparece na tela corretamente',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: RegisterPage(),
            ),
          );

          final Finder passwordKey = find.byKey(const Key('password_key'));
          expect(passwordKey, findsOneWidget);
        },
      );

      testWidgets(
        'Deve exibir uma SnackBar com a mensagem de erro caso a senha seja nula',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: RegisterPage(),
            ),
          );

          final Finder emailKey = find.byKey(const Key('email_key'));
          await tester.tap(emailKey);
          await tester.pumpAndSettle();

          await tester.enterText(emailKey, 'lucas@gmail.com');
          await tester.pumpAndSettle();

          final registerButton = find.byKey(const Key('register_button_key'));
          await tester.tap(registerButton);
          await tester.pumpAndSettle();

          expect(find.text('A senha é obrigatória'), findsOneWidget);
        },
      );

      testWidgets(
        'Deve exibir uma SnackBar com a mensagem de erro caso a senha seja vazia',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: RegisterPage(),
            ),
          );

          final Finder emailKey = find.byKey(const Key('email_key'));
          await tester.tap(emailKey);
          await tester.pumpAndSettle();

          await tester.enterText(emailKey, 'lucas@gmail.com');
          await tester.pumpAndSettle();

          final Finder passwordKey = find.byKey(const Key('password_key'));
          await tester.tap(passwordKey);
          await tester.pumpAndSettle();

          await tester.enterText(passwordKey, '');
          await tester.pumpAndSettle();

          final registerButton = find.byKey(const Key('register_button_key'));
          await tester.tap(registerButton);
          await tester.pumpAndSettle();

          expect(find.text('A senha é obrigatória'), findsOneWidget);
        },
      );

      testWidgets(
        'Deve exibir uma SnackBar com a mensagem de erro caso a senha seja inválida',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: RegisterPage(),
            ),
          );

          final Finder emailKey = find.byKey(const Key('email_key'));
          await tester.tap(emailKey);
          await tester.pumpAndSettle();

          await tester.enterText(emailKey, 'lucas@gmail.com');
          await tester.pumpAndSettle();

          final Finder passwordKey = find.byKey(const Key('password_key'));
          await tester.tap(passwordKey);
          await tester.pumpAndSettle();

          await tester.enterText(passwordKey, 'tamanta');
          await tester.pumpAndSettle();

          final registerButton = find.byKey(const Key('register_button_key'));
          await tester.tap(registerButton);
          await tester.pumpAndSettle();

          expect(find.text('A senha deve ser alfanumérica'), findsOneWidget);
        },
      );

      testWidgets(
        'Deve exibir uma SnackBar com a mensagem de erro caso a senha não possua 6 caracteres',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: RegisterPage(),
            ),
          );

          final Finder emailKey = find.byKey(const Key('email_key'));
          await tester.tap(emailKey);
          await tester.pumpAndSettle();

          await tester.enterText(emailKey, 'lucas@gmail.com');
          await tester.pumpAndSettle();

          final Finder passwordKey = find.byKey(const Key('password_key'));
          await tester.tap(passwordKey);
          await tester.pumpAndSettle();

          await tester.enterText(passwordKey, 'tam12');
          await tester.pumpAndSettle();

          final registerButton = find.byKey(const Key('register_button_key'));
          await tester.tap(registerButton);
          await tester.pumpAndSettle();

          expect(
            find.text('A senha deve possuir pelo meos 6 caracteres'),
            findsOneWidget,
          );
        },
      );

      testWidgets(
        'Deve exibir uma SnackBar com a mensagem de erro caso a senha esteja correta',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: RegisterPage(),
            ),
          );

          final Finder emailKey = find.byKey(const Key('email_key'));
          await tester.tap(emailKey);
          await tester.pumpAndSettle();

          await tester.enterText(emailKey, 'lucas@gmail.com');
          await tester.pumpAndSettle();

          final Finder passwordKey = find.byKey(const Key('password_key'));
          await tester.tap(passwordKey);
          await tester.pumpAndSettle();

          await tester.enterText(passwordKey, 'tamanta123');
          await tester.pumpAndSettle();

          final registerButton = find.byKey(const Key('register_button_key'));
          await tester.tap(registerButton);
          await tester.pumpAndSettle();

          expect(find.text('A senha deve ser alfanumérica'), findsNothing);
        },
      );
    },
  );

  group(
    'Testes do botão de cadastro',
    () {
      testWidgets(
        'Deve confirmar que o botão de cadastro aparece na tela corretamente',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: RegisterPage(),
            ),
          );

          final Finder emailKey = find.byKey(const Key('register_button_key'));
          expect(emailKey, findsOneWidget);
        },
      );

      testWidgets(
        'Deve retornar uma SnackBar com a mensagem de erro para um e-mail e senha inválidos ao clicar no botão de cadastro',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: RegisterPage(),
            ),
          );

          final Finder emailKey = find.byKey(const Key('email_key'));
          await tester.tap(emailKey);
          await tester.pumpAndSettle();

          await tester.enterText(emailKey, 'lucas');
          await tester.pumpAndSettle();

          final Finder passwordKey = find.byKey(const Key('password_key'));
          await tester.tap(passwordKey);
          await tester.pumpAndSettle();

          await tester.enterText(passwordKey, '123');
          await tester.pumpAndSettle();

          final registerButton = find.byKey(const Key('register_button_key'));
          await tester.tap(registerButton);
          await tester.pumpAndSettle();

          expect(find.byType(SnackBar), findsOneWidget);
        },
      );

      testWidgets(
        'Deve garantir que nenhuma SnackBar apareça ao digitar tudo corretamente e após clicar no botão de cadastro',
        (WidgetTester tester) async {
          await tester.pumpWidget(
            const MaterialApp(
              home: RegisterPage(),
            ),
          );

          final Finder emailKey = find.byKey(const Key('email_key'));
          await tester.tap(emailKey);
          await tester.pumpAndSettle();

          await tester.enterText(emailKey, 'lucas@gmail.com');
          await tester.pumpAndSettle();

          final Finder passwordKey = find.byKey(const Key('password_key'));
          await tester.tap(passwordKey);
          await tester.pumpAndSettle();

          await tester.enterText(passwordKey, 'tamanta123');
          await tester.pumpAndSettle();

          final registerButton = find.byKey(const Key('register_button_key'));
          await tester.tap(registerButton);
          await tester.pumpAndSettle();

          expect(find.byType(SnackBar), findsNothing);
        },
      );
    },
  );
}
