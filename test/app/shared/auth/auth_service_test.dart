import 'package:aula_testes/app/shared/auth/auth_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Auth auth;

  setUp(() => auth = Auth());

  group('Validação do cadastro', () {
    test('Deve retornar uma mensagem para um e-mail e senha inválidos', () {
      final result = auth.register('lucas', '123');

      expect(result, isA<String>());
    });

    test('Deve retornar uma mensagem para um e-mail e senha válidos', () {
      final result = auth.register('lucas@gmail.com', 'tamanta123');

      expect(result, isNull);
    });
  });
}
