import 'dart:convert';

import '../models/usuario.dart';
import '../utils/rest_util.dart';
import 'package:http/http.dart';

class UsuarioRestService {
  Future<Usuario> addUsuario(Usuario usuario) async {
    final response = await RestUtil.postData('usuarios', usuario.toJson());
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