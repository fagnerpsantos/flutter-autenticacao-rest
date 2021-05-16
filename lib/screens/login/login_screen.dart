import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_autenticacao_apis_rest/services/login_rest_service.dart';
import '../../models/login.dart';
import '../home/home_screen.dart';
import '../../utils/secure_storage_util.dart';

class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  LoginRestService urs = LoginRestService();

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
                          )
                      ),
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
                    Container(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(top: 62),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: 45,
                            margin: EdgeInsets.only(top: 32),
                            padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                color: Colors.black12
                            ),
                            child: TextField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.mail,
                                    color: Colors.grey,
                                  ),
                                  hintText: 'Email'
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: 45,
                            margin: EdgeInsets.only(top: 32),
                            padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                color: Colors.black12
                            ),
                            child: TextField(
                              controller: _senhaController,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  icon: Icon(
                                    Icons.enhanced_encryption_rounded,
                                    color: Colors.grey,
                                  ),
                                  hintText: 'Senha'
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () async {
                      Login novoLogin = Login(
                          email: _emailController.text,
                          senha: _senhaController.text
                      );
                      var jwt = await urs.loginUsuario(novoLogin);
                      if (jwt != null){
                        var token = json.decode(jwt)['acess_token'];
                        StorageUtil.putString("access_token", token);
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => HomeScreen())
                        );
                      } else {
                        print("erro");
                      }

                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      height: 45,
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey)
                      ),
                      child: Center(
                        child: Text("Login"),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
