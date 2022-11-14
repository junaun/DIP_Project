import 'dart:ffi';
//import 'dart:html';
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
import 'package:equations/equations.dart';
import 'package:scidart/numdart.dart';
import 'package:scidart/scidart.dart';

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
                          } else if (rowRequestController.text == '0' ||
                              columnRequestController.text == '0') {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Dimension cannot be zero')));
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

class _SecondScreenState extends State<SecondScreen>
    with SingleTickerProviderStateMixin {
  final List<TextEditingController> _controller =
      List.generate(81, (i) => TextEditingController());
  //final controller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    for (final controller in _controller) {
      controller.dispose();
    }
    super.dispose();
  }

  // setState(() {
  //   _controller.add(controller);
  // });

  // print('how many controller: {$controller}');
  String outputMatrix = "";
  late String dropdownvalue = "transpose";
  var i, j;
  var a = 0;
  var finalMatrix;
  var chunks = [];
  late int chunkSize;

  List<String> matrixValues = [];
  List<num> stringToDouble = [];
  List<num> chunksToDouble = [];

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Transpose"), value: "transpose"),
      // const DropdownMenuItem(child: Text("Inverse"), value: "inverse"),
      const DropdownMenuItem(child: Text("Determinant"), value: "det"),
    ];
    return menuItems;
  }

  Array2d matrixTranspose(List chunks) {
    var b = Array2d.fixed(
        int.parse(widget.columnNumber), int.parse(widget.rowNumber));
    for (var row = 0; row < int.parse(widget.rowNumber); row++) {
      for (var column = 0; column < int.parse(widget.columnNumber); column++) {
        b[column][row] = chunks[row][column];
      }
    }
    return b;
  }

  RealMatrix matrixDeterminants(List<double> matrixDet) {
    final matrixA = RealMatrix.fromData(
        columns: int.parse(widget.columnNumber),
        rows: int.parse(widget.rowNumber),
        data: [matrixDet]);
    return matrixA;
  }

  void matrixCalculations(var chunks) {
    if (dropdownvalue == 'transpose') {
      //print(matrixTranspose(chunks));
      // setState(() {
      //   outputMatrix = '${matrixTranspose(chunks).toString()}';
      // });
      finalMatrix = matrixTranspose(chunks).toString();
      print('output matrix is $outputMatrix');
      setState(() {
        outputMatrix = '$finalMatrix';
      });
      matrixValues = [];
      // stringToDouble.clear();
      //outputMatrix = '$matrixValues';

    } else if (dropdownvalue == 'det') {
      if (widget.columnNumber != widget.rowNumber) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
                'Determinants must be a Square Matrix, i.e 2x2, 3x3, etc')));
      } else if (dropdownvalue == 'det' &&
          widget.columnNumber != widget.rowNumber) {
        List<double> matrixDet = List<double>.from(chunksToDouble);
        print('the determinant is ${matrixDeterminants(matrixDet)}');
      }
    }
  }

  void matrixSplit(List matrixValues) {
    print('matrixValues = $matrixValues');
    for (int z = 0; z < matrixValues.length; ++z) {
      stringToDouble.add(double.parse(matrixValues[z]));
    }
    print("string to be converted to double: ${stringToDouble}");
    // List<double?> chunksDouble = [];
    // var chunks = [];
    chunkSize = j;
    //splitting into allocated rows through splitting by columns
    for (var y = 0; y < stringToDouble.length; y += (chunkSize - 1)) {
      chunks.add(stringToDouble.sublist(
          y,
          y + chunkSize > stringToDouble.length
              ? matrixValues.length
              : y + (chunkSize - 1)));
    }
    //chunksToDouble = double.tryParse(chunks) as List<num>;
    print('column  size outside is ${chunkSize}');
    print('chunks double: ${chunksToDouble}');
    print('string to double is $stringToDouble');
    print("the split doubles are ${chunks}");
    matrixCalculations(chunks);
    chunks = [];
    matrixValues.clear();
    stringToDouble.clear();
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

    // @override
    // void dispose() {
    //   // Clean up the controller when the widget is disposed.
    //   for (final controller in _controller) {
    //     controller.dispose();
    //   }
    //   super.dispose();
    // }

    // final controller = TextEditingController();

    // setState(() {
    //   _controller.add(controller);
    // });

    // print('how many controller: {$controller}');
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
                        for (int x = 1; x <= ((i - 1) * (j - 1)); ++x) {
                          if (_controller[x].text.isEmpty) {
                            _controller[x].text = '0';
                            matrixValues.add(_controller[x].text.toString());
                            print('controller values are $_controller');
                          } else if (_controller[x].text.isNotEmpty) {
                            matrixValues.add(_controller[x].text.toString());
                            print('again my matrix values are $matrixValues');
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text(
                                        'Please go back and reload page')));
                          }
                        }
                        matrixSplit(matrixValues);
                        a = 0;
                      },
                    ),
                  )),
                ],
              ),
              Row(children: [
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 2.0),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10))),
                      padding: const EdgeInsets.fromLTRB(0, 14, 0, 10),
                      margin: const EdgeInsets.fromLTRB(25, 0, 25, 20),
                      child: Text(
                        outputMatrix,
                        style: GoogleFonts.poppins(
                            color: const Color.fromRGBO(48, 50, 52, 0.784),
                            fontSize: 16),
                        textAlign: TextAlign.center,
                      )),
                )
              ])
            ],
          )),
    );
  }
}
