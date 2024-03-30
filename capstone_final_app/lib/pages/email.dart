import 'package:flutter/material.dart';
import 'package:phone_app/utilities/constants.dart';

import '../components/bottom_button.dart';
import '../components/main_app_background.dart';

class EmailScreen extends StatefulWidget {
  @override
  _EmailScreenState createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  List<String> registeredEmails = [];

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: Text(
                "Registered Emails",
                style: kSubTitleOfPage,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: registeredEmails.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      registeredEmails[index],
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  );
                },
              ),
            ),
            BottomButton(
                onTap: () {
                  _showAddEmailDialog(context);
                },
                buttonText: 'Add Email'),
          ],
        ),
      ),
    );
  }

  void _showAddEmailDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final emailController = TextEditingController();
        return AlertDialog(
          //TODO: check the logic with backend

          title: Text('Add Email'),
          content: TextField(
            controller: emailController,
            decoration: InputDecoration(labelText: 'Enter Email'),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                final newEmail = emailController.text;
                if (newEmail.isNotEmpty) {
                  setState(() {
                    registeredEmails.add(newEmail);
                  });
                  Navigator.pop(context);
                }
              },
              child: Text('Save Email'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: EmailScreen(),
  ));
}
