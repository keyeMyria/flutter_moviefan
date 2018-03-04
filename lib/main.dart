import 'package:flutter/material.dart';

import './widgets/Onboarding.dart';

void main() => runApp(MovieFan());

class MovieFan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MovieFan',
      theme: ThemeData.dark(),
      home: SafeArea(
        child: Onboarding()
      ),
    );
  }
}

