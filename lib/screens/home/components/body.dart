import 'package:flutter/material.dart';
import '../../../screens/components/card_conta.dart';
import '../../../screens/components/card_transacao.dart';
import '../../../screens/transacao/transacao_screen.dart';
import '../../../services/conta_rest_service.dart';
import '../../../services/transacao_rest_service.dart';
import '../../../utils/secure_storage_util.dart';
import 'dart:convert';


class Body extends StatefulWidget {
  String token;

  Body({this.token});

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  ContaRestService crs = ContaRestService();
  TransacaoRestService trs = TransacaoRestService();
  Future<List> _loadContas;
  Future<List> _loadTransacoes;
  List _contas;
  List _transacoes;
  Future<String> _loadToken;
  String _token;
  SecureStorageUtil ss = SecureStorageUtil();


  @override
  void initState() {
    // TODO: implement initState
    _token = widget.token;
    _refresh();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _loadToken,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          _token = snapshot.data;
          return RefreshIndicator(
            onRefresh: _refresh,
            child: Padding(
              padding: EdgeInsets.only(top: 70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 175,
                    child: FutureBuilder(
                      future: _loadContas,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          _contas = snapshot.data;
                          return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: _contas.length,
                              padding: EdgeInsets.only(left: 16, right: 8),
                              itemBuilder: (context, index) {
                                return cardConta(context, _contas[index]);
                              }
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Icon(
                                Icons.enhanced_encryption_rounded
                            ),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 24, top: 32, bottom: 16, right: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Últimas transações",
                          style: TextStyle(fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => TransacaoScreen()
                                )
                            );
                          },
                          child: Text(
                            "Ver todas",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w700,
                                color: Colors.blue),
                          ),
                        )
                      ],
                    ),
                  ),
                  FutureBuilder(
                      future: _loadTransacoes,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          _transacoes = snapshot.data;
                          return Expanded(
                            child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                itemCount: _transacoes.length > 8
                                    ? 8
                                    : _transacoes.length,
                                padding: EdgeInsets.all(10),
                                itemBuilder: (context, index) {
                                  return cardTransacao(
                                      context, index, _transacoes[index]);
                                }
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Icon(
                                Icons.enhanced_encryption_rounded
                            ),
                          );
                        } else {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }
                  ),
                ],
              ),
            ),

          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    );
  }

  Future<Null> _refresh() async {
    setState(() {
      _loadToken = _getJwt();
      _loadTransacoes = _getTransacoes(_token);
      _loadContas = _getContas(_token);
    });
  }

  Future<String> _getJwt() async {
    return await ss.getData('acess_token');
  }

  Future<List> _getContas(String token) async {
    return await crs.getContas(token);
  }

  Future<List> _getTransacoes(String token) async {
    return await trs.getTransacoes(token);
  }
}
