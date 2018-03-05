import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';

import '../../models/Movie.dart';

class _MoviesListItem extends StatelessWidget {
  final _movieTitleStyle = TextStyle(
    color: Colors.black,
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w700,
    fontSize: 17.0,
  );
  final _movieSubTitleStyle = TextStyle(
    color: Colors.grey,
    fontFamily: 'Roboto',
    fontSize: 12.0,
  );
  final _movieDescriptionStyle = TextStyle(
    color: Colors.black,
    fontFamily: 'Roboto',
    fontSize: 14.0,
  );

  _MoviesListItem({ @required this.data });

  final Movie data;  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          key: PageStorageKey(1),
          height: 160.0,
          color: Colors.white,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image(
                  image: NetworkImageWithRetry(this.data.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(this.data.title, style: this._movieTitleStyle),
                      Text("${this.data.duration} - ${this.data.genre.join(", ")}", style: this._movieSubTitleStyle),
                      Text("Popularity: ${this.data.rating}", style: this._movieSubTitleStyle),
                      Text(this.data.description, maxLines: 4, overflow: TextOverflow.ellipsis, style: this._movieDescriptionStyle),
                    ]
                  ),
                ),
              )
            ],
          )
        ),
        Divider(
          height: 0.5,
          color: Colors.grey,
        ),
      ],
    );
  }
}

class MoviesList extends StatelessWidget {
  final List<Movie> _data = [
    Movie(
      title: '2001: a space oddysey',
      description: 'An imposing black structure provides a connection between the past and the future in this enigmatic adaptation of a short story by revered sci-fi author Arthur C. Clarke.',
      duration: '2:50hs',
      rating: '8.1',
      genre: ['Sci-Fi', 'Drama'],
      imageUrl: 'https://www.o-cinema.org/wp-content/uploads/2013/04/2001-a-space-odyssey-552a7fc41108e-1-718x1024.jpg',
    ),
    Movie(
      title: 'The shinning',
      description: 'Jack Torrance (Jack Nicholson) becomes winter caretaker at the isolated Overlook Hotel in Colorado, hoping to cure his writer\'s block.',
      duration: '2:26hs',
      rating: '8.4',
      genre: ['Drama', 'Horror'],
      imageUrl: 'https://images-na.ssl-images-amazon.com/images/M/MV5BZjlkYmFlNjEtNjY4NS00NWQwLTk0M2MtZjM4ZTBjNzE4NzRiL2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SY1000_CR0,0,666,1000_AL_.jpg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this._data.length,
      itemBuilder: (BuildContext context, int index) => _MoviesListItem(data: this._data[index]),
    );
  }
}
