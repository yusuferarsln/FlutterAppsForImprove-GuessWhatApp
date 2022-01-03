import 'package:flutter/material.dart';
import 'package:guess_what/leaderboard.dart';
import 'package:guess_what/login_auth/login_page.dart';
import 'package:guess_what/questionScreen.dart';
import 'package:guess_what/services/auths_services.dart';
import 'package:guess_what/topicScreen.dart';
import 'main.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:get/get.dart';
import 'leaderboard.dart';
import 'questionScreen.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentTab = 0;
  Widget _currentScreen = TopicScreen();

  @override
  Widget build(BuildContext context) {
    // var data = Get.arguments;
    return Scaffold(
      body: _currentScreen,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.remove),
        onPressed: () {
          AuthController.instance.logOut();
        },
        backgroundColor: Colors.black,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
          height: Get.height / 12,
          activeColor: Colors.white,
          inactiveColor: Colors.grey,
          gapLocation: GapLocation.center,
          backgroundColor: Colors.black,
          icons: [Icons.show_chart, Icons.history],
          iconSize: 30,
          activeIndex: _currentTab,
          onTap: (int) {
            setState(() {
              _currentTab = int;
              _currentScreen = (int == 0) ? TopicScreen() : LeaderBoardScreen();
              //   if (data == 'leaderboard') {
              //    LeaderBoardScreen();
              // }
            });
          }),
    );
  }
}
