import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';

import '../models/models.dart';

final _titleStyle = new TextStyle(
  color: Colors.black,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.bold,
  fontSize: 17.0,
);
final _subTitleStyle = new TextStyle(
  color: Colors.grey,
  fontFamily: 'Roboto',
  fontSize: 12.0,
);
final _descriptionStyle = new TextStyle(
  color: Colors.black,
  fontFamily: 'Roboto',
  fontSize: 14.0,
);

class MoviesListItem extends StatelessWidget {
  MoviesListItem({ @required this.data });

  final Movie data;  

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        new Container(
          key: new PageStorageKey(1),
          height: 160.0,
          color: Colors.white,
          child: new Row(
            children: [
              new Expanded(
                flex: 1,
                child: new Image(
                  image: new NetworkImageWithRetry(this.data.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              new Expanded(
                flex: 2,
                child: new Container(
                  alignment: Alignment.topCenter,
                  padding: const EdgeInsets.all(15.0),
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      new Text(this.data.title, style: _titleStyle),
                      new Text("${this.data.releaseDate} - ${this.data.genres.map((g) => g.name).join(", ")}", style: _subTitleStyle),
                      new Text("Popularity: ${this.data.rating}", style: _subTitleStyle),
                      new Text(this.data.description, maxLines: 4, overflow: TextOverflow.ellipsis, style: _descriptionStyle),
                    ]
                  ),
                ),
              )
            ],
          )
        ),
        new Divider(
          height: 0.5,
          color: Colors.grey,
        ),
      ],
    );
  }
}
