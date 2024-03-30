import 'package:flutter/material.dart';
import 'package:phone_app/components/bottom_button.dart';
import 'package:phone_app/utilities/constants.dart';

import '../components/input_text_field.dart';
import '../components/main_app_background.dart';

class ContactUsScreen extends StatelessWidget {
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
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 30.0, 0),
                  child: const Center(
                    child: Text(
                      "Contact Us",
                      style: kSubTitleOfPage,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
                  child: Center(
                    child: Text("Fill out the form to get in contact",
                        style: kSimpleTextWhite),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                  child: Container(
                      margin: EdgeInsets.only(bottom: 16),
                      child: InputTextField(
                        buttonText: 'Subject',
                      )),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 16.0),
                  child: Container(
                    child: InputTextField(
                      buttonText: 'Message',
                      height: 200,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                BottomButton(
                  onTap: () {
                    //TODO: logic for sending messages to support
                  },
                  buttonText: 'Send',
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
