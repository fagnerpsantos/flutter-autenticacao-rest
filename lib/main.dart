import 'package:flutter/material.dart';
import 'package:flutter_autenticacao_apis_rest/screens/cadastrar_usuario/cadastrar_usuario_screen.dart';
import 'package:flutter_autenticacao_apis_rest/utils/secure_storage_util.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtil.getInstance();
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CadastrarUsuarioScreen()
    );
  }
}
