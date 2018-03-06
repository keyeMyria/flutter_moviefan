import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

final _titleStyle = new TextStyle(
  color: Colors.white,
  fontFamily: 'Roboto',
  fontSize: 14.0,
);

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Expanded(
      flex: 1,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          new Container(
            margin: new EdgeInsets.all(15.0),
            child: new CupertinoActivityIndicator(
              animating: true,
            ),
          ),
          new Text(
            'Loading movies...',
            style: _titleStyle,
          ),
        ],
      ),
    );
  }
}
