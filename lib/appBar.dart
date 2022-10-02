import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget {
  String barName;
  DefaultAppBar(this.barName);
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(barName),
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
