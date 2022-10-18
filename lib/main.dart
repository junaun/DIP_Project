import 'package:calculator/homePage.dart';
import 'package:calculator/services/colorController.dart';
import 'package:calculator/services/colorProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => ColorProvider(),
        child: MaterialApp(
          title: 'Flutter Demo',
          home: HomePage(),
        ));
  }
}
