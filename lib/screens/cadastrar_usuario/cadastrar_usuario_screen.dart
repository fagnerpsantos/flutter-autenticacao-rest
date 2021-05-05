import 'package:flutter/material.dart';
import '../login/login_screen.dart';
import '../../services/usuario_rest_service.dart';
import '../../models/usuario.dart';
import '../home/home_screen.dart';

class CadastrarUsuarioScreen extends StatefulWidget {
  @override
  _CadastrarUsuarioScreenState createState() => _CadastrarUsuarioScreenState();
}

class _CadastrarUsuarioScreenState extends State<CadastrarUsuarioScreen> {
  final _nomeController = TextEditingController();

  final _emailController = TextEditingController();

  final _senhaController = TextEditingController();

  UsuarioRestService urs = UsuarioRestService();

  final _formKey = GlobalKey<FormState>();

  String hintTextSenha = "Senha";
  String hintTextNome = "Nome";
  String hintTextEmail = "Email";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 2.5,
                      decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(90),
                            bottomRight: Radius.circular(90),
                          )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Spacer(),
                          Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.monetization_on,
                              size: 90,
                              color: Colors.white,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                    Form(
                      key: _formKey,
                      child: Container(
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(top: 30),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 45,
                              padding: EdgeInsets.only(
                                  top: 4, left: 16, right: 16, bottom: 4),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  color: Colors.black12),
                              child: TextFormField(
                                onTap: () {
                                  setState(() {
                                    hintTextNome = "Nome";

                                  });
                                },
                                controller: _nomeController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    icon: Icon(
                                      Icons.person,
                                      color: Colors.grey,
                                    ),
                                    hintText: hintTextNome),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    setState(() {
                                      hintTextNome = "Campo requerido";
                                    });
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 45,
                              margin: EdgeInsets.only(top: 32),
                              padding: EdgeInsets.only(
                                  top: 4, left: 16, right: 16, bottom: 4),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  color: Colors.black12),
                              child: TextFormField(
                                onTap: () {
                                  setState(() {
                                    hintTextEmail = "Email";

                                  });
                                },
                                controller: _emailController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    icon: Icon(
                                      Icons.mail,
                                      color: Colors.grey,
                                    ),
                                    hintText: hintTextEmail),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    setState(() {
                                      hintTextEmail = "Campo requerido";
                                    });
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 1.2,
                              height: 45,
                              margin: EdgeInsets.only(top: 32),
                              padding: EdgeInsets.only(
                                  top: 4, left: 16, right: 16, bottom: 4),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                  color: Colors.black12),
                              child: TextFormField(
                                onTap: () {
                                  setState(() {
                                    hintTextSenha = "Senha";

                                  });
                                },
                                controller: _senhaController,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    icon: Icon(
                                      Icons.enhanced_encryption_rounded,
                                      color: Colors.grey,
                                    ),
                                    hintText: hintTextSenha),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    setState(() {
                                      hintTextSenha = "Campo requerido";
                                    });
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Column(children: [
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: InkWell(
                        onTap: () {
                          if (_formKey.currentState.validate()) {
                            Usuario novoUsuario = Usuario(
                                nome: _nomeController.text,
                                email: _emailController.text,
                                senha: _senhaController.text);
                            urs.addUsuario(novoUsuario);
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => HomeScreen()));
                          }
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width / 1.2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey)),
                          child: Center(
                            child: Text("Cadastrar Usuário"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => LoginScreen()));
                        },
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width / 1.2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey),
                              color: Colors.blueAccent),
                          child: Center(
                            child: Text(
                              "Já possuo cadastro",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              ],
            )
          ],
        ),
      ),
    );
  }
}
