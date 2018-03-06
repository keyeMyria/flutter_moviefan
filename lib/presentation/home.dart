import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../actions/actions.dart';
import '../models/models.dart';
import '../containers/movies_list_container.dart';
import '../containers/movies_loading_container.dart';
import './movies_list.dart';
import './loading_indicator.dart';

final _titleStyle = new TextStyle(
  color: Colors.white,
  fontFamily: 'Kavoon',
  fontSize: 22.0,
);
final _textStyle = new TextStyle(
  color: Colors.white,
  fontFamily: 'Roboto',
  fontSize: 14.0,
);
final _sortStyle = new TextStyle(
  color: Colors.red,
  fontFamily: 'Roboto',
  fontSize: 17.0,
);

class Home extends StatelessWidget {
  Widget _buildMoviesListHeader() {
    return new Container(
      height: 50.0,
      padding: const EdgeInsets.only(left: 15.0, bottom: 15.0, right: 15.0),
      color: Colors.grey[900],
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              new Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: new Text('Sort by:', style: _textStyle),
              ),
              new Text('Best rated ▾', style: _sortStyle),
            ],
          ),
          new Image(
            height: 24.0,
            width: 24.0,
            image: new AssetImage('assets/images/filterIcon.png'),
          )
        ],
      ),
    );
  }

  Widget _buildMoviesList() {
    return new MoviesListContainer(
      builder: (BuildContext context, List<Movie> movies) {
        return new Expanded(
          flex: 1,
          child: new MoviesList(data: movies),
        );
      },
    );
  }

  Widget _buildMoviesListLoading() {
    return new MoviesLoadingContainer(
      builder: (BuildContext context, bool isLoading) {
        return isLoading
          ? new LoadingIndicator()
          : this._buildMoviesList();
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return new StoreBuilder(
      onInit: (store) => store.dispatch(new FetchMoviesAction()),
      builder: (context, store) {
        return new Scaffold(
          appBar: new AppBar(
            title: new Text('MovieFan🍿', style: _titleStyle),
            elevation: 0.0
          ),
          body: new Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              this._buildMoviesListHeader(),
              this._buildMoviesListLoading(),
            ],
          ),
        );
      }
    );
  }
}
