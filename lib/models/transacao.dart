class Transacao {
  int id, conta;
  String titulo, descricao, data, tipo;
  double valor;

  Transacao({this.id, this.tipo, this.conta, this.titulo, this.descricao,
  this.data, this.valor});

  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'descricao': descricao,
      'valor': valor,
      'data': data,
      'tipo': tipo,
      'conta_id': conta
    };
  }

  Transacao.fromJson(Map map) {
    id = map["id"];
    titulo = map["titulo"];
    descricao = map["descricao"];
    valor = map["valor"];
    data = map["data"];
    tipo = map["tipo"];
    conta = map["conta_id"];
  }
}