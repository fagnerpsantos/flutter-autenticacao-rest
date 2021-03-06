import 'package:flutter/material.dart';
import '../../models/conta.dart';
import '../../screens/home/home_screen.dart';
import '../../services/conta_rest_service.dart';

class CadastrarContaScreen extends StatefulWidget {
  @override
  _CadastrarContaScreenState createState() => _CadastrarContaScreenState();
}

class _CadastrarContaScreenState extends State<CadastrarContaScreen> {
  final _tituloController = TextEditingController();

  final _saldoController = TextEditingController();

  ContaRestService crs = ContaRestService();

  final _formKey = GlobalKey<FormState>();




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              appBar: AppBar(
                title: Text("Cadastro de conta"),
                backgroundColor: Colors.blue,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: _tituloController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(labelText: "Título"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Preencha o formulário corretamente";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          controller: _saldoController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(labelText: "Saldo"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Preencha o formulário corretamente";
                            }
                            return null;
                          },
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 20),
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  Conta newConta = Conta(
                                      titulo: _tituloController.text,
                                      saldo: double.parse(_saldoController.text)
                                  );
                                  crs.addConta(newConta);
                                  Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (_) => HomeScreen(),
                                      )
                                  );
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.blue
                              ),
                              child: Text(
                                "Cadastrar",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
}


