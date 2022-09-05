import 'containerHistory.dart';
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
      color: Colors.white70,
      child: containerHistory(),
    );
  }
}
