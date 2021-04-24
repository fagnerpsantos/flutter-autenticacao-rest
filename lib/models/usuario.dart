class Usuario {
  int id;
  String nome, email, senha;

  Usuario({this.id, this.nome, this.email, this.senha});

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'email': email,
      'senha': senha
    };
  }

  Usuario.fromJson(Map json) {
    id = json["id"];
    nome = json["nome"];
    email = json["email"];
    senha = json["senha"];
  }
}