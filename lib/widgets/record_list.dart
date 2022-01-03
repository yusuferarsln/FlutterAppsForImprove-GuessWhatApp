import 'package:flutter/material.dart';

class RecordList extends StatelessWidget {
  const RecordList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: ListTile(
          leading: Icon(Icons.ac_unit),
          title: Center(child: Text('bla bla')),
        ),
      ),
    );
  }
}
