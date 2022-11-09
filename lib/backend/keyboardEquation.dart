import 'dart:math';
import 'package:calculator/services/ColorProvider.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:calculator/backend/keyboard.dart';
import 'package:calculator/backend/mathbox.dart';
import 'package:calculator/backend/settingpage.dart';
import 'package:calculator/backend/mathmodel.dart';

const AspectRatio = 1.2;

class KeyBoardPlotting extends StatelessWidget {
  List<Widget> _buildLowButton(MathBoxController mathBoxController) {
    List<Widget> button = [];

    for (var i = 7; i <= 9; i++) {
      button.add(MyButton(
        child: Text('$i'),
        onPressed: () {
          mathBoxController.addExpression('$i');
        },
      ));
    }

    button.add(MyButton(
      child: Icon(
        // frac
        IconData(0xe907, fontFamily: 'Keyboard'),
        size: 60.0,
      ),
      onPressed: () {
        mathBoxController.addExpression('/', isOperator: true);
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

    for (var i = 4; i <= 6; i++) {
      button.add(MyButton(
        child: Text('$i'),
        onPressed: () {
          mathBoxController.addExpression('$i');
        },
      ));
    }

    button.add(MyButton(
      child: Text('+'),
      onPressed: () {
        mathBoxController.addExpression('+', isOperator: true);
      },
    ));

    button.add(MyButton(
      child: Text('-'),
      onPressed: () {
        mathBoxController.addExpression('-', isOperator: true);
      },
    ));

    for (var i = 1; i <= 3; i++) {
      button.add(MyButton(
        child: Text('$i'),
        onPressed: () {
          mathBoxController.addExpression('$i');
        },
      ));
    }

    button.add(MyButton(
      child: Text('×'),
      onPressed: () {
        mathBoxController.addExpression('\\\\times', isOperator: true);
      },
    ));

    button.add(MyButton(
      child: Text('÷'),
      onPressed: () {
        mathBoxController.addExpression('\\div', isOperator: true);
      },
    ));

    button.add(MyButton(
      child: Text('0'),
      onPressed: () {
        mathBoxController.addExpression('0');
      },
    ));

    button.add(MyButton(
      child: Text('.'),
      onPressed: () {
        mathBoxController.addExpression('.');
      },
    ));

    button.add(Consumer<CalculationMode>(
      builder: (context, mode, _) => MyButton(
        child: mode.value != Mode.Matrix
            ? Text('=')
            : Icon(
                Icons.male_rounded,
                size: 40.0,
              ),
        onPressed: () {
          mode.value == Mode.Basic
              ? mathBoxController.equal()
              : mathBoxController.addExpression('\\\\bmatrix');
        },
      ),
    ));

    button.add(MyButton(
      child: Text('π'),
      onPressed: () {
        mathBoxController.addExpression('\\pi');
      },
    ));

    button.add(MyButton(
      child: Text('e'),
      onPressed: () {
        mathBoxController.addExpression('e');
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
          children: _buildLowButton(mathBoxController),
        ),
      ),
    );
  }
}
