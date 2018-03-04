import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

final buttonTextStyle = TextStyle(
  color: Colors.white,
  fontFamily: 'Kavoon',
  fontSize: 25.0,
  decoration: TextDecoration.none,
);

class RoundButton extends StatelessWidget {
  RoundButton({
    @required this.title,
    @required this.action,
  });

  final String title;
  final Function action;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: const EdgeInsets.only(left: 70.0, right: 70.0),
      minSize: 60.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.red,
      onPressed: this.action,
      pressedOpacity: 0.4,
      child: Text(this.title, style: buttonTextStyle)
    );
  }
}
