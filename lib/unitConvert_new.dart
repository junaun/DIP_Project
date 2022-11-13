//import 'dart:ffi';
import 'package:calculator/diffrentiation.dart';
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

import 'package:math_keyboard/math_keyboard.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
    ),
  );
}

class UnitConversion extends StatefulWidget {
  const UnitConversion({Key? key}) : super(key: key);

  @override
  _UnitConversionState createState() => _UnitConversionState();
}

class DecimalTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final regEx = RegExp(r'^\d*\.?\d*');
    final String newString = regEx.stringMatch(newValue.text) ?? '';
    return newString == newValue.text ? newValue : oldValue;
  }
}

class _UnitConversionState extends State<UnitConversion> {
  late String dropdownvalue = "m";
  late String dropdownvalue2 = "m";
  late String dropdownvalue3 = 'm2';
  late String dropdownvalue4 = 'm2';
  late String dropdownvalue5 = 'm3';
  late String dropdownvalue6 = 'm3';

  late String dropdownvalue7 = 'C';
  late String dropdownvalue8 = 'C';
  late String dropdownvalue9 = 'DEC';
  late String dropdownvalue10 = 'DEC';

  String outputLength = "";
  String outputArea = "";
  String outputVolume = "";
  String outputTemp = "";
  String outputBase = "";

  var length;
  var finalLength;

  var area;
  var finalArea;

  var volume;
  var finalVolume;

  var temp;
  var finalTemp;

  var base;
  var finalBase;

  static String a = "ss";
  var lengthController = TextEditingController(text: a);
  final areaController = TextEditingController();
  final volumeController = TextEditingController();
  final TempController = TextEditingController();
  final BaseController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    lengthController.dispose();
    areaController.dispose();
    volumeController.dispose();
    TempController.dispose();
    BaseController.dispose();
    super.dispose();
  }

// LENGTH CALCULATE START
  void calculateLen(val) {
    length = double.parse(val);
    var newLength;

    if ((dropdownvalue == dropdownvalue2) &&
        (length.floor() == length.ceil() || length.floor() != length.ceil())) {
      setState(() {
        outputLength = lengthController.text;
      });
    } else if (dropdownvalue == 'um') {
      switch (dropdownvalue2) {
        case 'mm':
          newLength = length * 0.001;
          finalLength = num.parse(newLength.toStringAsExponential(10));
          break;
        case 'cm':
          newLength = length * 0.000001;
          finalLength = num.parse(newLength.toStringAsExponential(10));
          break;
        case 'inches':
          newLength = length * pow(3.937, -5);
          finalLength = num.parse(newLength.toStringAsExponential(10));
          break;
        case 'm':
          newLength = length * pow(10, -6);
          finalLength = num.parse(newLength.toStringAsExponential(10));
          break;

        case 'km':
          newLength = length * pow(10, -9);
          finalLength = newLength.toStringAsExponential(10);
          break;

        case 'miles':
          newLength = length * 6.2137 * pow(10, -10);
          finalLength = newLength.toStringAsExponential(10);
          break;
      }
      setState(() {
        outputLength = '$finalLength';
      });
    } else if (dropdownvalue == 'mm') {
      switch (dropdownvalue2) {
        case 'um':
          newLength = length * 1000;
          finalLength = newLength.toStringAsExponential(10);
          break;
        case 'cm':
          newLength = length * 0.1;
          finalLength = newLength.toStringAsExponential(10);
          break;
        case 'inches':
          newLength = length * pow(3.937, -3);
          finalLength = newLength.toStringAsExponential(10);
          break;
        case 'm':
          newLength = length * pow(10, -3);
          finalLength = newLength.toStringAsExponential(10);
          break;

        case 'km':
          newLength = length * pow(10, -6);
          finalLength = newLength.toStringAsExponential(10);
          break;

        case 'miles':
          newLength = length * 6.2137 * pow(10, -7);
          finalLength = newLength.toStringAsExponential(10);
          break;
      }
      setState(() {
        outputLength = '$finalLength';
      });
    } else if (dropdownvalue == 'cm') {
      switch (dropdownvalue2) {
        case 'um':
          newLength = length * 10000;
          finalLength = newLength.toStringAsExponential(10);
          break;
        case 'mm':
          newLength = length * 10;
          finalLength = newLength.toStringAsExponential(10);
          break;
        case 'inches':
          newLength = length * 0.393701;
          finalLength = newLength.toStringAsExponential(10);
          break;
        case 'm':
          newLength = length * 0.01;
          finalLength = newLength.toStringAsExponential(10);
          break;

        case 'km':
          newLength = length * pow(10, -5);
          finalLength = newLength.toStringAsExponential(10);
          break;

        case 'miles':
          newLength = length * 6.2137 * pow(10, -6);
          finalLength = newLength.toStringAsExponential(10);
          break;
      }
      setState(() {
        outputLength = '$finalLength';
      });
    } else if (dropdownvalue == 'm') {
      switch (dropdownvalue2) {
        case 'um':
          newLength = length * pow(10, 6);
          finalLength = newLength.toStringAsExponential(10);
          break;
        case 'mm':
          newLength = length * 1000;
          finalLength = newLength.toStringAsExponential(10);
          break;
        case 'inches':
          newLength = length * 39.3701;
          finalLength = newLength.toStringAsExponential(10);
          break;
        case 'cm':
          newLength = length * 100;
          finalLength = newLength.toStringAsExponential(10);
          break;

        case 'km':
          newLength = length * 0.001;
          finalLength = num.parse(newLength.toStringAsExponential(10));
          break;

        case 'miles':
          newLength = length * 0.000621371;
          finalLength = newLength.toStringAsExponential(10);
          break;
      }
      setState(() {
        outputLength = '$finalLength';
      });
    } else if (dropdownvalue == 'km') {
      switch (dropdownvalue2) {
        case 'um':
          newLength = length * pow(10, 9);
          finalLength = newLength.toStringAsExponential(10);
          break;
        case 'mm':
          newLength = length * pow(10, 6);
          finalLength = newLength.toStringAsExponential(10);
          break;
        case 'inches':
          newLength = length * 39370.1;
          finalLength = newLength.toStringAsExponential(10);
          break;
        case 'm':
          newLength = length * 1000;
          finalLength = newLength.toStringAsExponential(10);
          break;

        case 'cm':
          newLength = length * 100000;
          finalLength = newLength.toStringAsExponential(10);
          break;

        case 'miles':
          newLength = length * 0.621371;
          finalLength = newLength.toStringAsExponential(10);
          break;
      }
      setState(() {
        outputLength = '$finalLength';
      });
    } else if (dropdownvalue == 'inches') {
      switch (dropdownvalue2) {
        case 'um':
          newLength = length * 25400;
          finalLength = newLength.toStringAsExponential(10);
          break;
        case 'mm':
          newLength = length * 25.4;
          finalLength = newLength.toStringAsExponential(10);
          break;
        case 'cm':
          newLength = length * 2.54;
          finalLength = newLength.toStringAsExponential(10);
          break;
        case 'm':
          newLength = length * 0.0254;
          finalLength = newLength.toStringAsExponential(10);
          break;

        case 'km':
          newLength = length * 2.54 * pow(10, -5);
          finalLength = newLength.toStringAsExponential(10);
          break;

        case 'miles':
          newLength = length * 1.5783 * pow(10, -5);
          finalLength = newLength.toStringAsExponential(10);
          break;
      }
      setState(() {
        outputLength = '$finalLength';
      });
    } else if (dropdownvalue == 'miles') {
      switch (dropdownvalue2) {
        case 'um':
          newLength = length * 1.609 * pow(10, 9);
          finalLength = newLength.toStringAsExponential(10);
          break;
        case 'mm':
          newLength = length * 1.609 * pow(10, 6);
          finalLength = newLength.toStringAsExponential(10);
          break;
        case 'inches':
          newLength = length * 63360;
          finalLength = newLength.toStringAsExponential(10);
          break;
        case 'm':
          newLength = length * 1609.34;
          finalLength = newLength.toStringAsExponential(10);
          break;

        case 'km':
          newLength = length * 1.60934;
          finalLength = newLength.toStringAsExponential(10);
          break;

        case 'cm':
          newLength = length * 160934;
          finalLength = newLength.toStringAsExponential(10);
          break;
      }
      setState(() {
        outputLength = '$finalLength';
      });
    }
  }
  // LENGTH CALCULATE END

