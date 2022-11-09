import 'dart:math';
import 'package:calculator/backend/keyboard2.dart';
import 'package:calculator/services/ColorProvider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:calculator/backend/keyboard.dart';
//import 'package:calculator/backend/keyboard2.dart';
import 'package:calculator/backend/mathbox.dart';
import 'package:calculator/backend/settingpage.dart';
import 'package:calculator/backend/mathmodel.dart';

class SlideKeyboard extends StatefulWidget {
  @override
  State<SlideKeyboard> createState() => _SlideKeyboardState();
}

class _SlideKeyboardState extends State<SlideKeyboard> {
  final _controller = PageController();
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  //width: double.infinity,
                  //height: 5,
                  //color: Colors.amber,
                  //decoration: BoxDecoration(
                  //   //borderRadius: BorderRadius.circular(16),
                  //color: Colors.grey,
                  //),
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 2,
                    effect: ColorTransitionEffect(
                        activeDotColor:
                            Provider.of<ColorProvider>(context, listen: false)
                                .color,
                        dotColor: Colors.white,
                        dotHeight: 10,
                        dotWidth: 10),
                  ),
                )
              ],
            )),
        Expanded(
          flex: 30,
          child: PageView(
              controller: _controller, children: [MathKeyBoard(), KeyBoard2()]
              //children: [MathKeyBoard(), MathKeyBoard()],
              ),
        ),

        //The 3 pages, Page 1
      ],
    );
  }
}
