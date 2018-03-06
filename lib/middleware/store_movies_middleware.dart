import 'dart:async';
import 'package:redux/redux.dart';

import '../actions/actions.dart';
import '../models/models.dart';

List<Middleware<AppState>> createStoreMoviesMiddleware() {
  final loadMovies = _createFetchMovies();

  return combineTypedMiddleware([
    new MiddlewareBinding<AppState, FetchMoviesAction>(loadMovies),
  ]);
}

Middleware<AppState> _createFetchMovies() {
  return (Store<AppState> store, action, NextDispatcher next) {
    store.dispatch(new FetchMoviesStartedAction());
    _getDummyData()
      .then((movies) {
        store.dispatch(new FetchMoviesSuccessAction(movies));
      })
      .catchError((error) => store.dispatch(new FetchMoviesFailedAction(error)));

    next(action);
  };
}

Future<List<Movie>> _getDummyData() async {
  final List<Movie> _data = [
    new Movie(
      title: '2001: a space oddysey',
      description: 'An imposing black structure provides a connection between the past and the future in this enigmatic adaptation of a short story by revered sci-fi author Arthur C. Clarke.',
      duration: '2:50hs',
      rating: '8.1',
      genre: ['Sci-Fi', 'Drama'],
      imageUrl: 'https://www.o-cinema.org/wp-content/uploads/2013/04/2001-a-space-odyssey-552a7fc41108e-1-718x1024.jpg',
    ),
    new Movie(
      title: 'The shinning',
      description: 'Jack Torrance (Jack Nicholson) becomes winter caretaker at the isolated Overlook Hotel in Colorado, hoping to cure his writer\'s block.',
      duration: '2:26hs',
      rating: '8.4',
      genre: ['Drama', 'Horror'],
      imageUrl: 'https://images-na.ssl-images-amazon.com/images/M/MV5BZjlkYmFlNjEtNjY4NS00NWQwLTk0M2MtZjM4ZTBjNzE4NzRiL2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SY1000_CR0,0,666,1000_AL_.jpg',
    ),
  ];

  await new Future.delayed(new Duration(seconds: 2));

  return _data;
}
