import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guess_what/home.dart';

import 'widgets/leaderboardStreamBuilder.dart';

class LeaderBoardScreen extends StatefulWidget {
  const LeaderBoardScreen({Key? key}) : super(key: key);

  @override
  _LeaderBoardScreenState createState() => _LeaderBoardScreenState();
}

class _LeaderBoardScreenState extends State<LeaderBoardScreen> {
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    CollectionReference contestantsRef = _firestore.collection('contestants');

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(),
                    onPressed: () {
                      Get.offAll(Home());
                    },
                    child: Text(
                      'HOME PAGE',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    )),
              ),
              Container(
                  child:
                      leaderboardStreamBuilder(contestantsRef: contestantsRef)),
            ],
          ),
        ),
      ),
    );
  }
}
