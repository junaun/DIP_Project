import 'package:calculator/services/displayStrController.dart';

import 'containerHistory.dart';
import 'buttonBox.dart';
import 'package:flutter/material.dart';

class DisplayBox extends StatefulWidget {
  @override
  _DisplayBoxState createState() => _DisplayBoxState();
}

class _DisplayBoxState extends State<DisplayBox> {
  DisplayStrController strController = DisplayStrController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(5),
      color: Colors.white70,
      child: Column(children: [
        Expanded(child: ContainerHistory(strController), flex: 2),
        Expanded(
          flex: 2,
          child: ButtonBox(strController),
        )
      ]),
    );
  }
}
