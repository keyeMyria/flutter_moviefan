import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../application/application.dart';

final _titleStyle = new TextStyle(
  color: Colors.black,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.bold,
  fontSize: 19.0,
  decoration: TextDecoration.none,
);
final _subtitleStyle = new TextStyle(
  color: Colors.black,
  fontFamily: 'Roboto',
  fontWeight: FontWeight.normal,
  fontSize: 19.0,
  decoration: TextDecoration.none,
);
final _cancelStyle = new TextStyle(
  color: Colors.grey,
  fontFamily: 'Roboto',
  fontSize: 17.0,
  decoration: TextDecoration.none,
);
final _applyTextStyle = new TextStyle(
  color: Colors.white,
  fontFamily: 'Kavoon',
  fontSize: 21.0,
  decoration: TextDecoration.none,
);

class AdvancedFilters extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _AdvancedFilters();
}

class _AdvancedFilters extends State<AdvancedFilters> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      child: new Column(
        children: [
          new Expanded(
            flex: 1,
            child: new Container(
              alignment: AlignmentDirectional.centerStart,
              padding: new EdgeInsets.all(20.0),
              child: new Text('Filter results', style: _titleStyle),
            ),
          ),
          new Expanded(
            flex: 1,
            child: new Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new Text('Genre', style: _subtitleStyle),
                  new Text('Any', style: _cancelStyle),
                ],
              ),
            ),
          ),
          new Divider(
            height: 1.0,
            color: Colors.black,
          ),
          new Expanded(
            flex: 1,
            child: new Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new Text('Year', style: _subtitleStyle),
                  new Text('Any', style: _cancelStyle),
                ],
              ),
            ),
          ),
          new Divider(
            height: 1.0,
            color: Colors.black,
          ),
          new Expanded(
            flex: 1,
            child: new Padding(
              padding: const EdgeInsets.all(20.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new Text('Display adult content', style: _subtitleStyle),
                  new CupertinoSwitch(
                    value: true,
                    onChanged: (value) => print(value)
                  ),
                ],
              ),
            ),
          ),
          new Divider(
            height: 1.0,
            color: Colors.black,
          ),
          new Expanded(
            flex: 2,
            child: new Padding(
              padding: const EdgeInsets.all(40.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  new GestureDetector(
                    child: new Container(
                      child: new Text('Clear filters', style: _cancelStyle),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  new CupertinoButton(
                    padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                    minSize: 44.0,
                    borderRadius: new BorderRadius.circular(30.0),
                    color: Colors.red,
                    onPressed: (){},
                    pressedOpacity: 0.4,
                    child: new Text('Apply', style: _applyTextStyle)
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
