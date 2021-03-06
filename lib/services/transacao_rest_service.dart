import 'dart:convert';

import '../models/transacao.dart';
import '../utils/rest_util.dart';
import 'package:http/http.dart';

class TransacaoRestService {
  Future<Transacao> addTransacao(Transacao transacao) async {
    final response = await RestUtil.addData('transacoes', transacao.toJson());
  }

  Future<List<Transacao>> getTransacoes() async {
    final response = await RestUtil.getData('transacoes');
    if (response.statusCode == 200) {
      List<dynamic> conteudo = jsonDecode(response.body);
      List<Transacao> transacoes = conteudo.map((dynamic transacao) =>
          Transacao.fromJson(transacao)).toList();
      return transacoes;
    } else {
      throw Exception("Erro ao listar transações");
    }
  }

  Future<Transacao> getTransacaoId(String id) async {
    final response = await RestUtil.getDataId('transacoes', id);
    if (response.statusCode == 200) {
      return Transacao.fromJson(json.decode(response.body));
    } else {
      throw Exception("Erro ao buscar a transação");
    }
  }

  Future<Transacao> editTransacao(Transacao transacao, String id) async {
    final novaTransacao = {
      'titulo': transacao.titulo,
      'descricao': transacao.descricao,
      'valor': transacao.valor,
      'data': transacao.data,
      'conta_id': transacao.conta,
      'tipo': transacao.tipo == "TipoEnum.entrada" ? "1": "2"
    };
    final response = await RestUtil.editData('transacoes', novaTransacao, id);
    if (response.statusCode == 200) {
      print("transacao editada");
    } else {
      throw Exception("Erro ao editar a transação");
    }
  }

  Future<void> removeTransacao(String id) async {
    final response = await RestUtil.removeDataId('transacoes', id);
    if (response.statusCode == 204) {
      print("Transacao removida com sucesso");
    } else {
      throw Exception("Erro ao remover a transação");
    }
  }

}