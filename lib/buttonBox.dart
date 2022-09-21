import 'package:calculator/services/displayStrController.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'button.dart';

class ButtonBox extends StatefulWidget {
  late DisplayStrController strController;

  ButtonBox(DisplayStrController strController);

  @override
  State<ButtonBox> createState() => _ButtonBoxState();
}

class _ButtonBoxState extends State<ButtonBox> {
  final _controller = PageController();

  // var userQuestion = '';
  // var userAns = '';

  final List<String> buttons = [
    'F1',
    'F2',
    'F3',
    'F4',
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    'x',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '.',
    '0',
    'ANS',
    '='
  ];
  final List<String> buttons1 = [
    'A',
    'B',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'Y',
    'Z'
  ];
  final List<String> buttons2 = [
    'a',
    'b',
    'd',
    'e',
    'f',
    'g',
    'h',
    'i',
    'j',
    'k',
    'l',
    'm',
    'n',
    'o',
    'p',
    'q',
    'r',
    's',
    't',
    'u',
    'v',
    'w',
    'y',
    'z'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Expanded(
        //     //Input and Output Screen
        //     flex: 10,
        //     child: Container(
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //         children: [
        //           Container(
        //               padding: EdgeInsets.all(20),
        //               alignment: Alignment.centerLeft,
        //               child: Text(
        //                 userQuestion,
        //                 style: TextStyle(fontSize: 20),
        //               )),
        //           Container(
        //               padding: EdgeInsets.all(20),
        //               alignment: Alignment.centerRight,
        //               child: Text(
        //                 userAns,
        //                 style: TextStyle(fontSize: 20),
        //               ))
        //         ],
        //       ),
        //     )),
        //Page Indicator
        Expanded(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: ColorTransitionEffect(
                activeDotColor: Colors.black,
                dotColor: Colors.grey,
                dotHeight: 15,
              ),
            ),
          ],
        )),
        //The 3 pages, Page 1
        Expanded(
          flex: 20,
          child: PageView(
            controller: _controller,
            children: [
              Container(
                color: Colors.indigo,
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, childAspectRatio: 1.6 / 1.3),
                    itemBuilder: (BuildContext context, int index) {
                      //CLR
                      if (index == 4) {
                        return CustomButton(
                          buttonTapped: () {
                            this.widget.strController.clearInput();
                          },
                          color: Colors.black,
                          textColor: Colors.white,
                          text: buttons[index],
                        );
                        //DEL
                      } else if (index == 5) {
                        return CustomButton(
                          buttonTapped: () {
                            // setState(() {
                            //   userQuestion = userQuestion.substring(
                            //       0, userQuestion.length - 1);
                            // });
                          },
                          color: Colors.black,
                          textColor: Colors.white,
                          text: buttons[index],
                        );
                        // For the rest of the buttons
                      } else {
                        return CustomButton(
                          buttonTapped: () {
                            // setState(() {
                            //   userQuestion += buttons[index];
                            // });
                          },
                          color: Colors.black,
                          textColor: Colors.white,
                          text: buttons[index],
                        );
                      }
                    }),
              ),
              //Page 2
              Container(
                color: Colors.red,
                child: GridView.builder(
                    itemCount: buttons.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, childAspectRatio: 1.6 / 1.3),
                    itemBuilder: (BuildContext context, int index) {
                      return CustomButton(
                        buttonTapped: () {
                          // setState(() {
                          //   userQuestion += buttons2[index];
                          // });
                        },
                        color: Colors.white,
                        textColor: Colors.black,
                        text: buttons2[index],
                      );
                    }),
              ),
              //Page 3
              Container(
                color: Colors.green,
                child: GridView.builder(
                    itemCount: buttons1.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, childAspectRatio: 1.6 / 1.3),
                    itemBuilder: (BuildContext context, int index) {
                      return CustomButton(
                        buttonTapped: () {
                          // setState(() {
                          //   userQuestion += buttons1[index];
                          // });
                        },
                        color: Colors.black,
                        textColor: Colors.orange,
                        text: buttons1[index],
                      );
                    }),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
