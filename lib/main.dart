import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import './config/application.dart';
import './config/routes.dart';
import './store/store.dart';
import './app.dart';

void main() {
  final router = new Router();
  Routes.configureRoutes(router);
  Application.router = router;

  runApp(new MovieFan(store: store));
}
