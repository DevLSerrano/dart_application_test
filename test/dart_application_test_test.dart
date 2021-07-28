import 'package:dart_application_test/dart_application_test.dart';
import 'package:test/test.dart';

void main() {
  test('test sem grup', () {
    expect(calculate(), 42);
  });

  group('groud de test', () {
    test('Teste 1 grupe', () {
      //  throw Exception();
    });
    test('Teste 2 grupe', () {});
    test('Teste 3 grupe', () {});
    test('Teste 4 grupe', () {});
    test('Teste 5 grupe', () {});
  });
}
