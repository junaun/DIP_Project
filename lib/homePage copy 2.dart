import 'package:calculator/buttonBox.dart';
import 'package:calculator/diffrentiation.dart';
import 'package:calculator/displayBox.dart';
import 'package:calculator/containerHistory.dart';
import 'package:calculator/settings.dart';
import 'package:calculator/equations.dart';
import 'package:calculator/plotting/Plotted_type.dart';
import 'package:calculator/services/ColorProvider.dart';
import 'package:calculator/services/FontProvider.dart';
import 'package:calculator/services/LockProvider.dart';
import 'package:calculator/services/LangProvider.dart';
import 'package:provider/provider.dart';
import 'package:calculator/services/displayStrController.dart';
import 'package:calculator/unitConv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:calculator/backend/mathbox.dart';
import 'package:calculator/backend/result.dart';
import 'package:calculator/backend/matrixbutton.dart';
import 'package:calculator/backend/keyboard.dart';
import 'package:calculator/backend/mathmodel.dart';
import 'package:calculator/backend/settingpage.dart';
import 'package:calculator/slidcomponent.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

  // Widget build(BuildContext context) {
  //   return Container(
  //     child: Scaffold(
  //         appBar: AppBar(
  //           title: Text("Smart Calculator"),
  //           backgroundColor: Provider.of<ColorProvider>(context).getColor(),
  //           actions: [
  //             PopupMenuButton(
  //                 // add icon, by default "3 dot" icon
  //                 // icon: Icon(Icons.book)
  //                 itemBuilder: (context) {
  //               return [
  //                 PopupMenuItem<int>(
  //                   value: 0,
  //                   child: Text("Equation Solver"),
  //                 ),
  //                 PopupMenuItem<int>(
  //                   value: 1,
  //                   child: Text("Matrix Calculation"),
  //                 ),
  //                 PopupMenuItem<int>(
  //                   value: 2,
  //                   child: Text("Graph Plotting"),
  //                 ),
  //                 PopupMenuItem<int>(
  //                   value: 3,
  //                   child: Text("Unit Conversion"),
  //                 ),
  //               ];
  //             }, onSelected: (value) {
  //               if (value == 0) {
  //                 print("equation solver is selected.");
  //                 Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                       builder: (context) => const EquationApp()),
  //                 );
  //               } else if (value == 1) {
  //                 Provider.of<ColorProvider>(context).changeColor("white");
  //                 print(Provider.of<ColorProvider>(context).getColor());
  //               } else if (value == 2) {
  //                 print("graph plotting is selected.");
  //                 Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                       builder: (context) => const Typeselection()),
  //                 );
  //               } else if (value == 3) {
  //                 print("unitconversion is selected.");
  //                 Navigator.push(
  //                   context,
  //                   MaterialPageRoute(builder: (context) => const Convertor()),
  //                 );
  //               }
  //             }),
  //           ],
  //         ),
  //         body: Column(children: <Widget>[
  //           //Expanded(child: containerHistory(), flex: 3),
  //           // Expanded(
  //           //     child: TextButton(
  //           //   child: Text("change towhite"),
  //           //   onPressed: () {
  //           //     setState(() {
  //           //       colorController.changeColor("white");
  //           //     });
  //           //   },
  //           // )),
  //           // Expanded(
  //           //     child: TextButton(
  //           //   child: Text("change toblack"),
  //           //   onPressed: () {
  //           //     setState(() {
  //           //       colorController.changeColor("black");
  //           //     });
  //           //   },
  //           // )),
  //           // Expanded(
  //           //   child: Text(colorController.color.toString()),
  //           // ),
  //           Expanded(child: DisplayBox(), flex: 4),
  //         ]),
  //         drawer: SideBar()),
  //   );
  // }
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final Server _server = Server();
  TabController? tabController;

  List tabs = ["Basic", "Matrix"];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
    _server.start();
  }

  @override
  void dispose() {
    _server.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mode = Provider.of<CalculationMode>(context, listen: false);
    //mode.changeMode(Mode.Basic);
    final mathBoxController =
        Provider.of<MathBoxController>(context, listen: false);
    final setting = Provider.of<SettingModel>(context, listen: false);
    return Container(
      child: Scaffold(
          appBar: AppBar(
            //   title: FutureBuilder(
            //     future: setting.loading.future,
            //     builder: (context, snapshot) {
            //       if (snapshot.connectionState == ConnectionState.done) {
            //         tabController!.index = setting.initPage;
            //       }
            //appBar: MyAppBar(setting, tabController),

            // return TabBar(
            //   indicatorColor: Colors.blueAccent[400],
            //   controller: tabController,
            //   labelColor: Colors.black,
            //   indicator: BoxDecoration(
            //     border: Border.all(
            //       color: Colors.blueAccent,
            //       width: 2.0,
            //     ),
            //     borderRadius: BorderRadius.circular(10.0),
            //   ),
            //   tabs: <Widget>[
            //     Tab(text: 'Basic'),
            //     Tab(text: 'Matrix'),
            //   ],
            //   onTap: (index) {
            //     setting.changeInitpage(index);
            //     switch (index) {
            //       case 0:
            //         if (mode.value == Mode.Matrix) {
            //           mode.value = Mode.Basic;
            //           mathBoxController.deleteAllExpression();
            //         }
            //         break;
            //       case 1:
            //         if (mode.value != Mode.Matrix) {
            //           mode.value = Mode.Matrix;
            //           mathBoxController.deleteAllExpression();
            //           mathBoxController.addExpression('\\\\bmatrix');
            //         }
            //         break;
            //       default:
            //         throw 'Unknown type';
            //     }
            //   },
            // );

            title: Text(Provider.of<LangProvider>(context).homeBar,
                style: TextStyle(
                    fontSize: Provider.of<FontProvider>(context).fontSize)),
            backgroundColor: Provider.of<ColorProvider>(context).getColor(),
            actions: [
              PopupMenuButton(
                  // add icon, by default "3 dot" icon
                  // icon: Icon(Icons.book)
                  itemBuilder: (context) {
                return [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text("Equation Solver"),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Text("Matrix Calculation"),
                  ),
                  PopupMenuItem<int>(
                    value: 2,
                    child: Text("Graph Plotting"),
                  ),
                  PopupMenuItem<int>(
                    value: 3,
                    child: Text("Unit Conversion"),
                  ),
                  PopupMenuItem<int>(
                    value: 4,
                    child: Text("basic"),
                  ),
                ];
              }, onSelected: (value) {
                if (value == 0) {
                  if (Provider.of<LockProvider>(context, listen: false)
                      .getLockEquation()) {
                    showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Access Denied'),
                        content: const Text('Equation is locked'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EquationApp()),
                    );
                  }
                } else if (value == 1) {
                  Provider.of<ColorProvider>(context, listen: false)
                      .changeColor(Colors.white);
                } else if (value == 2) {
                  print("graph plotting is selected.");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Typeselection()),
                  );
                } else if (value == 3) {
                  print("unitconversion is selected.");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Convertor()),
                  );
                } else if (value == 4) {
                  //print("unitconversion is selected.");
                  mode.changeMode(Mode.Basic);
                } else {
                  mode.changeMode(Mode.Basic);
                }
              }),
            ],
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    MathBox(),
                    SlidComponent(),
                  ],
                ),
              ),
              MathKeyBoard(),
            ],
          ),
          drawer: SideBar()),
    );
  }
}

// class MyAppBar extends StatelessWidget implements PreferredSizeWidget{
//   @override
//   //SettingModel setting = ;
  
//   TabController? tabController;
//   Size get preferredSize => const Size.fromHeight(100);
//   MyAppBar(SettingModel setting, TabController? tabController);

//   @override
//   Widget build(BuildContext context) {
     
//     return FutureBuilder(
//         future: setting.loading.future,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             tabController!.index = setting!.initPage;
//           }
//           return AppBar(
//               title: Text(Provider.of<LangProvider>(context).homeBar,
//                   style: TextStyle(
//                       fontSize: Provider.of<FontProvider>(context).fontSize)),
//               backgroundColor: Provider.of<ColorProvider>(context).getColor());
//         });
//   }
// }
