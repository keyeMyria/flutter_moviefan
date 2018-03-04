import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import '../../config/application.dart';
import '../../config/routes.dart';
import '../onboarding/onboarding.dart';

class MovieFan extends StatefulWidget {
  @override
  State createState() => _MovieFanState();
}

class _MovieFanState extends State<MovieFan> {
  _MovieFanState() {
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MovieFan',
      theme: ThemeData.dark(),
      home: Onboarding(),
    );
  }
}
