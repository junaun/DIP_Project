import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:units_converter/models/conversion_node.dart';
import 'package:units_converter/units_converter.dart';

// TODO:
// Fix the setstate on the onPress of unit changes
// Create dart files to write various code on different pages

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Conversion',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Unit Conversion'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myController =
      TextEditingController(); //for controlling input for unit conv
  String dropdownvalue = "m";
  String dropdownvalue2 = "m";

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("um"), value: "um"),
      const DropdownMenuItem(child: Text("mm"), value: "mm"),
      const DropdownMenuItem(child: Text("cm"), value: "cm"),
      const DropdownMenuItem(child: Text("m"), value: "m"),
    ];
    return menuItems;
  }

  var _number;
  var _calc;

  void _updateText(val) {
    if (dropdownvalue == "um") {
      switch (dropdownvalue2) {
        case 'um':
          _calc = double.parse(val)
              .convertFromTo(LENGTH.micrometers, LENGTH.micrometers);
          break;
        case 'mm':
          _calc = double.parse(val)
              .convertFromTo(LENGTH.micrometers, LENGTH.millimeters);
          break;
        case 'cm':
          _calc = double.parse(val)
              .convertFromTo(LENGTH.micrometers, LENGTH.centimeters);
          break;
        case "m":
          _calc = double.parse(val)
              .convertFromTo(LENGTH.micrometers, LENGTH.meters);
          break;
      }
    } else if (dropdownvalue == "mm") {
      switch (dropdownvalue2) {
        case 'um':
          _calc = double.parse(val)
              .convertFromTo(LENGTH.millimeters, LENGTH.micrometers);
          break;
        case 'mm':
          _calc = double.parse(val)
              .convertFromTo(LENGTH.millimeters, LENGTH.millimeters);
          break;
        case 'cm':
          _calc = double.parse(val)
              .convertFromTo(LENGTH.millimeters, LENGTH.centimeters);
          break;
        case "m":
          _calc = double.parse(val)
              .convertFromTo(LENGTH.millimeters, LENGTH.meters);
          break;
      }
    } else if (dropdownvalue == "cm") {
      switch (dropdownvalue2) {
        case 'um':
          _calc = double.parse(val)
              .convertFromTo(LENGTH.centimeters, LENGTH.micrometers);
          break;
        case 'mm':
          _calc = double.parse(val)
              .convertFromTo(LENGTH.centimeters, LENGTH.millimeters);
          break;
        case 'cm':
          _calc = double.parse(val)
              .convertFromTo(LENGTH.centimeters, LENGTH.centimeters);
          break;
        case "m":
          _calc = double.parse(val)
              .convertFromTo(LENGTH.centimeters, LENGTH.meters);
          break;
      }
    } else if (dropdownvalue == "m") {
      switch (dropdownvalue2) {
        case 'um':
          _calc = double.parse(val)
              .convertFromTo(LENGTH.meters, LENGTH.micrometers);
          break;
        case 'mm':
          _calc = double.parse(val)
              .convertFromTo(LENGTH.meters, LENGTH.millimeters);
          break;
        case 'cm':
          _calc = double.parse(val)
              .convertFromTo(LENGTH.meters, LENGTH.centimeters);
          break;
        case 'm':
          _calc = double.parse(val).convertFromTo(LENGTH.meters, LENGTH.meters);
          break;
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Invalid input')));
    }

    setState(() {
      if (_calc < 0) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('No negative values for length')));
      } else if (double.parse(val) == _calc && double.parse(val) >= 1) {
        _number = _calc.round();
      } else if (_calc >= 0.1 && _calc <= 1000) {
        _number = _calc;
      } else if (_calc > 0.00001 && _calc < 0.1) {
        _number = _calc.toStringAsExponential(2);
      } else if (_calc > 1000) {
        _number = _calc.toStringAsExponential(2);
      } else if (myController.text.isEmpty) {
        _number = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    // ignore: dead_code

    void dropdownCallback(String? selectedValue) {
      if (selectedValue is String) {
        setState(() {
          dropdownvalue = selectedValue;
        });
      }
    }

    void dropdownCallback2(String? selectedValue2) {
      if (selectedValue2 is String) {
        setState(() {
          dropdownvalue2 = selectedValue2;
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(children: [
        Row(
          children: [
            Expanded(
                child: Container(
                    height: 40.0,
                    width: 60.0,
                    child: TextFormField(
                      controller: myController,
                      onChanged: (var value) {
                        if (value.contains("-")) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content:
                                      Text('No negative values for length')));
                        } else if (myController.text.isEmpty) {
                          _updateText(value = '0.0');
                        } else {
                          _updateText(value);
                        }
                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(
                            15), //length of text input; requires services.dart library
                      ],
                      keyboardType: const TextInputType.numberWithOptions(
                          decimal: true, signed: true),
                      decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                          hintText: 'Enter a number'),
                      style: const TextStyle(fontSize: 15),
                    ))),
            Expanded(
                child: Container(
              height: 40.0,
              width: 150.0,
              color: Colors.white,
              alignment: Alignment.centerLeft,
              child: Text(style: TextStyle(fontSize: 15), "$_number"),
            ))
          ],
        ),

        //dropdown units
        Row(children: [
          Expanded(
              child: Container(
            height: 50.0,
            width: 20.0,
            child: DropdownButtonHideUnderline(
                child: DropdownButton(
              items: dropdownItems,
              value: dropdownvalue,
              onChanged: dropdownCallback,
            )),
          )),
          Expanded(
              child: Container(
                  height: 30.0,
                  width: 15.0,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      items: dropdownItems,
                      value: dropdownvalue2,
                      onChanged: dropdownCallback2,
                    ),
                  )))
        ])
      ]),
    );
  }
}
