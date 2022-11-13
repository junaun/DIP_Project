import 'dart:math';
import 'package:calculator/backend/keyboardProvider.dart';
import 'package:calculator/services/ColorProvider.dart';
import 'package:calculator/services/ConstantProvider.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:calculator/backend/keyboard.dart';
import 'package:calculator/backend/mathbox.dart';
import 'package:calculator/backend/settingpage.dart';
import 'package:calculator/backend/mathmodel.dart';
import 'package:flutter_math_fork/flutter_math.dart';

const AspectRatio = 1.2;

class KeyBoard2 extends StatelessWidget {
  @override
  List<Widget> _buildLowButton(
      MathBoxController mathBoxController, BuildContext context) {
    List<Widget> button = [];
    // for (MapEntry<String, double> constant
    //     in Provider.of<KeyboardProvider>(context, listen: false)
    //         .constants
    //         .entries) {
    //   String name = constant.key;
    //   double val = constant.value;
    //   button.add(MyButton(
    //     child: Text('$name'),
    //     onPressed: () {
    //       mathBoxController.addExpression(val.toString());
    //     },
    //   ));
    // }
    for (var i = 0; i < 10; i++) {
      button.add(TextButton(
        child: Text(Provider.of<ConstantProvider>(context, listen: false)
            .allUsers
            .elementAt(i)
            .unit),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
          foregroundColor: MaterialStateProperty.all(Colors.black),
        ),
        onPressed: () {
          String value = Provider.of<ConstantProvider>(context, listen: false)
              .allUsers
              .elementAt(i)
              .value;
          mathBoxController.addString('$value');
        },
      ));
    }

    button.add(TextButton(
      child: Math.tex("nroots", textStyle: TextStyle(fontSize: 20)),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
        foregroundColor: MaterialStateProperty.all(Colors.black),
      ),
      onPressed: () {
        mathBoxController.addString('nroots');
        mathBoxController.addExpression('(');
        mathBoxController.addExpression(')');
        mathBoxController.addKey('Left');
      },
    ));
    button.add(TextButton(
      child: Math.tex(r'\int_{\square}^{\square}dx',
          textStyle: TextStyle(fontSize: 16)),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
        foregroundColor: MaterialStateProperty.all(Colors.black),
      ),
      onPressed: () {
        mathBoxController.addExpression('\\int');
        mathBoxController.addExpression('^');
        mathBoxController.addKey('Left');
        mathBoxController.addExpression('_');
        mathBoxController.addKey('Right Right');
        mathBoxController.addExpression('(');
        mathBoxController.addExpression(')');
        mathBoxController.addExpression('dx');
        mathBoxController.addKey('Left Left Left Left Left');
      },
    ));
    button.add(TextButton(
      child:
          Math.tex(r'\frac{d}{dx}\square', textStyle: TextStyle(fontSize: 18)),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
        foregroundColor: MaterialStateProperty.all(Colors.black),
      ),
      onPressed: () {
        mathBoxController.addExpression('d');
        mathBoxController.addExpression('/');
        mathBoxController.addExpression('dx');
        mathBoxController.addKey('Right');
        mathBoxController.addExpression('(');
        mathBoxController.addExpression(')');
        mathBoxController.addKey('Left');
      },
    ));
    button.add(MyButton(
      child: Text('x'),
      onPressed: () {
        mathBoxController.addExpression('x');
      },
    ));
    button.add(TextButton(
      child: Math.tex(r'\int\square dx', textStyle: TextStyle(fontSize: 16)),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
        foregroundColor: MaterialStateProperty.all(Colors.black),
      ),
      onPressed: () {
        mathBoxController.addExpression('\\int');
        mathBoxController.addExpression('(');
        mathBoxController.addExpression(')');
        mathBoxController.addExpression('dx');
        mathBoxController.addKey('Left Left');
      },
    ));
    button.add(TextButton(
      child: Math.tex(r'polar{}', textStyle: TextStyle(fontSize: 20)),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
        foregroundColor: MaterialStateProperty.all(Colors.black),
      ),
      onPressed: () {
        mathBoxController.addString('polar');
        mathBoxController.addExpression('(');
      },
    ));
    button.add(TextButton(
      child: Math.tex(r'partfrac', textStyle: TextStyle(fontSize: 13)),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
        foregroundColor: MaterialStateProperty.all(Colors.black),
      ),
      onPressed: () {
        mathBoxController.addString('partfrac');
        mathBoxController.addExpression('(');
      },
    ));
    button.add(TextButton(
      child: Math.tex(r'lim_{x\to\square}', textStyle: TextStyle(fontSize: 18)),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
        foregroundColor: MaterialStateProperty.all(Colors.black),
      ),
      onPressed: () {
        mathBoxController.addExpression('\\lim');
        mathBoxController.addExpression('_');
        mathBoxController.addExpression('x');
        mathBoxController.addExpression('\\\\to');
        mathBoxController.addExpression('\\infty');
        mathBoxController.addKey('Right');
        mathBoxController.addExpression('(');
      },
    ));
    button.add(MyButton(
      child: Text('i'),
      onPressed: () {
        mathBoxController.addExpression('i');
      },
    ));
    button.add(MyButton(
      child: Icon(Icons.backspace),
      onPressed: mathBoxController.deleteExpression,
      onLongPress: () async {
        mathBoxController.deleteAllExpression();
        await mathBoxController.clearAnimationController?.forward();
        mathBoxController.clearAnimationController?.reset();
      },
    ));

    return button;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final mathBoxController =
        Provider.of<MathBoxController>(context, listen: false);

    return Container(
      height: width / 5 * 4 / AspectRatio,
      child: Material(
        color: Colors.grey[300],
        elevation: 15.0,
        child: GridView.count(
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 5,
          childAspectRatio: AspectRatio,
          children: _buildLowButton(mathBoxController, context),
        ),
      ),
    );
  }
}
