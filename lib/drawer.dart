import 'containerHistory.dart';
import 'buttonBox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculator/services/ColorProvider.dart';
import 'package:calculator/services/FontProvider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

colorPicker(context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Pick a color!'),
        content: SingleChildScrollView(
          child: ColorPicker(
            pickerColor: Colors.blue, //default color
            onColorChanged: (Color color) {
              //on color picked

              Provider.of<ColorProvider>(context, listen: false)
                  .changeColor(color);
            },
          ),
        ),
        actions: <Widget>[
          ElevatedButton(
            child: const Text('DONE'),
            onPressed: () {
              Navigator.of(context).pop(); //dismiss the color picker
            },
          ),
        ],
      );
    },
  );
}

class SideBar extends StatelessWidget {
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
              Provider.of<ColorProvider>(context).color,
              Colors.blueAccent
            ])),
            child: Text('Settings',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: Provider.of<FontProvider>(context).fontSize))),
        ExpansionTile(
          title: const Text('Themes'),
          leading: const Icon(Icons.functions),
          trailing: const Icon(Icons.arrow_drop_down),
          childrenPadding: const EdgeInsets.only(left: 60),
          children: [
            ListTile(
                title: const Text("Color Picker"),
                onTap: () {
                  colorPicker(context);
                }),
            ListTile(
              title: const Text("Mode Toggle"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        ExpansionTile(
          title: const Text("Fonts"),
          leading: const Icon(Icons.show_chart),
          trailing: const Icon(Icons.arrow_drop_down),
          childrenPadding: const EdgeInsets.only(left: 60),
          children: [
            ListTile(
              title: const Text("Big Font Size"),
              onTap: () {
                Provider.of<FontProvider>(context, listen: false)
                    .changeFontSize(25);
              },
            ),
            ListTile(
              title: const Text("Small Font Size"),
              onTap: () {
                Provider.of<FontProvider>(context, listen: false)
                    .changeFontSize(10);
              },
            ),
            ListTile(
              title: const Text("Change Font Style"),
              onTap: () {
                Provider.of<FontProvider>(context, listen: false)
                    .changeFontFamily("Regular");
              },
            ),
          ],
        ),
        ExpansionTile(
          title: const Text("Language"),
          leading: const Icon(Icons.language),
          trailing: const Icon(Icons.arrow_drop_down),
          childrenPadding: const EdgeInsets.only(left: 60),
          children: [
            ListTile(
              title: const Text("Change Language"),
              leading: const Icon(
                Icons.language,
              ),
              onTap: () {
                ;
              },
            ),
          ],
        ),
        ExpansionTile(
          title: const Text("Exam Mode"),
          leading: const Icon(Icons.school),
          trailing: const Icon(Icons.arrow_drop_down),
          childrenPadding: const EdgeInsets.only(left: 60),
          children: [
            ListTile(
              title: const Text("Exam Mode"),
              leading: const Icon(
                Icons.school,
              ),
              onTap: () {
                ;
              },
            ),
          ],
        )
      ])),
    );
  }
}
