import 'package:flutter/material.dart';
import 'package:phone_app/utilities/constants.dart';
import '../components/bottom_button.dart';
import '../components/input_text_field.dart';
import '../components/main_app_background.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class EditProfileActivity extends StatefulWidget {
  const EditProfileActivity({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<EditProfileActivity> createState() => _EditProfileActivityState();
}

class _EditProfileActivityState extends State<EditProfileActivity> {
  int _currentIndex = 0;
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
  Future<void> _saveProfile() async {
    // Prepare the data you want to send in the PUT request
    final Map<String, dynamic> updatedData = {
      "user": _firstNameController.text,
      "last": _lastNameController.text,
      "user": _usernameController.text,
      "email": _emailController.text,
    };

    try {
      final response = await http.put(
        Uri.parse('http://10.141.9.203:3000/api/data/update'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(updatedData),
      );

      if (response.statusCode == 200) {
        // Handle success here if needed
        print('Profile updated successfully');
      } else {
        // Handle errors here
        print('Failed to update profile: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network errors here
      print('Error: $e');
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLoginRegisterBtnColour
            .withOpacity(0.9), // Set the background color
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.of(context).pop(); // This will navigate back.
          },
        ),
      ),
      body: CustomGradientContainerSoft(
        child: Stack(
          children: [
            Container(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 50),
                    Container(
                      width: double.infinity,
                      child: const Text(
                        "Edit Profile",
                        style: kSubTitleOfPage,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: InputTextField(
                                  buttonText: 'First Name',
                                  fieldController: _firstNameController,
                                ),
                              ),

                              SizedBox(width: 16), // Add spacing between fields
                              Expanded(
                                child: InputTextField(
                                  buttonText: 'Last Name',
                                  fieldController: _lastNameController,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          InputTextField(
                            buttonText: 'Username',
                            fieldController: _usernameController,
                          ),
                          SizedBox(height: 20),
                          InputTextField(
                            buttonText: 'Email',
                            fieldController: _emailController,
                          ),
                          SizedBox(height: 70),
                          BottomButton(
                              onTap: () {
                                _saveProfile;
                              },
                              buttonText: 'Save'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   onTap: (index) {
      //     setState(() {
      //       _currentIndex = index;
      //       switch (_currentIndex) {
      //         case 0:
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => HomePage(title: "HomePage"),
      //             ),
      //           );
      //           break;
      //         case 1:
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => MyActivity(title: "MyActivity"),
      //             ),
      //           );
      //           break;
      //         case 2:
      //           Navigator.push(
      //             context,
      //             MaterialPageRoute(
      //               builder: (context) => Setting(title: "MyHomePage"),
      //             ),
      //           );
      //           break;
      //       }
      //     });
      //   },
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.accessibility),
      //       label: 'Activities',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.settings),
      //       label: 'Settings',
      //     ),
      //   ],
      // ),
    );
  }
}
