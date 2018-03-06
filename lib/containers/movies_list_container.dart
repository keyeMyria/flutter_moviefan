import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import '../models/models.dart';
import '../actions/actions.dart';

class MoviesListContainer extends StatelessWidget {
  final ViewModelBuilder<List<Movie>> builder;

  MoviesListContainer({ @required this.builder });

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, List<Movie>>(
      onInit: (store) => store.dispatch(new FetchMoviesAction()),
      converter: (Store<AppState> store) => store.state.movies,
      builder: builder,
    );
  }
}
