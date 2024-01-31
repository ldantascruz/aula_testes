import 'package:aula_testes/app/shared/validators/email_validator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late EmailValidator emailValidator;

  setUp(() => emailValidator = EmailValidator());

  group('Validação do e-mail', () {
    test('Deve retornar mensagem de erro caso o e-mail seja nulo', () {
      final result = emailValidator.validate();
      expect(result, equals('O e-mail é obrigatório'));
    });

    test('Deve retornar mensagem de erro caso o e-mail seja vazio', () {
      final result = emailValidator.validate(email: '');
      expect(result, equals('O e-mail é obrigatório'));
    });

    test('Deve retornar mensagem de erro caso o e-mail seja inválido', () {
      final result = emailValidator.validate(email: 'lucas');
      expect(result, equals('O e-mail é inválido'));
    });

    test('Deve retornar nulo caso o e-mail seja válido', () {
      final result = emailValidator.validate(email: 'lucas@gmail.com');
      expect(result, isNull);
    });
  });
}
