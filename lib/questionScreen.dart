import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guess_what/home.dart';
import 'package:guess_what/leaderboard.dart';
import 'package:guess_what/result_page.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({Key? key}) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  final _firestore = FirebaseFirestore.instance;
  int questionNumber = 1;
  int correctAnswers = 0;

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    CollectionReference questionsRef = _firestore.collection('question$data');

    return StreamBuilder(
        stream: questionsRef.snapshots(),
        builder: (BuildContext context, AsyncSnapshot asyncsnapshot) {
          List<DocumentSnapshot> listOfDocumentSnap = asyncsnapshot.data.docs;

          return ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        ListTile(
                          title: Center(
                            child: Text(
                                '${listOfDocumentSnap[index]['q$questionNumber']['q$questionNumber' + 'Sent']}'),
                          ),
                        ),
                        answerGeneratorMethod(
                          listOfDocumentSnap,
                          index,
                          0,
                          'A) ',
                          data,
                        ),
                        answerGeneratorMethod(
                          listOfDocumentSnap,
                          index,
                          1,
                          'B) ',
                          data,
                        ),
                        answerGeneratorMethod(
                          listOfDocumentSnap,
                          index,
                          2,
                          'C) ',
                          data,
                        ),
                        answerGeneratorMethod(
                          listOfDocumentSnap,
                          index,
                          3,
                          'D) ',
                          data,
                        ),
                      ],
                    )),
              );
            },
            itemCount: listOfDocumentSnap.length,
          );
        });
  }

  ListTile answerGeneratorMethod(
    List<DocumentSnapshot<Object?>> listOfDocumentSnap,
    int index,
    int answerNo,
    String answerSyntax,
    String topicName,
  ) {
    return ListTile(
      title: Center(
        child: Row(
          children: [
            Text('$answerSyntax '),
            Center(
              child: SizedBox(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.lightBlue,
                      side: BorderSide(width: 3, color: Colors.brown),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      padding: EdgeInsets.all(20)),
                  onPressed: () {
                    setState(() {
                      if (listOfDocumentSnap[index]['q$questionNumber']
                              ['q$questionNumber' 'Answers'][answerNo] ==
                          listOfDocumentSnap[index]['q$questionNumber']
                              ['q$questionNumber' 'Correct']) {
                        correctAnswers++;
                      }
                      if (questionNumber <= 2) {
                        questionNumber++;
                      } else {
                        Get.to(ResultPage(),
                            arguments: [correctAnswers, topicName]);
                      }
                    });
                  },
                  child: Text(
                    '${listOfDocumentSnap[index]['q$questionNumber']['q$questionNumber' 'Answers'][answerNo]}',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