// AREA CALCULATE START
  void calculateArea(val) {
    area = double.parse(val);
    var newArea;

    if ((dropdownvalue3 == dropdownvalue4) &&
        (area.floor() == area.ceil() || area.floor() != area.ceil())) {
      setState(() {
        outputArea = areaController.text;
      });
    } else if (dropdownvalue3 == 'um2') {
      switch (dropdownvalue4) {
        case 'mm2':
          newArea = area * pow(10, -6);
          finalArea = newArea.toStringAsExponential(10);
          break;

        case 'cm2':
          newArea = area * pow(10, -8);
          finalArea = newArea.toStringAsExponential(10);
          break;

        case 'm2':
          newArea = area * pow(10, -12);
          finalArea = newArea.toStringAsExponential(10);
          break;

        case 'km2':
          newArea = area * pow(10, -18);
          finalArea = newArea.toStringAsExponential(10);
          break;

        case 'inches2':
          newArea = area * 1.55 * pow(10, -9);
          finalArea = newArea.toStringAsExponential(10);
          break;
      }
      setState(() {
        outputArea = '$finalArea';
      });
    } else if (dropdownvalue3 == 'cm2') {
      switch (dropdownvalue4) {
        case 'm2':
          newArea = area * 0.0001;
          finalArea = newArea.toStringAsExponential(10);
          break;

        case 'km2':
          newArea = area * pow(10, -10);
          finalArea = newArea.toStringAsExponential(10);
          break;

        case 'mm2':
          newArea = area * 100;
          finalArea = newArea.toStringAsExponential(10);
          break;

        case 'inches2':
          newArea = area * 0.155;
          finalArea = newArea.toStringAsExponential(10);
          break;

        case 'um2':
          newArea = area * pow(10, 8);
          finalArea = newArea.toStringAsExponential(10);
          break;
      }
      setState(() {
        outputArea = '$finalArea';
      });
    } else if (dropdownvalue3 == 'mm2') {
      switch (dropdownvalue4) {
        case 'm2':
          newArea = area * pow(10, -6);
          finalArea = newArea.toStringAsExponential(10);
          break;

        case 'km2':
          newArea = area * pow(10, -12);
          finalArea = newArea.toStringAsExponential(10);
          break;

        case 'cm2':
          newArea = area * 0.01;
          finalArea = newArea.toStringAsExponential(10);
          break;

        case 'inches2':
          newArea = area * 0.00155;
          finalArea = newArea.toStringAsExponential(10);
          break;

        case 'um2':
          newArea = area * 1000000;
          finalArea = newArea.toStringAsExponential(10);
          break;
      }
      setState(() {
        outputArea = '$finalArea';
      });
    } else if (dropdownvalue3 == 'm2') {
      switch (dropdownvalue4) {
        case 'cm2':
          newArea = area * 10000;
          finalArea = newArea.toStringAsExponential(10);
          break;

        case 'km2':
          newArea = area * pow(10, -6);
          finalArea = newArea.toStringAsExponential(10);
          break;

        case 'mm2':
          newArea = area * pow(10, 6);
          finalArea = newArea.toStringAsExponential(10);
          break;

        case 'inches2':
          newArea = area * 1550;
          finalArea = newArea.toStringAsExponential(10);
          break;

        case 'um2':
          newArea = area * pow(10, 12);
          finalArea = newArea.toStringAsExponential(10);
          break;
      }
      setState(() {
        outputArea = '$finalArea';
      });
    } else if (dropdownvalue3 == 'km2') {
      switch (dropdownvalue4) {
        case 'm2':
          newArea = area * pow(10, 6);
          finalArea = newArea.toStringAsExponential(10);
          break;

        case 'cm2':
          newArea = area * pow(10, 10);
          finalArea = newArea.toStringAsExponential(10);
          break;

        case 'mm2':
          newArea = area * pow(10, 12);
          finalArea = newArea.toStringAsExponential(10);
          break;

        case 'inches2':
          newArea = area * 1.55 * pow(10, 9);
          finalArea = newArea.toStringAsExponential(10);
          break;

        case 'um2':
          newArea = area * pow(10, 18);
          finalArea = newArea.toStringAsExponential(10);
          break;
      }
      setState(() {
        outputArea = '$finalArea';
      });
    } else if (dropdownvalue3 == 'inches2') {
      switch (dropdownvalue4) {
        case 'm2':
          newArea = area * 0.00064516;
          finalArea = newArea.toStringAsExponential(10);
          break;

        case 'km2':
          newArea = area * 6.4516 * pow(10, -10);
          finalArea = newArea.toStringAsExponential(10);
          break;

        case 'mm2':
          newArea = area * 645.16;
          finalArea = newArea.toStringAsExponential(10);
          break;

        case 'cm2':
          newArea = area * 6.4516;
          finalArea = newArea.toStringAsExponential(10);
          break;

        case 'um2':
          newArea = area * 6.452 * pow(10, 8);
          finalArea = newArea.toStringAsExponential(10);
          break;
      }
      setState(() {
        outputArea = '$finalArea';
      });
    }
  }
  // AREA CALUCALTE END

  // VOL CALCULATE START
  void calculateVol(val) {
    volume = double.parse(val);
    var newVol;

    if ((dropdownvalue5 == dropdownvalue6) &&
        (volume.floor() == volume.ceil() || volume.floor() != volume.ceil())) {
      setState(() {
        outputVolume = volumeController.text;
      });
    } else if (dropdownvalue5 == 'um3') {
      switch (dropdownvalue6) {
        case 'mm3':
          newVol = volume * pow(10, -9);
          finalVolume = newVol.toStringAsExponential(10);
          break;

        case 'cm3':
          newVol = volume * pow(10, -12);
          finalVolume = newVol.toStringAsExponential(10);
          break;

        case 'm3':
          newVol = volume * pow(10, -18);
          finalVolume = newVol.toStringAsExponential(10);
          break;

        case 'km3':
          newVol = volume * pow(10, -27);
          finalVolume = newVol.toStringAsExponential(10);
          break;

        case 'inches3':
          newVol = volume * 6.102237 * pow(10, -14);
          finalVolume = newVol.toStringAsExponential(10);
          break;
      }
      setState(() {
        outputVolume = '$finalVolume';
      });
    } else if (dropdownvalue5 == 'mm3') {
      switch (dropdownvalue6) {
        case 'um3':
          newVol = volume * pow(10, 9);
          finalVolume = newVol.toStringAsExponential(10);
          break;

        case 'cm3':
          newVol = volume * 0.001;
          finalVolume = newVol.toStringAsExponential(10);
          break;

        case 'm3':
          newVol = volume * pow(10, -9);
          finalVolume = newVol.toStringAsExponential(10);
          break;

        case 'km3':
          newVol = volume * pow(10, -18);
          finalVolume = newVol.toStringAsExponential(10);
          break;

        case 'inches3':
          newVol = volume * 6.10237 * pow(10, -5);
          finalVolume = newVol.toStringAsExponential(10);
          break;
      }
      setState(() {
        outputVolume = '$finalVolume';
      });
    } else if (dropdownvalue5 == 'cm3') {
      switch (dropdownvalue6) {
        case 'um3':
          newVol = volume * pow(10, 12);
          finalVolume = newVol.toStringAsExponential(10);
          break;

        case 'mm3':
          newVol = volume * 1000;
          finalVolume = newVol.toStringAsExponential(10);
          break;

        case 'm3':
          newVol = volume * pow(10, -6);
          finalVolume = newVol.toStringAsExponential(10);
          break;

        case 'km3':
          newVol = volume * pow(10, -15);
          finalVolume = newVol.toStringAsExponential(10);
          break;

        case 'inches3':
          newVol = volume * 0.0610237;
          finalVolume = newVol.toStringAsExponential(10);
          break;
      }
      setState(() {
        outputVolume = '$finalVolume';
      });
    } else if (dropdownvalue5 == 'm3') {
      switch (dropdownvalue6) {
        case 'um3':
          newVol = volume * pow(10, 18);
          finalVolume = newVol.toStringAsExponential(10);
          break;

        case 'cm3':
          newVol = volume * 1000000;
          finalVolume = newVol.toStringAsExponential(10);
          break;

        case 'mm3':
          newVol = volume * pow(10, 9);
          finalVolume = newVol.toStringAsExponential(10);
          break;

        case 'km3':
          newVol = volume * pow(10, -9);
          finalVolume = newVol.toStringAsExponential(10);
          break;

        case 'inches3':
          newVol = volume * 61023.7;
          finalVolume = newVol.toStringAsExponential(10);
          break;
      }
      setState(() {
        outputVolume = '$finalVolume';
      });
    } else if (dropdownvalue5 == 'km3') {
      switch (dropdownvalue6) {
        case 'um3':
          newVol = volume * pow(10, 27);
          finalVolume = newVol.toStringAsExponential(10);
          break;

        case 'cm3':
          newVol = volume * pow(10, 15);
          finalVolume = newVol.toStringAsExponential(10);
          break;

        case 'm3':
          newVol = volume * pow(10, 9);
          finalVolume = newVol.toStringAsExponential(10);
          break;

        case 'mm3':
          newVol = volume * pow(10, 18);
          finalVolume = newVol.toStringAsExponential(10);
          break;

        case 'inches3':
          newVol = volume * 6.102 * pow(10, 13);
          finalVolume = newVol.toStringAsExponential(10);
          break;
      }
      setState(() {
        outputVolume = '$finalVolume';
      });
    } else if (dropdownvalue5 == 'inches3') {
      switch (dropdownvalue6) {
        case 'um3':
          newVol = volume * 1.639 * pow(10, 13);
          finalVolume = newVol.toStringAsExponential(10);
          break;

        case 'cm3':
          newVol = volume * 16.3871;
          finalVolume = newVol.toStringAsExponential(10);
          break;

        case 'm3':
          newVol = volume * 1.63871 * pow(10, -5);
          finalVolume = newVol.toStringAsExponential(10);
          break;

        case 'km3':
          newVol = volume * 1.63871 * pow(10, -14);
          finalVolume = newVol.toStringAsExponential(10);
          break;

        case 'mm3':
          newVol = volume * 16387.1;
          finalVolume = newVol.toStringAsExponential(10);
          break;
      }
      setState(() {
        outputVolume = '$finalVolume';
      });
    }
  }
  // VOL CALCULATE END

  // TEMP CALCULATE START
  void calculateTemp(val) {
    temp = double.parse(val);
    var newTemp;

    if ((dropdownvalue7 == dropdownvalue8) &&
        (temp.floor() == temp.ceil() || temp.floor() != temp.ceil())) {
      setState(() {
        outputTemp = TempController.text;
      });
    } else if (dropdownvalue7 == 'C') {
      switch (dropdownvalue8) {
        case 'K':
          newTemp = temp + 273.15;
          finalTemp = newTemp.toStringAsFixed(2);
          break;

        case 'F':
          newTemp = (temp * 9 / 5) + 32;
          finalTemp = newTemp.toStringAsFixed(2);
          break;
      }
      setState(() {
        outputTemp = '$finalTemp';
      });
    } else if (dropdownvalue7 == 'K') {
      switch (dropdownvalue8) {
        case 'C':
          newTemp = temp - 273.15;
          finalTemp = newTemp.toStringAsFixed(2);
          break;

        case 'F':
          newTemp = ((temp - 273.15) * 9 / 5) + 32;
          finalTemp = newTemp.toStringAsFixed(2);
          break;
      }
      setState(() {
        outputTemp = '$finalTemp';
      });
    }
  }
  // TEMP CALCULATE END

