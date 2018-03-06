import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

import './models/models.dart';
import './presentation/home.dart';

class MovieFan extends StatefulWidget {
  MovieFan({ this.store });

  final Store<AppState> store;

  @override
  State<StatefulWidget> createState() => new _MovieFanState();
}

class _MovieFanState extends State<MovieFan> {
  @override
  Widget build(BuildContext context) {
    return new StoreProvider(
      store: widget.store,
      child: new MaterialApp(
        title: 'MovieFan!',
        theme: new ThemeData.dark(),
        home: new Home(),
      )
    );
  }
}
