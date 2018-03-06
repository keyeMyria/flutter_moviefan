import '../models/models.dart';

class FetchMoviesAction {}
class FetchMoviesStartedAction {}
class FetchMoviesFailedAction {
  final String error;

  FetchMoviesFailedAction(this.error);
}
class FetchMoviesSuccessAction {
  final List<Movie> movies;

  FetchMoviesSuccessAction(this.movies);
}
