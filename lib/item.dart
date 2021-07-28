import 'dart:convert';

class Item {
  String nome;
  double preco;

  Item({
    required this.nome,
    required this.preco,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'preco': preco,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      nome: map['nome'] ?? '',
      preco: map['preco'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));
}