// NUMBER SYSTEM CALCULATE START
  void calculateBase(val) {
    base = int.parse(val);
    var newBase;

    if ((dropdownvalue9) == (dropdownvalue10)) {
      setState(() {
        outputBase = BaseController.text;
      });
    } else if (dropdownvalue9 == 'DEC') {
      switch (dropdownvalue10) {
        case 'BIN':
          finalBase = base.toRadixString(2);
          break;

        case 'OCT':
          finalBase = base.toRadixString(8);
          break;

        case 'HEX':
          finalBase = base.toRadixString(16);
          break;
      }
      setState(() {
        outputBase = '$finalBase';
      });
    } else if (dropdownvalue9 == 'BIN') {
      switch (dropdownvalue10) {
        case 'DEC':
          finalBase = int.parse("base", radix: 2).toRadixString(10);
          break;

        case 'OCT':
          finalBase = base.toRadixString(8);
          break;

        case 'HEX':
          finalBase = base.toRadixString(16);
          break;
      }
      setState(() {
        outputBase = '$finalBase';
      });
    }
  }

  //dropdowncallback LENGTH START
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
  //dropdowncallback LENGTH END

  //Dropdowncallback AREA START
  void dropdownCallback3(String? selectedValue3) {
    if (selectedValue3 is String) {
      setState(() {
        dropdownvalue3 = selectedValue3;
      });
    }
  }

  void dropdownCallback4(String? selectedValue4) {
    if (selectedValue4 is String) {
      setState(() {
        dropdownvalue4 = selectedValue4;
      });
    }
  }
  //Dropdowncallback AREA END

  //Dropdowncallback VOLUME START
  void dropdownCallback5(String? selectedValue5) {
    if (selectedValue5 is String) {
      setState(() {
        dropdownvalue5 = selectedValue5;
      });
    }
  }

  void dropdownCallback6(String? selectedValue6) {
    if (selectedValue6 is String) {
      setState(() {
        dropdownvalue6 = selectedValue6;
      });
    }
  }
  //Dropdowncallback VOLUME END

