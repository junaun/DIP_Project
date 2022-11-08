import 'dart:ffi';
//import 'dart:html';
import 'package:calculator/differntaition.dart';
import 'package:calculator/homePage.dart';
import 'package:calculator/keyboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'dart:math';
import 'package:matrix2d/matrix2d.dart';

class Matrices extends StatefulWidget {
  const Matrices({Key? key}) : super(key: key);

  @override
  _MatrixState createState() => _MatrixState();
}

// ignore: camel_case_types
class verifyTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final regEx =
        RegExp(r'^\d*\.?\d*'); //REGEX for ensuring only a digit is allowed
    final String newString = regEx.stringMatch(newValue.text) ?? '';
    return newString == newValue.text ? newValue : oldValue;
  }
}

class _MatrixState extends State<Matrices> {
  void calculation(val) {
    // length = double.parse(val);
    var newLength;
  }

  final rowRequestController = TextEditingController();
  final columnRequestController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    rowRequestController.dispose();
    columnRequestController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Matrices"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                    padding: const EdgeInsets.fromLTRB(25, 20, 20, 10),
                    child: Text(
                      'Matrix Dimensions',
                      style: GoogleFonts.poppins(
                          color: const Color.fromARGB(200, 48, 50, 52),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
              ),
            ],
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: TextFormField(
                  maxLength: 1,
                  controller: rowRequestController,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: false,
                    signed: false,
                  ),
                  inputFormatters: [
                    verifyTextInputFormatter(),
                  ],
                  decoration: const InputDecoration(
                      labelText: 'Enter number of Rows',
                      hintStyle: TextStyle(fontSize: 10),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0)))),
                ),
              ),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
                child: Container(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: TextFormField(
                maxLength: 1,
                controller: columnRequestController,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: false,
                  signed: false,
                ),
                inputFormatters: [
                  verifyTextInputFormatter(),
                ],
                decoration: const InputDecoration(
                    labelText: 'Enter number of Columns',
                    hintStyle: TextStyle(fontSize: 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)))),
              ),
            ))
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                width: MediaQuery.of(context).size.width * .95,
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            textStyle: const TextStyle(fontSize: 20)),
                        child: const Text(('Go!')),
                        onPressed: () {
                          if (rowRequestController.text.isEmpty ||
                              columnRequestController.text.isEmpty) {
                            TextInputFormatter;
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Fill in dimensions for Matrices')));
                          } else {
                            String rowNumber = rowRequestController.text;
                            String columnNumber = columnRequestController.text;
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SecondScreen(rowNumber, columnNumber)),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

class SecondScreen extends StatefulWidget {
  const SecondScreen(this.rowNumber, this.columnNumber, {Key? key})
      : super(key: key);

  final String rowNumber, columnNumber;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  var i, j;
  var a = 0;
  List<String> matrixValues = [];

  final List<TextEditingController> _controller =
      List.generate(81, (i) => TextEditingController());
  late String dropdownvalue = "transpose";

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Transpose"), value: "transpose"),
      const DropdownMenuItem(child: Text("Inverse"), value: "inverse"),
      const DropdownMenuItem(child: Text("Determinant"), value: "det"),
    ];
    return menuItems;
  }

  void matrixSplit(List matrixValues) {
    print(matrixValues);
    var chunks = [];
    int chunkSize = j;
    for (var y = 0; y < matrixValues.length; y += (chunkSize - 1)) {
      chunks.add(matrixValues.sublist(
          y,
          y + chunkSize > matrixValues.length
              ? matrixValues.length
              : y + (chunkSize - 1)));
    }
    print(chunks);
    matrixValues.clear();
  }

  void dropdownCallback(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {
        dropdownvalue = selectedValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    print('number of rows are ${widget.rowNumber}');
    print('number of columns are ${widget.columnNumber}');

    //int rows = int.parse('${widget.rowNumber}');

    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      for (final controller in _controller) {
        controller.dispose();
      }
      super.dispose();
    }

    final controller = TextEditingController();

    setState(() {
      _controller.add(controller);
    });

    print('how many controller+ {$controller}');
    print('sadadsasda $a');
    return Scaffold(
      appBar: AppBar(
        title: const Text("Matrix Input"),
      ),
      body: Container(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.fromLTRB(10, 5, 20, 10),
                        child: Text(
                          'Enter Matrix Dimensions',
                          style: GoogleFonts.poppins(
                              color: const Color.fromARGB(200, 48, 50, 52),
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
              ),
              Row(children: [
                Expanded(
                    child: Column(
                  children: [
                    for (i = 1; i <= int.parse(widget.rowNumber); i++)
                      Row(
                        children: [
                          for (j = 1; j <= int.parse(widget.columnNumber); j++)
                            Expanded(
                              child: TextFormField(
                                controller: _controller[++a],
                                maxLength: 6,
                                keyboardType:
                                    const TextInputType.numberWithOptions(),
                                inputFormatters: [verifyTextInputFormatter()],
                                decoration:
                                    InputDecoration(hintText: '[$i][$j]'),
                              ),
                            ),
                        ],
                      ),
                  ],
                ))
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 10, 5, 10),
                        padding: const EdgeInsets.fromLTRB(5, 15, 5, 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.blueAccent),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: DropdownButtonHideUnderline(
                          child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                              child: DropdownButton2(
                                items: dropdownItems, //dropdownItems,
                                value: dropdownvalue,
                                onChanged: dropdownCallback,
                                dropdownMaxHeight: 200,
                                iconSize: 20,
                                isDense: true,
                                isExpanded: true,
                                iconEnabledColor: Colors.blue,
                              )),
                        )),
                  ),
                  Expanded(
                      child: Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
                          textStyle: const TextStyle(fontSize: 20)),
                      child: const Text('calculate'),
                      onPressed: () {
                        for (int k = 1; k <= ((i - 1) * (j - 1)); ++k) {
                          print(_controller[k].text.toString());
                          matrixValues.add(_controller[k].text.toString());
                          //print('k value is $k');
                        }
                        matrixSplit(matrixValues);
                      },
                    ),
                  ))
                ],
              )
            ],
          )),
    );
  }
}
