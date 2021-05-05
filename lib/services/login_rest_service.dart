import 'dart:convert';

import 'package:flutter_autenticacao_apis_rest/models/login.dart';
import '../models/usuario.dart';
import '../utils/rest_util.dart';

class LoginRestService {
  Future<String> loginUsuario(Login usuario) async {
    final response = await RestUtil.addData('login', usuario.toJson());
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return null;
    }
  }

  Future<Usuario> getUsuarioId(String id) async {
    final response = await RestUtil.getDataId('usuarios', id);
    if (response.statusCode == 200) {
      return Usuario.fromJson(json.decode(response.body));
    } else {
      throw Exception("Erro ao buscar a transação");
    }
  }

}