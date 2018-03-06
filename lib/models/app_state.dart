import 'package:meta/meta.dart';

import './models.dart';

@immutable
class AppState {
  AppState({
    this.movies = const [],
    this.status = const ActionStatus(status: Status.NOT_STARTED, error: null),
  });

  final List<Movie> movies;
  final ActionStatus status;
}
