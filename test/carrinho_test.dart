import 'package:dart_application_test/carrinho.dart';
import 'package:dart_application_test/item.dart';
import 'package:test/test.dart';

void main() {
  group('Test de Calculo valor total do carrinho', () {
    test('Deve calcular o valor total do carrinho', () async {
      // preparação
      var items = [
        Item(nome: 'Galaxy j1', preco: 2000),
        Item(nome: 'Iphone 12', preco: 10000),
        Item(nome: 'Carregador de Tomada', preco: 200)
      ];

      final carrinho = Carrinho(items: items);

      //ação ou execução

      var valorTotalDoCarrinho = carrinho.totalCarrinho();

      //verificação

      expect(valorTotalDoCarrinho, 12200);
    });

    test('Deve calcular o valor total do carrinho para carrinho vazio',
        () async {
      // preparação
      var items = <Item>[];

      final carrinho = Carrinho(items: items);

      //ação ou execução

      var valorTotalDoCarrinho = carrinho.totalCarrinho();

      //verificação

      expect(valorTotalDoCarrinho, 0);
    });
  });

  group('Teste de calculo de imposto no carrinho', () {
    test('Deve calcular o valor total do carrinho com valor de 10%', () {
      // preparação
      var items = [
        Item(nome: 'Galaxy j1', preco: 2000),
        Item(nome: 'Iphone 12', preco: 10000),
        Item(nome: 'Carregador de Tomada', preco: 200)
      ];

      final carrinho = Carrinho(items: items);

      //ação ou execução
      var valorTotalDoCarrinhoComImpostp = carrinho.totalCarrinhoComImposto();

      expect(valorTotalDoCarrinhoComImpostp, 13420);
    });

    // Se o valor menor que 5 mil não cobra imposto
    test('Deve retorna o valor sem imposto caso seja menor 5 mil ', () {
      // preparação
      var items = [
        Item(nome: 'Galaxy j1', preco: 2000),
        Item(nome: 'Fone Apple', preco: 2900)
      ];

      final carrinho = Carrinho(items: items);

      //ação ou execução
      var valorTotalDoCarrinhoComImpostp = carrinho.totalCarrinhoComImposto();

      expect(valorTotalDoCarrinhoComImpostp, 4900);
    });

    test('Deve retorna o valor com imposto caso seja igual a 5 mil ', () {
      // preparação
      var items = [
        Item(nome: 'Galaxy j1', preco: 2000),
        Item(nome: 'Fone Apple', preco: 3000)
      ];

      final carrinho = Carrinho(items: items);

      //ação ou execução
      var valorTotalDoCarrinhoComImpostp = carrinho.totalCarrinhoComImposto();

      expect(valorTotalDoCarrinhoComImpostp, 5500);
    });

    // Se o valor for maior que 20 mil ,cobra imposto

    test(
        'Deve retorna o valor total com 20% de imposto para carrinho com valor maior que 20.000 ',
        () {
      // preparação
      var items = [
        Item(nome: 'Galaxy j1', preco: 2000),
        Item(nome: 'Fone Apple', preco: 10000),
        Item(nome: 'Fone Apple', preco: 10000)
      ];

      final carrinho = Carrinho(items: items);

      //ação ou execução
      var valorTotalDoCarrinhoComImpostp = carrinho.totalCarrinhoComImposto();

      expect(valorTotalDoCarrinhoComImpostp, 26400);
    });

    test(
        'Deve retorna o valor total com 10% de imposto para carrinho igual a 20.000 ',
        () {
      // preparação
      var items = [
        Item(nome: 'Fone Apple', preco: 10000),
        Item(nome: 'Fone Apple', preco: 10000)
      ];

      final carrinho = Carrinho(items: items);

      //ação ou execução
      var valorTotalDoCarrinhoComImpostp = carrinho.totalCarrinhoComImposto();

      expect(valorTotalDoCarrinhoComImpostp, 22000);
    });
  });
}
