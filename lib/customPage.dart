import 'package:calculator/services/ColorProvider.dart';
import 'package:calculator/services/ConstantProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

class customPage extends StatefulWidget {
  const customPage({Key? key}) : super(key: key);

  @override
  _customPageState createState() => _customPageState();
}

class _customPageState extends State<customPage> {
  late List<User> users;

  @override
  void initState() {
    super.initState();

    users =
        List.of(Provider.of<ConstantProvider>(context, listen: false).allUsers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Provider.of<ColorProvider>(context, listen: false).color,
        title: Text("Constant Table"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        DataTable(
          border: TableBorder.all(color: Colors.black),
          headingRowColor:
              MaterialStateProperty.all(Color.fromARGB(255, 147, 141, 150)),
          columns: [
            DataColumn(
              label: Text(
                'Quantity',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Value',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            DataColumn(
              label: Text(
                'Label',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
          rows: getRows(List.of(
              Provider.of<ConstantProvider>(context, listen: false).allUsers)),
        ),
      ])),
    );
  }

  List<DataRow> getRows(List<User> users) => users.map((User user) {
        final cells = [user.quantity, user.value, user.unit];

        return DataRow(
          cells: Utils.modelBuilder(cells, (index, cell) {
            return DataCell(
              Text('$cell'),
              showEditIcon: true,
              onTap: () {
                switch (index) {
                  case 0:
                    editQuantity(user);
                    break;
                  case 1:
                    editValue(user);
                    break;
                  case 2:
                    editUnit(user);
                }
              },
            );
          }),
        );
      }).toList();

  Future editQuantity(User editUser) async {
    final quantity = await showTextDialog(
      context,
      title: 'Change Quantity',
      value: editUser.quantity,
    );

    setState(() => Provider.of<ConstantProvider>(context, listen: false)
            .update(users.map((user) {
          final isEditedUser = user == editUser;

          return isEditedUser ? user.copy(quantity: quantity) : user;
        }).toList()));
  }

  Future editValue(User editUser) async {
    final value = await showTextDialog(
      context,
      title: 'Change Value',
      value: editUser.value,
    );

    setState(() => Provider.of<ConstantProvider>(context, listen: false)
            .update(users.map((user) {
          final isEditedUser = user == editUser;

          return isEditedUser ? user.copy(value: value) : user;
        }).toList()));
  }

  Future editUnit(User editUser) async {
    final unit = await showTextDialog(
      context,
      title: 'Change Label',
      value: editUser.unit,
    );

    setState(() => Provider.of<ConstantProvider>(context, listen: false)
            .update(users.map((user) {
          final isEditedUser = user == editUser;

          return isEditedUser ? user.copy(unit: unit) : user;
        }).toList()));
  }
}

Future<T?> showTextDialog<T>(
  BuildContext context, {
  required String title,
  required String value,
}) =>
    showDialog<T>(
      context: context,
      builder: (context) => TextDialogWidget(
        title: title,
        value: value,
      ),
    );

class TextDialogWidget extends StatefulWidget {
  final String title;
  final String value;

  const TextDialogWidget({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  _TextDialogWidgetState createState() => _TextDialogWidgetState();
}

class _TextDialogWidgetState extends State<TextDialogWidget> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.value);
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: Text(widget.title),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          ElevatedButton(
            child: Text('Done'),
            onPressed: () => Navigator.of(context).pop(controller.text),
          )
        ],
      );
}

class Utils {
  static List<T> modelBuilder<M, T>(
          List<M> models, T Function(int index, M model) builder) =>
      models
          .asMap()
          .map<int, T>((index, model) => MapEntry(index, builder(index, model)))
          .values
          .toList();
}

class User {
  final String quantity;
  final String value;
  final String unit;

  const User({
    required this.quantity,
    required this.value,
    required this.unit,
  });

  User copy({
    String? quantity,
    String? value,
    String? unit,
  }) =>
      User(
        quantity: quantity ?? this.quantity,
        value: value ?? this.value,
        unit: unit ?? this.unit,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          quantity == other.quantity &&
          value == other.value &&
          unit == other.unit;

  @override
  int get hashCode => quantity.hashCode ^ value.hashCode ^ unit.hashCode;
}

//   List<User> allUsers = <User>[
//   User(quantity: 'Gravitational Acceleration', value: '9.8', unit: 'g'),
//   User(quantity: 'Mass of Earth', value: '5.97 x 10^24', unit: 'kg'),
//   User(quantity: 'Unit gas constant', value: '8.314', unit: 'J/mol K'),
//   User(
//       quantity: 'Acceleration due to gravitity',
//       value: '9.81',
//       unit: 'm/s\u00B2'),
//   User(quantity: 'Speed of light', value: '3 x 10^8', unit: 'm/s'),
//   User(quantity: 'electron charge', value: '-1.602 x 10^-19', unit: 'C'),
//   User(quantity: 'electron rest mass', value: '9.109 x 10^-31', unit: 'kg'),
//   User(quantity: "planck's constant", value: '6.626 x 10^-34', unit: 'J/s'),
//   User(quantity: 'atomic mass constant', value: '1.66 x 10^-27', unit: 'kg'),
//   User(
//       quantity: 'Gravitational Constant',
//       value: '6.674 x 10^-11',
//       unit: 'Nm\u00B2/kg\u00B2'),
// ];