// DROPDOWNCALLBACK TEMP FRONT
  void dropdownCallback7(String? selectedValue7) {
    if (selectedValue7 is String) {
      setState(() {
        dropdownvalue7 = selectedValue7;
      });
    }
  }

  void dropdownCallback8(String? selectedValue8) {
    if (selectedValue8 is String) {
      setState(() {
        dropdownvalue8 = selectedValue8;
      });
    }
  }
  // DROPDOWNCALLBACK TEMP BACK

  // DROPDOWNCALLBACK BIN/DEC/HEX FRONT
  void dropdownCallback9(String? selectedValue9) {
    if (selectedValue9 is String) {
      setState(() {
        dropdownvalue9 = selectedValue9;
      });
    }
  }

  void dropdownCallback10(String? selectedValue10) {
    if (selectedValue10 is String) {
      setState(() {
        dropdownvalue10 = selectedValue10;
      });
    }
  }
  // DROPDOWNCALLBACK BIN/DEC/HEX BACK

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("um"), value: "um"),
      const DropdownMenuItem(child: Text("mm"), value: "mm"),
      const DropdownMenuItem(child: Text("cm"), value: "cm"),
      const DropdownMenuItem(child: Text("m"), value: "m"),
      const DropdownMenuItem(child: Text("km"), value: "km"),
      const DropdownMenuItem(child: Text("in."), value: "inches"),
      const DropdownMenuItem(child: Text("Miles"), value: "miles"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownItems2 {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("um\u00B2"), value: "um2"),
      const DropdownMenuItem(child: Text("mm\u00B2"), value: "mm2"),
      const DropdownMenuItem(child: Text("cm\u00B2"), value: "cm2"),
      const DropdownMenuItem(child: Text("m\u00B2"), value: "m2"),
      const DropdownMenuItem(child: Text("km\u00B2"), value: "km2"),
      const DropdownMenuItem(child: Text("inches\u00B2"), value: "inches2"),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get dropdownItems3 {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("um\u00B3"), value: "um3"),
      const DropdownMenuItem(child: Text("mm\u00B3"), value: "mm3"),
      const DropdownMenuItem(child: Text("cm\u00B3"), value: "cm3"),
      const DropdownMenuItem(child: Text("m\u00B3"), value: "m3"),
      const DropdownMenuItem(child: Text("km\u00B3"), value: "km3"),
      const DropdownMenuItem(child: Text("inches\u00B3"), value: "inches3"),
    ];
    return menuItems;
  }

