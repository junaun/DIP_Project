import 'dart:math';
import 'package:calculator/backend/keyboardProvider.dart';
import 'package:calculator/services/ColorProvider.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:calculator/backend/keyboard.dart';
import 'package:calculator/backend/mathbox.dart';
import 'package:calculator/backend/settingpage.dart';
import 'package:calculator/backend/mathmodel.dart';

const AspectRatio = 1.2;

class KeyBoard2 extends StatelessWidget {
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
          children: Provider.of<KeyboardProvider>(context, listen: false)
              .buildLowButton(mathBoxController),
        ),
      ),
    );
  }
}
