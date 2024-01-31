import 'package:aula_testes/app/shared/validators/password_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late PasswordValidator passwordValidator;

  setUp(() => passwordValidator = PasswordValidator());

  group('Validação da Senha', () {
    test(
      'Deve retornar uma mensagem de erro caso a senha seja nula',
      () {
        final result = passwordValidator.validate();
        expect(result, equals('A senha é obrigatória'));
      },
    );

    test(
      'Deve retornar uma mensagem de erro caso a senha seja vazia',
      () {
        final result = passwordValidator.validate(password: '');
        expect(result, equals('A senha é obrigatória'));
      },
    );

    test(
      'Deve retornar uma mensagem de erro caso a senha seja menor que 6 caracteres',
      () {
        final result = passwordValidator.validate(password: 'lucas');
        expect(result, equals('A senha deve possuir pelo meos 6 caracteres'));
      },
    );

    test(
      'Deve retornar uma mensagem de erro caso a senha não seja alfanumérica',
      () {
        final result = passwordValidator.validate(password: 'tamanta');
        expect(result, equals('A senha deve ser alfanumérica'));
      },
    );

    test(
      'Deve retornar null caso a senha seja válida',
      () {
        final result = passwordValidator.validate(password: 'tamanta123');
        expect(result, isNull);
      },
    );
  });
}
