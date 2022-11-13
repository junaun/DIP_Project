import 'package:calculator/homePage.dart';
import 'package:calculator/services/ColorProvider.dart';
import 'package:calculator/services/FontProvider.dart';
import 'package:calculator/services/LockProvider.dart';
import 'package:calculator/services/ConstantProvider.dart';
import 'package:calculator/services/LangProvider.dart';
import 'package:calculator/backend/keyboardProvider.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_icons/flutter_icons.dart';
import 'package:calculator/backend/mathbox.dart';
import 'package:calculator/backend/result.dart';
import 'package:calculator/backend/matrixbutton.dart';
import 'package:calculator/backend/keyboard.dart';
//import 'package:calculator/backend/keyboardProvider.dart';
import 'package:calculator/backend/mathmodel.dart';
import 'package:calculator/backend/settingpage.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  // final database = openDatabase(
  //     // Set the path to the database. Note: Using the `join` function from the
  //     // `path` package is best practice to ensure the path is correctly
  //     // constructed for each platform.
  //     join(await getDatabasesPath(), 'doggie_database.db'),
  //     // When the database is first created, create a table to store dogs.
  //     onCreate: (db, version) {
  //   // Run the CREATE TABLE statement on the database.
  //   return db.execute(
  //     'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
  //   );
  // });

  runApp(
    MyApp(),
  );
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//         create: (_) => ColorProvider(),
//         child: MaterialApp(
//           title: 'Flutter Demo',
//           home: HomePage(),
//         ));
//   }
// }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<ColorProvider>(create: (_) => ColorProvider()),
          ChangeNotifierProvider<FontProvider>(create: (_) => FontProvider()),
          ChangeNotifierProvider<LangProvider>(create: (_) => LangProvider()),
          ChangeNotifierProvider<ConstantProvider>(
              create: (_) => ConstantProvider()),
          ChangeNotifierProvider<LockProvider>(create: (_) => LockProvider()),
          ChangeNotifierProvider<KeyboardProvider>(
              create: (_) => KeyboardProvider()),
          Provider(create: (context) => MathBoxController()),
          ChangeNotifierProvider(create: (_) => SettingModel()),
          ChangeNotifierProxyProvider<SettingModel, MathModel>(
            create: (context) => MathModel(),
            update: (context, settings, model) => model!
              ..changeSetting(
                  precision: settings.precision.toInt(),
                  isRadMode: settings.isRadMode),
          ),
          ChangeNotifierProxyProvider<SettingModel, MatrixModel>(
            create: (context) => MatrixModel(),
            update: (context, settings, model) => model!
              ..changeSetting(
                precision: settings.precision.toInt(),
              ),
          ),
          ListenableProxyProvider<SettingModel, CalculationMode>(
            create: (context) => CalculationMode(Mode.Basic),
            update: (context, settings, model) {
              if (settings.loading.isCompleted) {
                switch (settings.initPage) {
                  case 0:
                    if (model!.value == Mode.Matrix) {
                      model.value = Mode.Basic;
                    }
                    break;
                  case 1:
                    model!.changeMode(Mode.Matrix);
                    break;
                }
              }
              return model!;
            },
            dispose: (context, value) => value.dispose(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          home: HomePage(),
        ));
  }
}
