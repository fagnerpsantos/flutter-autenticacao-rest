import 'package:flutter/material.dart';
import '../../screens/home/components/body.dart';
import '../../screens/home/components/speed_dial.dart';

class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
      floatingActionButton: buildSpeedDial(context),
    );
  }
}
