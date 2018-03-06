import 'package:redux/redux.dart';

import '../actions/actions.dart';
import '../models/models.dart';

final moviesReducer = combineTypedReducers<List<Movie>>([
  new ReducerBinding<List<Movie>, FetchMoviesSuccessAction>(_fetchMoviesSuccess),
]);

List<Movie> _fetchMoviesSuccess(List<Movie> movies, FetchMoviesSuccessAction action) {
  return action.movies;
}
