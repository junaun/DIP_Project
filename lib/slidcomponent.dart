import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:calculator/backend/mathbox.dart';
import 'package:calculator/backend/result.dart';
import 'package:calculator/backend/matrixbutton.dart';
import 'package:calculator/backend/keyboard.dart';
import 'package:calculator/backend/mathmodel.dart';
import 'package:calculator/backend/settingpage.dart';

class SlidComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Consumer<CalculationMode>(
          builder: (context, mathMode, _) {
            //final mode = Provider.of<CalculationMode>(context, listen: false);
            //mode.changeMode(Mode.Basic);
            switch (mathMode.value) {
              case Mode.Basic:
                //return Text("hey");
                return Result();
                break;
              case Mode.Matrix:
                return MatrixButton();
                break;
              // case Mode.Function:
              //   return TextButton(
              //     child: Text('Analyze'),
              //     onPressed: () {
              //       //Navigator.push(
              //       // context,
              //       //MaterialPageRoute(builder: (context) => FunctionPage()),
              //       //);
              //     },
              //   );
              //break;
              default:
                throw 'Error';
            }
          },
        ),
        Consumer<CalculationMode>(
          builder: (context, mathMode, _) => mathMode.value != Mode.Matrix
              ? ExpandKeyBoard()
              : SizedBox(
                  height: 0.0,
                ),
        ),
      ],
    );
  }
}