// TEMPERATURE
  List<DropdownMenuItem<String>> get dropdownItems4 {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("\u2103"), value: "C"),
      const DropdownMenuItem(child: Text("\u2109"), value: "F"),
      const DropdownMenuItem(child: Text("\u212A"), value: "K"),
    ];
    return menuItems;
  }

// Dec / Hex / Binary
  List<DropdownMenuItem<String>> get dropdownItems5 {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("DEC"), value: "DEC"),
      const DropdownMenuItem(child: Text("BIN"), value: "BIN"),
      const DropdownMenuItem(child: Text("OCT"), value: "OCT"),
      const DropdownMenuItem(child: Text("HEX"), value: "HEX"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
              title: const Text("UNIT CONVERSION"),
              centerTitle: true,
              bottom: const TabBar(
                isScrollable: true,
                tabs: [
                  Tab(text: "Geometric"),
                  Tab(text: "Temperature"),
                  Tab(text: "Number System"),
                ],
              )),
          body: TabBarView(
            children: [
              /* TAB INFO SEPARATES WITH A COMMA*/
              Row(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const Padding(
                              padding: EdgeInsets.fromLTRB(20, 5, 20, 20)),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(25, 5, 20, 5),
                                    child: Text(
                                      'Length',
                                      style: GoogleFonts.poppins(
                                          color: const Color.fromARGB(
                                              200, 48, 50, 52),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              //width: 340,
                              Expanded(
                                  child: Container(
                                // margin: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                                // color: Colors.amber,
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 15),

                                child: TextFormField(
                                  maxLength: 20,
                                  controller: lengthController,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                    decimal: true,
                                    signed: true,
                                  ),
                                  inputFormatters: [
                                    DecimalTextInputFormatter(),
                                  ],
                                  decoration: const InputDecoration(
                                      labelText: 'Enter a number',
                                      hintStyle: TextStyle(fontSize: 10),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)))),
                                ),
                              )),
                            ],
                          ),

                          //ROW 2!!

                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(25, 0, 20, 0),
                                    child: Text(
                                      'From',
                                      style: GoogleFonts.poppins(
                                          color: const Color.fromARGB(
                                              200, 48, 50, 52),
                                          fontSize: 15),
                                    )),
                              ),
                              Expanded(
                                child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(25, 0, 20, 0),
                                    child: Text(
                                      'To',
                                      style: GoogleFonts.poppins(
                                          color: const Color.fromARGB(
                                              200, 48, 50, 52),
                                          fontSize: 15),
                                    )),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 10),
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blueAccent),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0)),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 10, 10, 10),
                                            child: DropdownButton2(
                                              items: dropdownItems,
                                              value: dropdownvalue,
                                              onChanged: dropdownCallback,
                                              dropdownMaxHeight: 200,
                                              iconSize: 20,
                                              isDense: true,
                                              isExpanded: true,
                                              iconEnabledColor: Colors.blue,
                                            )),
                                      ))),
                              Expanded(
                                  child: Container(
                                      //DropDown Button RIGHT
                                      margin: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 10),
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      decoration: BoxDecoration(
                                        //color: Colors.amber,
                                        border: Border.all(
                                            color: Colors.blueAccent),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0)),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 10, 10, 10),
                                            child: DropdownButton2(
                                              items: dropdownItems,
                                              value: dropdownvalue2,
                                              onChanged: dropdownCallback2,
                                              dropdownMaxHeight: 200,
                                              iconSize: 20,
                                              isDense: true,
                                              isExpanded: true,
                                              iconEnabledColor: Colors.blue,
                                            )),
                                      )))
                            ],
                          ),

                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 5, 15, 5),
                                    width:
                                        MediaQuery.of(context).size.width * .95,
                                    child: Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.deepPurple,
                                            padding: const EdgeInsets.fromLTRB(
                                                5, 10, 5, 10),
                                            textStyle:
                                                const TextStyle(fontSize: 20)),
                                        child: const Text(('Convert Now!')),
                                        onPressed: () {
                                          if (lengthController.text.isEmpty) {
                                            lengthController.dispose;
                                            outputLength = '';
                                          } else {
                                            calculateLen(lengthController.text);
                                          }
                                          FocusScopeNode currentFocus =
                                              FocusScope.of(context);
                                          if (!currentFocus.hasPrimaryFocus) {
                                            currentFocus.unfocus();
                                          }
                                        },
                                      ),
                                    )),
                              ]),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(20, 10, 0, 0),
                                  child: Text(
                                    'Output Value: ',
                                    style: GoogleFonts.poppins(
                                        color: const Color.fromARGB(
                                            200, 48, 50, 52),
                                        fontSize: 15),
                                  ),
                                  // decoration: BoxDecoration(),
                                ),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blue, width: 2.0),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 14, 0, 10),
                                    margin:
                                        const EdgeInsets.fromLTRB(25, 0, 0, 20),
                                    child: Text(
                                      outputLength,
                                      style: GoogleFonts.poppins(
                                          color: const Color.fromRGBO(
                                              48, 50, 52, 0.784),
                                          fontSize: 16),
                                      textAlign: TextAlign.center,
                                    )),
                              ),
                              Container(
                                //Copy ICON
                                //color: Colors.amber,
                                margin: const EdgeInsets.fromLTRB(20, 0, 15, 0),
                                padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                child: TextButton.icon(
                                  label: const Text(''),
                                  icon: const Icon(
                                    Icons.copy,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    Clipboard.setData(
                                            ClipboardData(text: outputLength))
                                        .then((_) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  'Copied to your clipboard !')));
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),

