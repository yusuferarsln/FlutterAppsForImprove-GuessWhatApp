import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class leaderboardStreamBuilder extends StatelessWidget {
  const leaderboardStreamBuilder({
    Key? key,
    required this.contestantsRef,
  }) : super(key: key);

  final CollectionReference<Object?> contestantsRef;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: contestantsRef
            .orderBy('CorrectAnswers', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot asyncsnapshot) {
          List<DocumentSnapshot> listOfDocumentSnap = asyncsnapshot.data.docs;

          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              if (index == 0 || index == 1 || index == 2) {
                return Card(
                  color: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      title: Center(
                          child: Text(
                              '${index + 1} | Contestant: ${listOfDocumentSnap[index]['name']}' +
                                  ' / '
                                      'Topic: ${listOfDocumentSnap[index]['topic']} / Points : ${listOfDocumentSnap[index]['CorrectAnswers']} ')),
                    ),
                  ),
                );
              } else {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      title: Center(
                          child: Text(
                              '${index + 1} : ${listOfDocumentSnap[index]['name']}' +
                                  '/'
                                      'Topic: ${listOfDocumentSnap[index]['topic']} Points : ${listOfDocumentSnap[index]['CorrectAnswers']} ')),
                    ),
                  ),
                );
              }
            },
            itemCount: listOfDocumentSnap.length,
          );
        });
  }
}
