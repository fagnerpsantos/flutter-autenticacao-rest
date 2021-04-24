import 'package:flutter/material.dart';
import 'package:flutter_autenticacao_apis_rest/screens/cadastrar_usuario/cadastrar_usuario_screen.dart';
import 'package:flutter_autenticacao_apis_rest/screens/login/login_screen.dart';
import 'screens/home/home_screen.dart';

void main()=>runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CadastrarUsuarioScreen()
    );
  }
}
