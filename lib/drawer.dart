import 'package:calculator/services/colorProvider.dart';
import 'package:calculator/services/displayStrController.dart';

import 'containerHistory.dart';
import 'buttonBox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculator/services/colorProvider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

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
            child: Text('Functions',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25.0))),
        ExpansionTile(
          title: const Text('Color Settings'),
          leading: const Icon(Icons.functions),
          trailing: const Icon(Icons.arrow_drop_down),
          childrenPadding: const EdgeInsets.only(left: 60),
          children: [
            ListTile(
                title: const Text("Quadratic"),
                onTap: () {
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
                              Navigator.of(context)
                                  .pop(); //dismiss the color picker
                            },
                          ),
                        ],
                      );
                    },
                  );
                }),
            ListTile(
              title: const Text("Pythagaros"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        ExpansionTile(
          title: const Text("Graphic Calculator"),
          leading: const Icon(Icons.show_chart),
          trailing: const Icon(Icons.arrow_drop_down),
          childrenPadding: const EdgeInsets.only(left: 60),
          children: [
            ListTile(
              title: const Text("Plot"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Child Category 2"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        ExpansionTile(
          title: const Text("Settings"),
          leading: const Icon(Icons.settings),
          trailing: const Icon(Icons.arrow_drop_down),
          childrenPadding: const EdgeInsets.only(left: 60),
          children: [
            ListTile(
              title: const Text("Dark mode"),
              leading: const Icon(
                Icons.dark_mode,
              ),
              onTap: () {
                ;
              },
            ),
            ListTile(
              title: const Text("Font Size"),
              leading: const Icon(Icons.format_size),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        )
      ])),
    );
  }
}
