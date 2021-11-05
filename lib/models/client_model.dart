import 'dart:convert';

class ClientModel {
  int id;
  String nome;
  String loja;
  String cnpj;
  String email;

  ClientModel({
    required this.id,
    required this.nome,
    required this.loja,
    required this.cnpj,
    required this.email,
  });

  factory ClientModel.empty() => ClientModel(
        id: 0,
        nome: "",
        loja: "",
        cnpj: "",
        email: "",
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'loja': loja,
      'cnpj': cnpj,
      'email': email,
    };
  }

  factory ClientModel.fromMap(Map<String, dynamic> map) {
    return ClientModel(
      id: map['id'],
      nome: map['nome'],
      loja: map['loja'],
      cnpj: map['cnpj'],
      email: map['email'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ClientModel.fromJson(String source) =>
      ClientModel.fromMap(json.decode(source));
}
