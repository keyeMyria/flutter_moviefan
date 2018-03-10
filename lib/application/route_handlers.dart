import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../presentation/home.dart';

final homeHandler = new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return new Home();
});
