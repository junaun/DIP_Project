import 'package:calculator/services/displayStrController.dart';

import 'containerHistory.dart';
import 'buttonBox.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
          child: ListView(padding: EdgeInsets.zero, children: <Widget>[
        const DrawerHeader(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: <Color>[Colors.blue, Colors.blueAccent])),
            child: Text('Functions',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 25.0))),
        ExpansionTile(
          title: const Text('Equations'),
          leading: const Icon(Icons.functions),
          trailing: const Icon(Icons.arrow_drop_down),
          childrenPadding: const EdgeInsets.only(left: 60),
          children: [
            ListTile(
              title: const Text("Quadratic"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
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
