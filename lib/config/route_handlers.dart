import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../components/home/home.dart';

final homeHandler = new Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return Home();
});