//AREA FORMATS
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        25, 25, 20, 5),
                                    child: Text(
                                      'Area',
                                      style: GoogleFonts.poppins(
                                          color: const Color.fromARGB(
                                              200, 48, 50, 52),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ],
                          ),

                          Row(
                            children: [
                              //width: 340,
                              Expanded(
                                  child: Container(
                                // margin: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                                // color: Colors.amber,
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 15),

                                child: TextFormField(
                                  onChanged: (value) {
                                    setState(() {
                                      lengthController.text =
                                          lengthController.text.substring(0, 2);
                                    });
                                  },
                                  maxLength: 20,
                                  controller: areaController,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                    decimal: true,
                                    signed: true,
                                  ),
                                  inputFormatters: [
                                    DecimalTextInputFormatter(),
                                    FilteringTextInputFormatter.deny(
                                        RegExp(r'[\s\,[\.\.]]')),
                                    FilteringTextInputFormatter.allow(
                                        // RegExp(r'[1-9\.\d*\d+\-]')
                                        RegExp(r'[-\d+\.\d+?]')),
                                    //FIX THIS LINE. NEED TO ALLOW DECIMAL
                                  ],
                                  decoration: const InputDecoration(
                                      labelText: 'Enter a number',
                                      hintStyle: TextStyle(fontSize: 10),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)))),
                                ),
                              )),
                            ],
                          ),

                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(25, 0, 20, 0),
                                    child: Text(
                                      'From',
                                      style: GoogleFonts.poppins(
                                          color: const Color.fromARGB(
                                              200, 48, 50, 52),
                                          fontSize: 15),
                                    )),
                              ),
                              Expanded(
                                child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(25, 0, 20, 0),
                                    child: Text(
                                      'To',
                                      style: GoogleFonts.poppins(
                                          color: const Color.fromARGB(
                                              200, 48, 50, 52),
                                          fontSize: 15),
                                    )),
                              ),
                            ],
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 10),
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blueAccent),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0)),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 10, 10, 10),
                                            child: DropdownButton2(
                                              dropdownMaxHeight: 200,
                                              items: dropdownItems2,
                                              value: dropdownvalue3,
                                              onChanged: dropdownCallback3,
                                              iconSize: 20,
                                              isDense: true,
                                              isExpanded: true,
                                              iconEnabledColor: Colors.blue,
                                            )),
                                      ))),
                              Expanded(
                                  child: Container(
                                      //DropDown Button RIGHT
                                      margin: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 10),
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      decoration: BoxDecoration(
                                        //color: Colors.amber,
                                        border: Border.all(
                                            color: Colors.blueAccent),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0)),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 10, 10, 10),
                                            child: DropdownButton2(
                                              dropdownMaxHeight: 200,
                                              items: dropdownItems2,
                                              value: dropdownvalue4,
                                              onChanged: dropdownCallback4,
                                              iconSize: 20,
                                              isDense: true,
                                              isExpanded: true,
                                              iconEnabledColor: Colors.blue,
                                            )),
                                      )))
                            ],
                          ),

                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                      padding: const EdgeInsets.fromLTRB(
                                          22, 5, 22, 5),
                                      width: MediaQuery.of(context).size.width *
                                          .95,
                                      child: Expanded(
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  Colors.deepOrange,
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      20, 10, 20, 10),
                                              textStyle: const TextStyle(
                                                  fontSize: 20)),
                                          child: const Text(('Convert Now!')),
                                          onPressed: () {
                                            if (areaController.text.isEmpty) {
                                              areaController.dispose;
                                              outputArea = '';
                                            }
                                            calculateArea(areaController.text);
                                            FocusScopeNode currentFocus =
                                                FocusScope.of(context);
                                            if (!currentFocus.hasPrimaryFocus) {
                                              currentFocus.unfocus();
                                            }
                                          },
                                        ),
                                      )),
                                ),
                              ]),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(20, 15, 0, 0),
                                  child: Text(
                                    'Output Value: ',
                                    style: GoogleFonts.poppins(
                                        color: const Color.fromARGB(
                                            200, 48, 50, 52),
                                        fontSize: 15),
                                  ),
                                  // decoration: BoxDecoration(),
                                ),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blue, width: 2.0),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 14, 0, 10),
                                    margin:
                                        const EdgeInsets.fromLTRB(25, 0, 0, 20),
                                    child: Text(
                                      outputArea,
                                      style: GoogleFonts.poppins(
                                          color: const Color.fromRGBO(
                                              48, 50, 52, 0.784),
                                          fontSize: 16),
                                      textAlign: TextAlign.center,
                                    )),
                              ),
                              Container(
                                //Copy ICON
                                //color: Colors.amber,
                                margin: const EdgeInsets.fromLTRB(20, 0, 15, 0),
                                padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                child: TextButton.icon(
                                  label: const Text(''),
                                  icon: const Icon(
                                    Icons.copy,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    Clipboard.setData(
                                            ClipboardData(text: outputArea))
                                        .then((_) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  'Copied to your clipboard !')));
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
//VOLUME
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        25, 25, 20, 5),
                                    child: Text(
                                      'Volume',
                                      style: GoogleFonts.poppins(
                                          color: const Color.fromARGB(
                                              200, 48, 50, 52),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              //width: 340,
                              Expanded(
                                  child: Container(
                                // margin: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                                // color: Colors.amber,
                                padding:
                                    const EdgeInsets.fromLTRB(20, 10, 20, 15),

                                child: TextFormField(
                                  maxLength: 20,
                                  controller: volumeController,
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                    decimal: true,
                                    signed: true,
                                  ),
                                  inputFormatters: [
                                    DecimalTextInputFormatter(),
                                    FilteringTextInputFormatter.deny(
                                        RegExp(r'[\s\,[\.\.]]')),
                                  ],
                                  decoration: const InputDecoration(
                                      labelText: 'Enter a number',
                                      hintStyle: TextStyle(fontSize: 10),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10.0)))),
                                ),
                              )),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(25, 0, 20, 0),
                                    child: Text(
                                      'From',
                                      style: GoogleFonts.poppins(
                                          color: const Color.fromARGB(
                                              200, 48, 50, 52),
                                          fontSize: 15),
                                    )),
                              ),
                              Expanded(
                                child: Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(25, 0, 20, 0),
                                    child: Text(
                                      'To',
                                      style: GoogleFonts.poppins(
                                          color: const Color.fromARGB(
                                              200, 48, 50, 52),
                                          fontSize: 15),
                                    )),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 10),
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blueAccent),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0)),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 10, 10, 10),
                                            child: DropdownButton2(
                                              items: dropdownItems3,
                                              value: dropdownvalue5,
                                              onChanged: dropdownCallback5,
                                              dropdownMaxHeight: 200,
                                              iconSize: 20,
                                              isDense: true,
                                              isExpanded: true,
                                              iconEnabledColor: Colors.blue,
                                            )),
                                      ))),
                              Expanded(
                                  child: Container(
                                      //DropDown Button RIGHT
                                      margin: const EdgeInsets.fromLTRB(
                                          20, 0, 20, 10),
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                      decoration: BoxDecoration(
                                        //color: Colors.amber,
                                        border: Border.all(
                                            color: Colors.blueAccent),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10.0)),
                                      ),
                                      child: DropdownButtonHideUnderline(
                                        child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                10, 10, 10, 10),
                                            child: DropdownButton2(
                                              items: dropdownItems3,
                                              value: dropdownvalue6,
                                              dropdownMaxHeight: 200,
                                              onChanged: dropdownCallback6,
                                              iconSize: 20,
                                              isDense: true,
                                              isExpanded: true,
                                              iconEnabledColor: Colors.blue,
                                            )),
                                      ))),
                            ],
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(15, 5, 15, 5),
                                    width:
                                        MediaQuery.of(context).size.width * .95,
                                    child: Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.deepPurple,
                                            padding: const EdgeInsets.fromLTRB(
                                                15, 10, 15, 10),
                                            textStyle:
                                                const TextStyle(fontSize: 20)),
                                        child: const Text(('Convert Now!')),
                                        onPressed: () {
                                          calculateVol(volumeController.text);
                                          FocusScopeNode currentFocus =
                                              FocusScope.of(context);
                                          if (!currentFocus.hasPrimaryFocus) {
                                            currentFocus.unfocus();
                                          }
                                        },
                                      ),
                                    )),
                              ]),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                child: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(20, 10, 0, 0),
                                  child: Text(
                                    'Output Value: ',
                                    style: GoogleFonts.poppins(
                                        color: const Color.fromARGB(
                                            200, 48, 50, 52),
                                        fontSize: 15),
                                  ),
                                  // decoration: BoxDecoration(),
                                ),
                              )
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blue, width: 2.0),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10))),
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 14, 0, 10),
                                    margin:
                                        const EdgeInsets.fromLTRB(25, 0, 0, 50),
                                    child: Text(
                                      outputVolume,
                                      style: GoogleFonts.poppins(
                                          color: const Color.fromRGBO(
                                              48, 50, 52, 0.784),
                                          fontSize: 16),
                                      textAlign: TextAlign.center,
                                    )),
                              ),
                              Container(
                                //Copy ICON
                                //color: Colors.amber,
                                margin: const EdgeInsets.fromLTRB(20, 0, 15, 0),
                                padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                child: TextButton.icon(
                                  label: const Text(''),
                                  icon: const Icon(
                                    Icons.copy,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    Clipboard.setData(
                                            ClipboardData(text: outputVolume))
                                        .then((_) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  'Copied to your clipboard !')));
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ), //Above is for tab 1

              //THIS IS FOR TAB 2
              Row(children: [
                Expanded(
                    child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.fromLTRB(20, 5, 20, 20)),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(25, 5, 20, 5),
                                child: Text(
                                  'Temperature',
                                  style: GoogleFonts.poppins(
                                      color:
                                          const Color.fromARGB(200, 48, 50, 52),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          // margin: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                          // color: Colors.amber,
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),

                          child: TextFormField(
                            maxLength: 20,
                            controller: TempController,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                              signed: true,
                            ),
                            inputFormatters: [
                              DecimalTextInputFormatter(),
                              FilteringTextInputFormatter.deny(
                                  RegExp(r'[\s\,[\.\.]]')),
                            ],
                            decoration: const InputDecoration(
                                labelText: 'Enter a temperature value',
                                hintStyle: TextStyle(fontSize: 10),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0)))),
                          ),
                        )),
                      ],
                    ),
