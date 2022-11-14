import 'package:avatar_glow/avatar_glow.dart';
import 'package:calculator/services/colorProvider.dart' as cp;
import 'package:flutter/material.dart';
import 'package:highlight_text/highlight_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculator/services/ColorProvider.dart';
import 'package:calculator/services/FontProvider.dart';
import 'package:calculator/services/LockProvider.dart';
import 'package:calculator/services/LangProvider.dart';
import 'package:calculator/equation/equation_type.dart' as equation_types;

//import 'buttons.dart';
import 'package:math_expressions/math_expressions.dart';

import '../equations.dart';
import '../plotting/Plotted_type.dart';

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Voice',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: SpeechScreen(),
//     );
//   }
// }

class SpeechScreen extends StatefulWidget {
  @override
  _SpeechScreenState createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  final Map<String, HighlightedWord> _highlights = {
    'flutter': HighlightedWord(
      onTap: () => print('flutter'),
      textStyle: const TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
      ),
    ),
    'voice': HighlightedWord(
      onTap: () => print('voice'),
      textStyle: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
      ),
    ),
    'subscribe': HighlightedWord(
      onTap: () => print('subscribe'),
      textStyle: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    ),
    'like': HighlightedWord(
      onTap: () => print('like'),
      textStyle: const TextStyle(
        color: Colors.blueAccent,
        fontWeight: FontWeight.bold,
      ),
    ),
    'comment': HighlightedWord(
      onTap: () => print('comment'),
      textStyle: const TextStyle(
        color: Colors.green,
        fontWeight: FontWeight.bold,
      ),
    ),
  };

  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = 'Hi! How can I help you?';
  double _confidence = 1.0;

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //     //title: Text('Confidence: ${(_confidence * 100.0).toStringAsFixed(1)}%'),
        //     title: Text("Smart Calculator")),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: AvatarGlow(
          animate: _isListening,
          glowColor: Theme.of(context).primaryColor,
          endRadius: 75.0,
          duration: const Duration(milliseconds: 2000),
          repeatPauseDuration: const Duration(milliseconds: 100),
          repeat: true,
          child: FloatingActionButton(
            onPressed: _listen,
            child: Icon(_isListening ? Icons.mic : Icons.mic_none),
          ),
        ),
        body: Column(children: <Widget>[
          Expanded(
            flex: 10,
            child: SingleChildScrollView(
              reverse: true,
              child: Container(
                padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 150.0),
                child: TextHighlight(
                  //text: calculate(_text),
                  text: _text,
                  words: _highlights,
                  textStyle: const TextStyle(
                    fontSize: 32.0,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          Expanded(flex: 25, child: Image.asset("assets/robot.jpg"))
        ]));
  }

  String speechPage(String inputText) {
    if (inputText.contains("equation")) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const equation_types.Typeselection()),
      );
      return "Ok! Lets go to equation.";
    } else if (inputText.contains("graph plotting")) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Typeselection()),
      );
      return "Ok! Lets go to plotting.";
    } else if (inputText.contains("matrix")) {
      return "Ok! The color is changed to Yellow.";
    } else if (inputText.contains("integration")) {
      Provider.of<ColorProvider>(context, listen: false)
          .changeColor(Colors.green);
      return "Ok! The color is changed to green.";
    } else if (inputText.contains("differentiation")) {
      Provider.of<ColorProvider>(context, listen: false)
          .changeColor(Colors.purple);
      return "Ok! The color is changed to blue.";
    } else {
      return "Paiseh, not sure which page you are saying";
    }
  }

  String speechColor(String inputText) {
    if (inputText.contains("blue") || inputText.contains("Blue")) {
      Provider.of<ColorProvider>(context, listen: false)
          .changeColor(Colors.blue);
      return "Ok! The color is changed to blue.";
    } else if (inputText.contains("red") || inputText.contains("Red")) {
      Provider.of<ColorProvider>(context, listen: false)
          .changeColor(Colors.red);
      return "Ok! The color is changed to red.";
    } else if (inputText.contains(
          "yellow",
        ) ||
        inputText.contains("Yellow")) {
      Provider.of<ColorProvider>(context, listen: false)
          .changeColor(Colors.yellow);
      return "Ok! The color is changed to Yellow.";
    } else if (inputText.contains("green") || inputText.contains("green")) {
      Provider.of<ColorProvider>(context, listen: false)
          .changeColor(Colors.green);
      return "Ok! The color is changed to green.";
    } else if (inputText.contains("purple") || inputText.contains("Purple")) {
      Provider.of<ColorProvider>(context, listen: false)
          .changeColor(Colors.purple);
      return "Ok! The color is changed to blue.";
    } else if (inputText.contains("pink") || inputText.contains("Pink")) {
      Provider.of<ColorProvider>(context, listen: false)
          .changeColor(Colors.pink);
      return "Ok! The color is changed to pink.";
    } else if (inputText.contains("white") || inputText.contains("White")) {
      Provider.of<ColorProvider>(context, listen: false)
          .changeColor(Colors.white);
      return "Ok! The color is changed to white.";
    } else {
      return "Paiseh, not sure which color detected";
    }
  }

  String speechFont(String inputText) {
    if (inputText.contains("big") || inputText.contains("bigger")) {
      Provider.of<FontProvider>(context, listen: false).changeFontSize(30);
      return "Ok! The font size ifs bigger now.";
    } else if (inputText.contains("small") || inputText.contains("smaller")) {
      Provider.of<FontProvider>(context, listen: false).changeFontSize(20);
      return "Ok! The font size is smaller now.";
    } else {
      return "Sorry, not sure which font size you are saying";
    }
  }

  String analyzeSpeech(String inputText) {
    if (inputText.contains(RegExp(r'[0-9]', caseSensitive: false)) ||
        inputText.contains(RegExp(r'.*What is', caseSensitive: false))) {
      return speechCalculate(inputText);
    } else if (inputText
            .contains(RegExp('change color', caseSensitive: false)) ||
        inputText.contains(RegExp('change the color', caseSensitive: false))) {
      return speechColor(inputText);
    } else if (inputText.contains(RegExp('font size', caseSensitive: false)) ||
        inputText.contains(RegExp('the words', caseSensitive: false))) {
      return speechFont(inputText);
    } else if (inputText.contains(RegExp('open', caseSensitive: false)) ||
        inputText.contains(RegExp('page', caseSensitive: false)) ||
        inputText.contains(RegExp('Go to', caseSensitive: false))) {
      return speechPage(inputText);
    } else {
      return inputText;
      //return "Sorry, I don't under your commands.";
    }
  }

  String speechCalculate(String userInput) {
    // if (userInput.contains(RegExp("What is", caseSensitive: false))) {
    //   userInput = userInput.substring(7);
    // }
    String finaluserinput = userInput;
    print("input is " + userInput);

    finaluserinput =
        userInput.replaceAll(RegExp(String.fromCharCode(215)), '*');
    finaluserinput = userInput.replaceAll(RegExp(r'÷'), '/');
    print(String.fromCharCode(215));
    //String answer = "null";
    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    if (eval == null) {
      return userInput;
      //return "Sorry, no idea what you said";
    }
    // answer = eval.toString();
    //return userInput;
    return userInput + " = " + eval.toString();
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (val) => print('onStatus: $val'),
        onError: (val) => print('onError: $val'),
      );
      if (available) {
        setState(() => _isListening = true);
        _speech.listen(
          onResult: (val) => setState(() {
            String inputText = val.recognizedWords;
            //_text = inputText + " = " + analyzeSpeech(inputText);
            //_text = inputText;
            _text = analyzeSpeech(inputText);
            if (val.hasConfidenceRating && val.confidence > 0) {
              _confidence = val.confidence;
            }
          }),
        );
      }
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }
}
