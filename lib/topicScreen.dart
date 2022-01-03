import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guess_what/controller.dart';
import 'package:guess_what/questionScreen.dart';
import 'package:guess_what/services/auths_services.dart';
import 'package:guess_what/widgets/record_list.dart';

class TopicScreen extends StatefulWidget {
  const TopicScreen({Key? key}) : super(key: key);

  @override
  _TopicScreenState createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  final _firestore = FirebaseFirestore.instance;
  List<bool> isSelected = [false, false, false, false, false, false];
  final controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    CollectionReference topicsRef = _firestore.collection('questionSports');
    var questionTopicRef = topicsRef.doc();
    CollectionReference userRef = _firestore.collection('UsersCollection');
    var data = Get.arguments;

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('TOPICS')),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          record_listM('Sports', 0, Icon(Icons.directions_run)),
          record_listM('Magazine', 1, Icon(Icons.people)),
          record_listM('Agenda', 2, Icon(Icons.public)),
          SizedBox(
            height: 50,
            child: Center(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Choose a Topic for start Guessing',
                    style: TextStyle(fontSize: 22),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Card record_listM(String topicName, int topicNumber, Icon icon) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
        child: ListTile(
          selected: isSelected[topicNumber],
          tileColor: isSelected[topicNumber] ? Colors.blue : null,
          leading: icon,
          title: Center(child: Text('$topicName')),
          onTap: () {
            setState(() {
              if (topicNumber == 0) {
                isSelected[topicNumber] = !isSelected[topicNumber];
                isSelected[1] = false;
                isSelected[2] = false;
                isSelected[3] = false;
                isSelected[4] = false;
                Get.to(QuestionScreen(), arguments: topicName);
              } else if (topicNumber == 1) {
                isSelected[topicNumber] = !isSelected[topicNumber];
                isSelected[0] = false;
                isSelected[2] = false;
                isSelected[3] = false;
                isSelected[4] = false;
                Get.to(QuestionScreen(), arguments: topicName);
              } else if (topicNumber == 2) {
                isSelected[topicNumber] = !isSelected[topicNumber];
                isSelected[1] = false;
                isSelected[3] = false;
                isSelected[0] = false;
                isSelected[4] = false;
                Get.to(QuestionScreen(), arguments: topicName);
              } else if (topicNumber == 3) {
                isSelected[topicNumber] = !isSelected[topicNumber];
                isSelected[0] = false;
                isSelected[2] = false;
                isSelected[1] = false;
                Get.to(QuestionScreen(), arguments: topicName);
                print(isSelected[topicNumber]);
              } else if (topicNumber == 4) {
                isSelected[topicNumber] = !isSelected[topicNumber];
                isSelected[0] = false;
                isSelected[2] = false;
                isSelected[3] = false;
                isSelected[1] = false;
                Get.to(QuestionScreen(), arguments: topicName);
              }
            });
          },
        ),
      ),
    );
  }
}
