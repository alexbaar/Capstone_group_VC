import 'package:flutter/material.dart';
import 'package:phone_app/components/bottom_button.dart';
import 'package:phone_app/components/bottom_navigation_bar.dart';
import 'package:phone_app/pages/Friends.dart';
import 'package:phone_app/pages/homePage.dart';
import 'package:phone_app/pages/settings.dart';
import 'package:phone_app/utilities/constants.dart';

import '../components/main_app_background.dart';

class Workout extends StatefulWidget {
  const Workout({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<Workout> createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  int _currentIndex = 0;
  String elapsedTime = "00:00:00";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: CustomGradientContainerSoft(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 40),
                  Text(
                    "Workout",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: WorkoutMetricBox(
                              label: "Speed",
                              value: "15 KM/Hr",
                            ),
                          ),
                          Expanded(
                            child: WorkoutMetricBox(
                              label: "Cadence",
                              value: "60 RPM",
                            ),
                          ),
                        ],
                      ),
                      Row(
                        // Second Row
                        children: [
                          Expanded(
                            child: WorkoutMetricBox(
                              label: "Distance",
                              value: "3.8 KM",
                            ),
                          ),
                          Expanded(
                            child: WorkoutMetricBox(
                              label: "Oxygen",
                              value: "96%",
                            ),
                          ),
                        ],
                      ),
                      Row(
                        // Third Row
                        children: [
                          Expanded(
                            child: WorkoutMetricBox(
                              label: "Heart Rate",
                              value: "140 BPM",
                            ),
                          ),
                          Expanded(
                            child: WorkoutMetricBox(
                              label: "Temperature",
                              value: "36.7°C",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Text(
                    "Time Elapsed",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "$elapsedTime",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Container(
                              width: 300,
                              child: BottomButton(
                                  //TODO implement logic
                                  onTap: () {},
                                  buttonText: 'Finish')),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
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
                    builder: (context) => const HomePage(title: "Home Page"),
                  ),
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyFriendScreen(title: ''),
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

//TODO: check what the below does and implement

class WorkoutMetricBox extends StatelessWidget {
  final String label;
  final String value;

  WorkoutMetricBox({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          color: Colors.white.withOpacity(0.3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: kHomeBtnColours.withOpacity(0.4),
                padding: EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Center(
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