//ROW for tab 2, from-to
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              padding: const EdgeInsets.fromLTRB(25, 0, 20, 0),
                              child: Text(
                                'From',
                                style: GoogleFonts.poppins(
                                    color:
                                        const Color.fromARGB(200, 48, 50, 52),
                                    fontSize: 15),
                              )),
                        ),
                        Expanded(
                          child: Container(
                              padding: const EdgeInsets.fromLTRB(25, 0, 20, 0),
                              child: Text(
                                'To',
                                style: GoogleFonts.poppins(
                                    color:
                                        const Color.fromARGB(200, 48, 50, 52),
                                    fontSize: 15),
                              )),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Container(
                                margin:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 10),
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0)),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 10, 10, 10),
                                      child: DropdownButton2(
                                        items: dropdownItems4,
                                        value: dropdownvalue7,
                                        onChanged: dropdownCallback7,
                                        dropdownMaxHeight: 200,
                                        iconSize: 20,
                                        isDense: true,
                                        isExpanded: true,
                                        iconEnabledColor: Colors.blue,
                                      )),
                                ))),
                        Expanded(
                            child: Container(
                                //DropDown Button RIGHT
                                margin:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 10),
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                decoration: BoxDecoration(
                                  //color: Colors.amber,
                                  border: Border.all(color: Colors.blueAccent),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0)),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 10, 10, 10),
                                      child: DropdownButton2(
                                        items: dropdownItems4,
                                        value: dropdownvalue8,
                                        onChanged: dropdownCallback8,
                                        dropdownMaxHeight: 200,
                                        iconSize: 20,
                                        isDense: true,
                                        isExpanded: true,
                                        iconEnabledColor: Colors.blue,
                                      )),
                                )))
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Container(
                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                          width: MediaQuery.of(context).size.width * .95,
                          child: Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurple,
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 10, 15, 10),
                                  textStyle: const TextStyle(fontSize: 20)),
                              child: const Text(('Convert Now!')),
                              onPressed: () {
                                calculateTemp(TempController.text);
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);
                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                              },
                            ),
                          )),
                    ]),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                            child: Text(
                              'Output Value: ',
                              style: GoogleFonts.poppins(
                                  color: const Color.fromARGB(200, 48, 50, 52),
                                  fontSize: 15),
                            ),
                            // decoration: BoxDecoration(),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.blue, width: 2.0),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              padding: const EdgeInsets.fromLTRB(0, 14, 0, 10),
                              margin: const EdgeInsets.fromLTRB(25, 0, 0, 50),
                              child: Text(
                                outputTemp,
                                style: GoogleFonts.poppins(
                                    color:
                                        const Color.fromRGBO(48, 50, 52, 0.784),
                                    fontSize: 16),
                                textAlign: TextAlign.center,
                              )),
                        ),
                        Container(
                          //Copy ICON
                          //color: Colors.amber,
                          margin: const EdgeInsets.fromLTRB(20, 0, 15, 0),
                          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: TextButton.icon(
                            label: const Text(''),
                            icon: const Icon(
                              Icons.copy,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Clipboard.setData(ClipboardData(text: outputTemp))
                                  .then((_) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Copied to your clipboard !')));
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ))
              ]),
              // Thats the end for Tab 2

              // Tab 3
              Row(children: [
                Expanded(
                    child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.fromLTRB(20, 5, 20, 20)),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                                padding:
                                    const EdgeInsets.fromLTRB(25, 5, 20, 5),
                                child: Text(
                                  'Number System',
                                  style: GoogleFonts.poppins(
                                      color:
                                          const Color.fromARGB(200, 48, 50, 52),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          // margin: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                          // color: Colors.amber,
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),

                          child: TextFormField(
                            onTap: () {
                              setState(() {
                                lengthController.text = "updated value";
                              });
                            },
                            maxLength: 20,
                            controller: BaseController,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                              signed: true,
                            ),
                            inputFormatters: [
                              DecimalTextInputFormatter(),
                              FilteringTextInputFormatter.deny(
                                  RegExp(r'[\s\,[\.\.]]')),
                            ],
                            decoration: const InputDecoration(
                                labelText: 'Enter a value',
                                hintStyle: TextStyle(fontSize: 10),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10.0)))),
                          ),
                        )),
                      ],
                    ),
