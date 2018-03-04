import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MovieFan'), elevation: 0.0),
      body: Container(child: Center(child: Text('Home screen'))),
    );
  }
}
