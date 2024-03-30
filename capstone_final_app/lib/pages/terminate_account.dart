import 'package:flutter/material.dart';
import 'package:phone_app/pages/settings.dart';
import 'package:phone_app/utilities/constants.dart';
import '../components/bottom_navigation_bar.dart';

import '../components/main_app_background.dart';

import 'Friends.dart';
import 'homePage.dart';

class Terminate extends StatefulWidget {
  const Terminate({Key? key}) : super(key: key);

  @override
  TerminateState createState() => TerminateState();
}

class TerminateState extends State<Terminate> {
  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLoginRegisterBtnColour.withOpacity(0.9),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: CustomGradientContainerSoft(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            switch (_currentIndex) {
              case 0:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(title: "Home Page"),
                  ),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyFriendScreen(title: ''),
                  ),
                );
                break;
              case 2:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Setting(title: "Settings"),
                  ),
                );
                break;
            }
          });
        },
        label1: 'Home',
        label2: 'Friends',
        label3: 'Settings',
        icon1: Icons.home,
        icon2: Icons.group,
        icon3: Icons.settings,
        currentIndex: _currentIndex,
      ),
    );
  }
}