//ROW for tab 3, from-to
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                              padding: const EdgeInsets.fromLTRB(25, 0, 20, 0),
                              child: Text(
                                'From',
                                style: GoogleFonts.poppins(
                                    color:
                                        const Color.fromARGB(200, 48, 50, 52),
                                    fontSize: 15),
                              )),
                        ),
                        Expanded(
                          child: Container(
                              padding: const EdgeInsets.fromLTRB(25, 0, 20, 0),
                              child: Text(
                                'To',
                                style: GoogleFonts.poppins(
                                    color:
                                        const Color.fromARGB(200, 48, 50, 52),
                                    fontSize: 15),
                              )),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                            child: Container(
                                margin:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 10),
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueAccent),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0)),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 10, 10, 10),
                                      child: DropdownButton2(
                                        items: dropdownItems5,
                                        value: dropdownvalue9,
                                        onChanged: dropdownCallback9,
                                        dropdownMaxHeight: 200,
                                        iconSize: 20,
                                        isDense: true,
                                        isExpanded: true,
                                        iconEnabledColor: Colors.blue,
                                      )),
                                ))),
                        Expanded(
                            child: Container(
                                //DropDown Button RIGHT
                                margin:
                                    const EdgeInsets.fromLTRB(20, 0, 20, 10),
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                decoration: BoxDecoration(
                                  //color: Colors.amber,
                                  border: Border.all(color: Colors.blueAccent),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10.0)),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 10, 10, 10),
                                      child: DropdownButton2(
                                        items: dropdownItems5,
                                        value: dropdownvalue10,
                                        onChanged: dropdownCallback10,
                                        dropdownMaxHeight: 200,
                                        iconSize: 20,
                                        isDense: true,
                                        isExpanded: true,
                                        iconEnabledColor: Colors.blue,
                                      )),
                                )))
                      ],
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Container(
                          padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                          width: MediaQuery.of(context).size.width * .95,
                          child: Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepPurple,
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 10, 15, 10),
                                  textStyle: const TextStyle(fontSize: 20)),
                              child: const Text(('Convert Now!')),
                              onPressed: () {
                                calculateBase(BaseController.text);
                                FocusScopeNode currentFocus =
                                    FocusScope.of(context);
                                if (!currentFocus.hasPrimaryFocus) {
                                  currentFocus.unfocus();
                                }
                              },
                            ),
                          )),
                    ]),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(20, 10, 0, 0),
                            child: Text(
                              'Output Value: ',
                              style: GoogleFonts.poppins(
                                  color: const Color.fromARGB(200, 48, 50, 52),
                                  fontSize: 15),
                            ),
                            // decoration: BoxDecoration(),
                          ),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.blue, width: 2.0),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              padding: const EdgeInsets.fromLTRB(0, 14, 0, 10),
                              margin: const EdgeInsets.fromLTRB(25, 0, 0, 50),
                              child: Text(
                                outputBase,
                                style: GoogleFonts.poppins(
                                    color:
                                        const Color.fromRGBO(48, 50, 52, 0.784),
                                    fontSize: 16),
                                textAlign: TextAlign.center,
                              )),
                        ),
                        Container(
                          //Copy ICON
                          //color: Colors.amber,
                          margin: const EdgeInsets.fromLTRB(20, 0, 15, 0),
                          padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                          child: TextButton.icon(
                            label: const Text(''),
                            icon: const Icon(
                              Icons.copy,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              Clipboard.setData(ClipboardData(text: outputBase))
                                  .then((_) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            'Copied to your clipboard !')));
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ))
              ]),
            ],
          )),
    );
  }
}
