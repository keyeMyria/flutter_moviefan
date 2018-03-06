import '../models/models.dart';

import './status_reducer.dart';
import './movies_reducer.dart';

AppState appReducer(AppState state, action) {
  return new AppState(
    movies: moviesReducer(state.movies, action),
    status: statusReducer(state.status, action),
  );
}
