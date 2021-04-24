import 'dart:convert';

import 'package:flutter_autenticacao_apis_rest/models/login.dart';
import '../models/usuario.dart';
import '../utils/rest_util.dart';
import 'package:http/http.dart';

class LoginRestService {
  Future<Usuario> loginUsuario(Login usuario) async {
    final response = await RestUtil.addData('login', usuario.toJson());
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