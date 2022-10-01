import 'package:flutter/material.dart';
import 'dart:math';
import 'package:math_keyboard/math_keyboard.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter_math_fork/ast.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:flutter_math_fork/tex.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      home: const mathField(),
    );
  }
}

class mathField extends StatefulWidget {
  const mathField({super.key});

  @override
  State<mathField> createState() => _mathField();
}

class _mathField extends State<mathField> {
  String result = "";
  double _eval = 0.0;
  String stringpassed = "";
  String realtimestring = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Math keyboard demo'),
      ),
      body: Center(
          child: Column(
        children: [
          _realtime(),
          _buildmathfield(),
          _resultArea(),
          _stringpass()
        ],
      )),
    );
  }

  Widget _buildmathfield() {
    return Container(
        child: MathField(
      // No parameters are required.
      keyboardType: MathKeyboardType
          .expression, // Specify the keyboard type (expression or number only).
      variables: const [
        'x',
        'y',
        'z'
      ], // Specify the variables the user can use (only in expression mode).
      decoration:
          const InputDecoration(), // Decorate the input field using the familiar InputDecoration.
      onChanged: (String value) {
        setState(() {
          realtimestring = value;
        });
      }, // Respond to changes in the input field.
      onSubmitted: (String value) {
        setState(() {
          final _mathExpression = TeXParser(value).parse();
          ContextModel ctx = ContextModel();
          double _eval = _mathExpression.evaluate(EvaluationType.REAL, ctx);
          result = _eval.toString();
          stringpassed = value;
        });
      }, // Respond to the user submitting their input.
      autofocus: true, // Enable or disable autofocus of the input field.
    ));
  }

  Widget _resultArea() {
    return Container(
      child: Math.tex(
        //"\\frac{9}{5}",
        result,
        //"\\int_{-\\infty}^\\infty {f(x)e^{- 2\\pi i \\xi x}\\mathrm{d}x}",
        textStyle: TextStyle(fontSize: 42),
      ),
    );
  }

  Widget _stringpass() {
    return Container(child: Text(stringpassed, style: TextStyle(fontSize: 42)));
  }

  Widget _realtime() {
    return Container(child: Text(realtimestring, style: TextStyle(fontSize: 42))
        /**child: Math.tex(
        realtimestring,
        textStyle: TextStyle(fontSize: 42),
      ),**/
        );
  }
}
