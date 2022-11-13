import 'package:flutter/material.dart';

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

    users = List.of(allUsers);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Constant Table"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        DataTable(
          border: TableBorder.all(color: Colors.black),
          headingRowColor:
              MaterialStateProperty.all(Color.fromARGB(255, 202, 157, 245)),
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
          rows: getRows(users),
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

    setState(() => users = users.map((user) {
          final isEditedUser = user == editUser;

          return isEditedUser ? user.copy(quantity: quantity) : user;
        }).toList());
  }

  Future editValue(User editUser) async {
    final value = await showTextDialog(
      context,
      title: 'Change Value',
      value: editUser.value,
    );

    setState(() => users = users.map((user) {
          final isEditedUser = user == editUser;

          return isEditedUser ? user.copy(value: value) : user;
        }).toList());
  }

  Future editUnit(User editUser) async {
    final unit = await showTextDialog(
      context,
      title: 'Change Label',
      value: editUser.unit,
    );

    setState(() => users = users.map((user) {
          final isEditedUser = user == editUser;

          return isEditedUser ? user.copy(unit: unit) : user;
        }).toList());
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
            child: Text('Save'),
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

final allUsers = <User>[
  User(
      quantity: 'Gravitational Acceleration', value: '9.81', unit: 'm/s\u00B2'),
  User(quantity: 'Speed of Sound', value: '330', unit: 'm/s'),
  User(quantity: 'Speed of Light', value: '3 x 10^8', unit: 'm/s'),
  User(
      quantity: 'electrostatic constant',
      value: '9 x 10^9',
      unit: 'nm\u00B2/C\u00B2'),
  User(quantity: '1 coulomb', value: '6.25*10^18', unit: 'C'),
  User(quantity: 'universal gas constant', value: '8.31', unit: 'J/mol K'),
  User(
      quantity: 'charge to mass ratio for electron',
      value: '1.76*10^11',
      unit: 'C/kg'),
  User(quantity: "proton-to-electron mass ration", value: '1840', unit: ''),
  User(quantity: 'solar constant', value: '1.38', unit: 'kW/m\u00B2'),
  User(quantity: 'density of water', value: '1', unit: 'kg/m\u00B3'),
];
