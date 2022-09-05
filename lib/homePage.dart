import 'package:calculator/displayBox.dart';
import 'package:calculator/containerHistory.dart';
import 'package:calculator/services/colorController.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ColorController colorController = new ColorController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Smart Calculator"),
          backgroundColor: colorController.color,
        ),
        body: Column(children: <Widget>[
          //Expanded(child: containerHistory(), flex: 3),
          // Expanded(
          //     child: TextButton(
          //   child: Text("change towhite"),
          //   onPressed: () {
          //     setState(() {
          //       colorController.changeColor("white");
          //     });
          //   },
          // )),
          // Expanded(
          //     child: TextButton(
          //   child: Text("change toblack"),
          //   onPressed: () {
          //     setState(() {
          //       colorController.changeColor("black");
          //     });
          //   },
          // )),
          // Expanded(
          //   child: Text(colorController.color.toString()),
          // ),
          Expanded(child: DisplayBox(), flex: 2),
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
