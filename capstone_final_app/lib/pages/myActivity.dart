import 'package:flutter/material.dart';
import 'package:phone_app/pages/settings.dart';
import 'package:phone_app/utilities/constants.dart';
import '../components/bottom_navigation_bar.dart';
import '../components/main_app_background.dart';
import '../services/timer.dart';
import '../components/bottom_button.dart';
import '../components/activity_buttons.dart';
import 'Friends.dart';
import 'homePage.dart';
import 'workout.dart';

class MyActivity extends StatefulWidget {
  const MyActivity({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyActivity> createState() => _MyActivityState();
}

class _MyActivityState extends State<MyActivity> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            // scroll the screen with finger - up & down
            child: CustomGradientContainerSoft(
              // use the same background once logged in for every page
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 70),
                    Container(
                      width: double.infinity,
                      child: Text(
                        "Activity Type",
                        style: kSubTitleOfPage,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(height: 40),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ActivityButton(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Workout(
                                        title: '',
                                      )),
                            );
                          },
                          buttonText: 'Walking',
                          width: 300,
                        ),
                        SizedBox(height: 10),
                        ActivityButton(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TimerPage(title: '')),
                            );
                          },
                          buttonText: 'Running',
                          width: 300,
                        ),
                        SizedBox(height: 10),
                        // Yoga button
                        ActivityButton(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TimerPage(title: '')),
                            );
                          },
                          buttonText: 'Yoga',
                          width: 300,
                        ),
                        SizedBox(height: 10),
                        // Sports button
                        ActivityButton(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TimerPage(title: '')),
                            );
                          },
                          buttonText: 'Sports',
                          width: 300,
                        ),
                        SizedBox(height: 10),
                        // Aerobic button
                        ActivityButton(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TimerPage(title: '')),
                            );
                          },
                          buttonText: 'Aerobic',
                          width: 300,
                        ),
                        SizedBox(height: 10),
                        // Jumba button
                        ActivityButton(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TimerPage(title: '')),
                            );
                          },
                          buttonText: 'Jumba',
                          width: 300,
                        ),
                        SizedBox(height: 60),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
