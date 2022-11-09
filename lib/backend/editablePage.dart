import 'package:flutter/material.dart';

class EditablePage extends StatefulWidget {
  @override
  _EditablePageState createState() => _EditablePageState();
}

class _EditablePageState extends State<EditablePage> {
  late List<User> users;

  @override
  void initState() {
    super.initState();

    users = List.of(allUsers);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: ScrollableWidget(child: buildDataTable()),
      );

  Widget buildDataTable() {
    final columns = ['Quantity', 'Value', 'Label'];

    return DataTable(
      columns: getColumns(columns),
      rows: getRows(users),
    );
  }

  List<DataColumn> getColumns(List<String> columns) {
    return columns.map((String column) {
      return DataColumn(
        label: Text(column),
      );
    }).toList();
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

class ScrollableWidget extends StatelessWidget {
  final Widget child;

  const ScrollableWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: child,
        ),
      );
}

class TabBarWidget extends StatelessWidget {
  final String title;
  final List<Tab> tabs;
  final List<Widget> children;

  const TabBarWidget({
    Key? key,
    required this.title,
    required this.tabs,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Constant Table"),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.purple, Colors.blue],
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
              ),
            ),
          ),
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Color.fromARGB(255, 234, 161, 161),
            indicatorWeight: 5,
            tabs: tabs,
          ),
          elevation: 20,
          titleSpacing: 20,
        ),
        body: TabBarView(children: children),
      ),
    );
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

final allUsers = <User>[
  User(quantity: 'Gravitational Acceleration', value: '9.8', unit: 'g'),
  User(quantity: 'Mass of Earth', value: '5.97 x 10^24', unit: 'kg'),
  User(quantity: 'Unit gas constant', value: '8.314', unit: 'J/mol K'),
  User(quantity: '', value: '', unit: ''),
  User(quantity: '', value: '', unit: ''),
  User(quantity: '', value: '', unit: ''),
  User(quantity: '', value: '', unit: ''),
  User(quantity: '', value: '', unit: ''),
  User(quantity: '', value: '', unit: ''),
  User(quantity: '', value: '', unit: ''),
];
