import 'dart:convert';
import 'package:rxdart/rxdart.dart';

import './http_client.dart';
import '../models/models.dart';

class MoviesController {
  Observable<List<Object>> getMovieGenres() {
    final request = httpClient.get('/genre/movie/list');
    return new Observable.fromFuture(request)
      .where((response) => response != null)
      .map((response) => JSON.decode(response.body))
      .map((body) => body['genres']);
  }

  Observable<List<Movie>> getTopRatedMovies() {
    final request = httpClient.get('/movie/top_rated');
    return this.getMovieGenres()
      .flatMapLatest((genres) {
        return new Observable.fromFuture(request)
          .where((response) => response != null)
          .map((response) => JSON.decode(response.body))
          .map((body) => body['results'])
          .map((moviesJson) => moviesJson.map((m) => this._fixPosterImageUrl(m)))
          .map((moviesJson) => moviesJson.map((m) => this._linkMovieToGenres(m, genres)))
          .map((json) => json.map((m) => new Movie.fromJson(m)).toList());
      });
  }

  Map<String, Object> _fixPosterImageUrl(Map<String, Object> movie) {
    final baseUrl = 'https://image.tmdb.org/t/p/w500/';
    movie['poster_path'] = '$baseUrl${movie['poster_path']}';

    return movie;
  }

  Map<String, Object> _linkMovieToGenres(Map<String, Object> movie, List<Map<String, Object>> genres) {
    final List<int> genreIds = movie["genre_ids"];
    movie["genres"] = genreIds.map((gid) => genres.firstWhere((g) => gid == g['id'])).toList();

    return movie;
  }
}

final moviesController = new MoviesController();
