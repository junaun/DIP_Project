import 'package:flutter/material.dart';

class DisplayBox extends StatefulWidget {
  @override
  _DisplayBoxState createState() => _DisplayBoxState();
}

class _DisplayBoxState extends State<DisplayBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(5),
        color: Colors.black26,
        child: Column(children: <Widget>[
          Expanded(flex: 3, child: Text("The calculation equation goes here")),
          Divider(color: Colors.black54),
          Expanded(flex: 2, child: Text("The calculated result goes here"))
        ]));
  }
}
