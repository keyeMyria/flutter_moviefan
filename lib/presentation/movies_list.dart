import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../models/models.dart';
import './movies_list_item.dart';

class MoviesList extends StatelessWidget {
  MoviesList({ @required this.data });

  final List<Movie> data;

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: this.data.length,
      itemBuilder: (BuildContext context, int index) => new MoviesListItem(data: this.data[index]),
    );
  }
}
