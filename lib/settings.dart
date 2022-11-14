import 'package:calculator/backend/settingpage.dart';
import 'package:calculator/services/LangProvider.dart';
import 'package:calculator/services/LockProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:units_converter/properties/torque.dart';
import 'package:calculator/utils/my_flutter_app_icons.dart';
import 'containerHistory.dart';
import 'buttonBox.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculator/services/ColorProvider.dart';
import 'package:calculator/services/FontProvider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:calculator/utils/my_flutter_app_icons.dart';

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

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  double myvalue = 0;
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
          child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                Provider.of<ColorProvider>(context).color,
                Colors.blueAccent
              ])),
              child: Text(Provider.of<LangProvider>(context).settingBar,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: Provider.of<FontProvider>(context).fontSize))),
          ExpansionTile(
            title: Text(Provider.of<LangProvider>(context).colorSetting),
            leading: const Icon(
              Icons.color_lens,
            ),
            trailing: const Icon(Icons.arrow_drop_down),
            childrenPadding: const EdgeInsets.only(left: 60),
            children: [
              ListTile(
                  title: const Text("Color Picker"),
                  onTap: () {
                    colorPicker(context);
                  }),
            ],
          ),
          ExpansionTile(
            title: Text(Provider.of<LangProvider>(context).fontSetting),
            leading: const Icon(Icons.sort_by_alpha),
            trailing: const Icon(Icons.arrow_drop_down),
            childrenPadding: const EdgeInsets.only(left: 60),
            children: [
              ListTile(
                title: Slider(
                  value: Provider.of<FontProvider>(context, listen: false)
                      .getSize(),
                  min: 10.0,
                  max: 30.0,
                  divisions: 20,
                  label:
                      "${Provider.of<FontProvider>(context, listen: false).getSize()}",
                  onChanged: (double value) {
                    setState(() {
                      Provider.of<FontProvider>(context, listen: false)
                          .changeFontSize(value);
                    });
                  },
                ),
                trailing: Text(
                    '${Provider.of<SettingModel>(context, listen: false).precision.toInt()}'),
              ),
              // ListTile(
              //   title: const Text("Change Font Style"),
              //   onTap: () {
              //     Provider.of<FontProvider>(context, listen: false)
              //         .changeFontFamily("Regular");
              //   },
              // ),
            ],
          ),
          ExpansionTile(
            title: Text(Provider.of<LangProvider>(context).langSetting),
            leading: const Icon(Icons.translate),
            trailing: const Icon(Icons.arrow_drop_down),
            childrenPadding: const EdgeInsets.only(left: 60),
            children: [
              ListTile(
                title: const Text("English"),
                leading: const Icon(
                  Icons.language_sharp,
                ),
                onTap: () {
                  Provider.of<LangProvider>(context, listen: false).change2EN();
                },
              ),
              ListTile(
                title: const Text("简体中文"),
                leading: const Icon(
                  Icons.language_sharp,
                ),
                onTap: () {
                  Provider.of<LangProvider>(context, listen: false)
                      .change2SCN();
                },
              ),
            ],
          ),
          ExpansionTile(
            title: Text(Provider.of<LangProvider>(context).modeSetting),
            leading: const Icon(Icons.school),

            trailing: const Icon(Icons.arrow_drop_down),
            childrenPadding: const EdgeInsets.only(left: 60),
            children: [
              ListTile(
                  title: const Text("Exam Mode"),
                  leading: const Icon(
                    Icons.school,
                  ),
                  trailing: Transform.scale(
                      scale: 0.8,
                      child: CupertinoSwitch(
                        // overrides the default green color of the track
                        activeColor:
                            Provider.of<ColorProvider>(context, listen: false)
                                .color,
                        // color of the round icon, which moves from right to left
                        thumbColor: Colors.grey,
                        // when the switch is off
                        trackColor: Colors.black12,
                        // boolean variable value
                        value: Provider.of<LockProvider>(context, listen: false)
                            .isLockEquation,
                        // changes the state of the switch
                        onChanged: (value) => setState(() =>
                            Provider.of<LockProvider>(context, listen: false)
                                .lockAll(value)),
                      ))
                  // onTap: () {
                  //   Provider.of<LockProvider>(context, listen: false)
                  //       .lockEquation();
                  // },
                  ),
              ListTile(
                  title: const Text("Lock Equation"),
                  leading: const Icon(
                    Icons.school,
                  ),
                  trailing: Transform.scale(
                      scale: 0.8,
                      child: CupertinoSwitch(
                        // overrides the default green color of the track
                        activeColor:
                            Provider.of<ColorProvider>(context, listen: false)
                                .color,
                        // color of the round icon, which moves from right to left
                        thumbColor: Colors.grey,
                        // when the switch is off
                        trackColor: Colors.black12,
                        // boolean variable value
                        value: Provider.of<LockProvider>(context, listen: false)
                            .isLockEquation,
                        // changes the state of the switch
                        onChanged: (value) => setState(() =>
                            Provider.of<LockProvider>(context, listen: false)
                                .lockEquation(value)),
                      ))
                  // onTap: () {
                  //   Provider.of<LockProvider>(context, listen: false)
                  //       .lockEquation();
                  // },
                  ),
              ListTile(
                  title: const Text("Lock Matrix"),
                  leading: const Icon(
                    Icons.school,
                  ),
                  trailing: Transform.scale(
                      scale: 0.8,
                      child: CupertinoSwitch(
                        // overrides the default green color of the track
                        activeColor:
                            Provider.of<ColorProvider>(context, listen: false)
                                .color,
                        // color of the round icon, which moves from right to left
                        thumbColor: Colors.grey,
                        // when the switch is off
                        trackColor: Colors.black12,
                        // boolean variable value
                        value: Provider.of<LockProvider>(context, listen: false)
                            .isLockMatrix,
                        // changes the state of the switch
                        onChanged: (value) => setState(() =>
                            Provider.of<LockProvider>(context, listen: false)
                                .lockMatrix(value)),
                      ))
                  // onTap: () {
                  //   Provider.of<LockProvider>(context, listen: false)
                  //       .lockEquation();
                  // },
                  ),
              ListTile(
                  title: const Text("Lock Graph Plot"),
                  leading: const Icon(
                    Icons.school,
                  ),
                  trailing: Transform.scale(
                      scale: 0.8,
                      child: CupertinoSwitch(
                        // overrides the default green color of the track
                        activeColor:
                            Provider.of<ColorProvider>(context, listen: false)
                                .color,
                        // color of the round icon, which moves from right to left
                        thumbColor: Colors.grey,
                        // when the switch is off
                        trackColor: Colors.black12,
                        // boolean variable value
                        value: Provider.of<LockProvider>(context, listen: false)
                            .isLockPlot,
                        // changes the state of the switch
                        onChanged: (value) => setState(() =>
                            Provider.of<LockProvider>(context, listen: false)
                                .lockPlot(value)),
                      ))
                  // onTap: () {
                  //   Provider.of<LockProvider>(context, listen: false)
                  //       .lockEquation();
                  // },
                  ),
            ],

            // ListTile(
            //   title: const Text("unlock"),
            //   leading: const Icon(
            //     Icons.school,
            //   ),
            //   onTap: () {
            //     Provider.of<LockProvider>(context, listen: false)
            //         .unlockEquation();
            //   },
            // ),
          ),
          ExpansionTile(
            title: Text(Provider.of<LangProvider>(context).angleSetting),
            leading: const Icon(Icons.text_rotation_angledown),
            trailing: const Icon(Icons.arrow_drop_down),
            childrenPadding: const EdgeInsets.only(left: 60),
            children: [
              ListTile(
                title: const Text("Rad"),
                leading: const Icon(
                  Icons.text_rotation_angledown,
                ),
                onTap: () {
                  Provider.of<SettingModel>(context, listen: false)
                      .changeRadMode(true);
                },
              ),
              ListTile(
                title: const Text("Degree"),
                leading: const Icon(
                  Icons.text_rotation_angledown,
                ),
                onTap: () {
                  Provider.of<SettingModel>(context, listen: false)
                      .changeRadMode(false);
                },
              ),
            ],
          ),
          ExpansionTile(
            title: Text(Provider.of<LangProvider>(context).calcSetting),
            leading: Icon(Icons.calculate_outlined),
            children: [
              ListTile(
                title: Slider(
                  value: Provider.of<SettingModel>(context, listen: false)
                      .precision
                      .toDouble(),
                  min: 0.0,
                  max: 10.0,
                  divisions: 10,
                  label:
                      "${Provider.of<SettingModel>(context, listen: false).precision.toInt()}",
                  onChanged: (double value) {
                    setState(() {
                      Provider.of<SettingModel>(context, listen: false)
                          .changeSlider(value);
                    });
                  },
                ),
                trailing: Text(
                    '${Provider.of<SettingModel>(context, listen: false).precision.toInt()}'),
              ),
            ],
          ),
        ],
      )),
    );
  }
}
