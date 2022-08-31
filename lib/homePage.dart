import 'package:calculator/displayBox.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Smart Calculator"),
          backgroundColor: Colors.black38,
        ),
        body: Column(children: <Widget>[
          Expanded(child: DisplayBox(), flex: 1),
          Expanded(
            flex: 2,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              margin: EdgeInsets.all(10),
              child: Text("This is the keypad"),
              color: Colors.black45,
            ),
          )
        ]),
        drawer: Drawer(
          backgroundColor: Colors.black38,
          child: Text("this is the function page"),
        ),
      ),
    );
  }
}
