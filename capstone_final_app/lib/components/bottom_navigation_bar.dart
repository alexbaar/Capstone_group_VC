import 'package:flutter/material.dart';
import 'package:phone_app/pages/homePage.dart';
import 'package:phone_app/utilities/constants.dart';

class BottomNavBar extends StatelessWidget {
  // custom constructor
  BottomNavBar({
    required this.onTap,
    required this.label1,
    required this.label2,
    required this.label3,
    required this.icon1,
    required this.icon2,
    required this.icon3,
    required this.currentIndex,
  });

  final Function(int)? onTap;
  final String label1;
  final String label2;
  final String label3;
  final IconData icon1;
  final IconData icon2;
  final IconData icon3;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: kLoginRegisterBtnColour.withOpacity(0.9),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white54,
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(icon1),
          label: label1,
        ),
        BottomNavigationBarItem(
          icon: Icon(icon2),
          label: label2,
        ),
        BottomNavigationBarItem(
          icon: Icon(icon3),
          label: label3,
        ),
      ],
    );
  }
}
