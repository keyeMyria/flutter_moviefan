import 'package:redux/redux.dart';

import '../actions/actions.dart';
import '../models/models.dart';
import '../networking/movies_controller.dart';

List<Middleware<AppState>> createStoreMoviesMiddleware() {
  final loadMovies = _createFetchMovies();

  return combineTypedMiddleware([
    new MiddlewareBinding<AppState, FetchMoviesAction>(loadMovies),
  ]);
}

Middleware<AppState> _createFetchMovies() {
  return (Store<AppState> store, action, NextDispatcher next) {
    store.dispatch(new FetchMoviesStartedAction());

    moviesController.getTopRatedMovies()
      .listen(
        (movies) => store.dispatch(new FetchMoviesSuccessAction(movies)),
        onError: (error) => store.dispatch(new FetchMoviesFailedAction(error))
      );

    next(action);
  };
}
