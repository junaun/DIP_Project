import 'package:calculator/buttonBox.dart';
import 'package:calculator/diffrentiation.dart';
import 'package:calculator/displayBox.dart';
import 'package:calculator/containerHistory.dart';
import 'package:calculator/drawer.dart';
import 'package:calculator/equations.dart';
import 'package:calculator/plotting/Plotted_type.dart';
import 'package:calculator/services/colorController.dart';
import 'package:calculator/services/colorProvider.dart';
import 'package:calculator/services/displayStrController.dart';
import 'package:calculator/unitConv.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
  // Widget build(BuildContext context) {
  //   return Container(
  //     child: Scaffold(
  //         appBar: AppBar(
  //           title: Text("Smart Calculator"),
  //           backgroundColor: Provider.of<ColorProvider>(context).getColor(),
  //           actions: [
  //             PopupMenuButton(
  //                 // add icon, by default "3 dot" icon
  //                 // icon: Icon(Icons.book)
  //                 itemBuilder: (context) {
  //               return [
  //                 PopupMenuItem<int>(
  //                   value: 0,
  //                   child: Text("Equation Solver"),
  //                 ),
  //                 PopupMenuItem<int>(
  //                   value: 1,
  //                   child: Text("Matrix Calculation"),
  //                 ),
  //                 PopupMenuItem<int>(
  //                   value: 2,
  //                   child: Text("Graph Plotting"),
  //                 ),
  //                 PopupMenuItem<int>(
  //                   value: 3,
  //                   child: Text("Unit Conversion"),
  //                 ),
  //               ];
  //             }, onSelected: (value) {
  //               if (value == 0) {
  //                 print("equation solver is selected.");
  //                 Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                       builder: (context) => const EquationApp()),
  //                 );
  //               } else if (value == 1) {
  //                 Provider.of<ColorProvider>(context).changeColor("white");
  //                 print(Provider.of<ColorProvider>(context).getColor());
  //               } else if (value == 2) {
  //                 print("graph plotting is selected.");
  //                 Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                       builder: (context) => const Typeselection()),
  //                 );
  //               } else if (value == 3) {
  //                 print("unitconversion is selected.");
  //                 Navigator.push(
  //                   context,
  //                   MaterialPageRoute(builder: (context) => const Convertor()),
  //                 );
  //               }
  //             }),
  //           ],
  //         ),
  //         body: Column(children: <Widget>[
  //           //Expanded(child: containerHistory(), flex: 3),
  //           // Expanded(
  //           //     child: TextButton(
  //           //   child: Text("change towhite"),
  //           //   onPressed: () {
  //           //     setState(() {
  //           //       colorController.changeColor("white");
  //           //     });
  //           //   },
  //           // )),
  //           // Expanded(
  //           //     child: TextButton(
  //           //   child: Text("change toblack"),
  //           //   onPressed: () {
  //           //     setState(() {
  //           //       colorController.changeColor("black");
  //           //     });
  //           //   },
  //           // )),
  //           // Expanded(
  //           //   child: Text(colorController.color.toString()),
  //           // ),
  //           Expanded(child: DisplayBox(), flex: 4),
  //         ]),
  //         drawer: SideBar()),
  //   );
  // }
}

class _HomePageState extends State<HomePage> {
  ColorController colorController = ColorController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
          appBar: AppBar(
            title: Text(Provider.of<ColorProvider>(context).name),
            backgroundColor: Provider.of<ColorProvider>(context).getColor(),
            actions: [
              PopupMenuButton(
                  // add icon, by default "3 dot" icon
                  // icon: Icon(Icons.book)
                  itemBuilder: (context) {
                return [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text("Equation Solver"),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Text("Matrix Calculation"),
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Text("Graph Plotting"),
                  ),
                  PopupMenuItem<int>(
                    value: 3,
                    child: Text("Unit Conversion"),
                  ),
                ];
              }, onSelected: (value) {
                if (value == 0) {
                  print("equation solver is selected.");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EquationApp()),
                  );
                } else if (value == 1) {
                  Provider.of<ColorProvider>(context, listen: false)
                      .changeColor(Colors.white);
                } else if (value == 2) {
                  print("graph plotting is selected.");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Typeselection()),
                  );
                } else if (value == 3) {
                  print("unitconversion is selected.");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Convertor()),
                  );
                }
              }),
            ],
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
            Expanded(child: DisplayBox(), flex: 4),
          ]),
          drawer: SideBar()),
    );
  }
}
