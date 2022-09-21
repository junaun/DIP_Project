import 'dart:ui';
import "package:calculator/services/displayStrController.dart";
import 'package:flutter/material.dart';

class ContainerHistory extends StatefulWidget {
  late DisplayStrController strController;
  ContainerHistory(this.strController);
  @override
  containerHistoryState createState() => containerHistoryState();
}

class containerHistoryState extends State<ContainerHistory> {
  late TextEditingController _num1FieldController, _num2FieldController;
  late String _messageToUser;
  final _saved = [];
  final _biggerFont = const TextStyle(fontSize: 18);

  final ScrollController _controller = ScrollController();

// scroll to bottom
  void _scrollDown() {
    _controller.animateTo(
      _controller.position.maxScrollExtent + 100,
      duration: Duration(milliseconds: 1500),
      curve: Curves.fastOutSlowIn,
    );
  }

  /// State

  @override
  void initState() {
    super.initState();
    _num1FieldController = TextEditingController();
    _num2FieldController = TextEditingController();
    _messageToUser = "";
  }

  @override
  void dispose() {
    _num1FieldController.dispose();
    _num2FieldController.dispose();
    super.dispose();
  }

  /// Build

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(child: _historyCont(), flex: 3),
            Expanded(child: _buildnum1TextField(), flex: 1),
            Expanded(child: _buildnum2TextField(), flex: 1),
            Expanded(child: _buildResultArea(), flex: 1),
          ],
        ),
      ),
    );
  }

  Widget _buildnum1TextField() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: TextField(
          controller: _num1FieldController,
          decoration: _buildDecoration("Num1:"),
          keyboardType: TextInputType.number),
    );
  }

  Widget _buildnum2TextField() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: TextField(
        controller: _num2FieldController,
        decoration: _buildDecoration("Num2:"),
        keyboardType: TextInputType.number,
      ),
    );
  }

  InputDecoration _buildDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
    );
  }

  Widget _buildResultArea() {
    return Row(
      children: <Widget>[
        TextButton(
            child: Text("Submit"),
            onPressed: () {
              _updateResults();
              _scrollDown();
            }),
        SizedBox(
          width: 15.0,
        ),
        Text(_messageToUser, textAlign: TextAlign.center),
      ],
    );
  }

  Widget _historyCont() {
    return Container(
      // height: 150,
      // width: 500,
      child: ListView.builder(
          controller: _controller,
          shrinkWrap: true,
          itemCount: _saved.length,
          itemBuilder: ((context, index) =>
              ListTile(title: Text('${_saved[index]}')))),
    );
  }

  /// Actions

  void _updateResults() {
    num _intSum = int.parse(_num1FieldController.text) /
        int.parse(_num2FieldController.text);
    String _intString = _intSum.toString();
    setState(() {
      _messageToUser = _num1FieldController.text +
          "/" +
          _num2FieldController.text +
          " = " +
          _intString;
      _saved.add(_messageToUser);
    });
  }
}
