import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guess_what/leaderboard.dart';

class ResultPage extends StatefulWidget {
  ResultPage({Key? key}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  var nameController = TextEditingController();

  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    final _firestore = FirebaseFirestore.instance;
    Map<String, dynamic> userDataResult = {
      'name': nameController.text,
      'topic': data[1],
      'CorrectAnswers': data[0]
    };
    if (nameController.text == '') {
      nameController.text = 'Unnamed';
    } else {
      nameController.text = nameController.text;
    }
    CollectionReference contestantsRef = _firestore.collection('contestants');
    contestantsRef.doc('${nameController.text}').set(userDataResult);

    return Column(children: [
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: ListTile(
            leading: Icon(Icons.ac_unit),
            title: Center(child: Text('Topic : ${data[1]}')),
          ),
        ),
      ),
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: ListTile(
            leading: Icon(Icons.ac_unit),
            title: Center(child: Text('Correct Answers : ${data[0]}')),
          ),
        ),
      ),
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: TextField(
            controller: nameController,
            textAlign: TextAlign.center,
          ),
        ),
      ),
      ElevatedButton(
          onPressed: () {
            setState(() {
              Get.to(LeaderBoardScreen(), arguments: [data[0], data[1]]);
            });
          },
          child: Text('Go to leaderboard')),
    ]);
  }
}
