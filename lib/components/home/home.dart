import 'package:flutter/material.dart';

import './moviesList.dart';

class _MoviesListHeader extends StatelessWidget {
  final _textStyle = TextStyle(
    color: Colors.white,
    fontFamily: 'Roboto',
    fontSize: 14.0,
  );
  final _sortStyle = TextStyle(
    color: Colors.red,
    fontFamily: 'Roboto',
    fontSize: 17.0,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      padding: const EdgeInsets.only(left: 15.0, bottom: 15.0, right: 15.0),
      color: Colors.grey[900],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text('Sort by:', style: this._textStyle),
              ),
              Text('Best rated ▾', style: this._sortStyle),
            ],
          ),
          Image(
            height: 24.0,
            width: 24.0,
            image: AssetImage('assets/images/filterIcon.png'),
          )
        ],
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _titleStyle = TextStyle(
    color: Colors.white,
    fontFamily: 'Kavoon',
    fontSize: 22.0,
  );

  Widget _renderMoviesList() {
    return Expanded(
      flex: 1,
      child: MoviesList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieFan🍿', style: this._titleStyle),
        elevation: 0.0
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _MoviesListHeader(),
          this._renderMoviesList(),
        ],
      ),
    );
  }
}
