class Login {
  int id;
  String nome, email, senha;

  Login({this.id, this.email, this.senha});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'senha': senha
    };
  }

  Login.fromJson(Map json) {
    id = json["id"];
    email = json["email"];
    senha = json["senha"];
  }
}