import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:phone_app/components/see_password_toggle_icon.dart';
import 'package:phone_app/utilities/constants.dart';
import 'package:phone_app/pages/login.dart';
import 'package:phone_app/components/text_tap_button.dart';
import '../components/bottom_button.dart';
import '../components/input_text_field.dart';
import '../components/login_signup_background.dart'; // Import the http package

void main() {
  runApp(SignUpApp());
}

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
    );
  }
}

class SignUpPage extends StatelessWidget {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // Function to make a POST request to your API
  Future<void> signUp() async {
    //final apiUrl = 'http://192.168.237.105:3000/api/device/add';

    final apiUrl = 'http://192.168.1.104:8000/signup/';

    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'user': usernameController.text,
        'email': emailController.text,
        'password': passwordController.text
      },
    );

    if (response.statusCode == 302) {
      // Success! You can handle the response here if needed.
      print('Sign-up successful!');
    } else {
      // Error handling here, you can show an error message to the user.
      print('Sign-up failed. Status code: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SingleChildScrollView(
        child: CustomGradientContainerFull(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 15.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Image(
                          image: AssetImage('lib/assets/redbacklogo.png'),
                          height: 70,
                        ),
                        TextTapButton(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          buttonTextActive: 'Log In',
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 22),
                Text(
                  'Sign Up',
                  style: kRedbackTextMain,
                ),
                SizedBox(height: 32),
                InputTextField(
                  buttonText: 'username',
                  fieldController: usernameController,
                  // don't toggle, just visible
                ),
                SizedBox(height: 15),
                InputTextField(
                  buttonText: 'email',
                  fieldController: emailController,
                  // don't toggle, just visible
                ),
                SizedBox(height: 15),
                InputTextField(
                  buttonText: 'password',
                  fieldController: passwordController,
                  enableToggle: true, // toggle visibility
                ),
                SizedBox(height: 15),
                InputTextField(
                  buttonText: 'confirm password',
                  fieldController: confirmPasswordController,
                  enableToggle: true, // toggle visibility
                ),
                SizedBox(height: 60),
                BottomButton(
                    onTap: () {
                      signUp();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    buttonText: 'Sign Up'),
                SizedBox(height: 26),
                TextTapButton(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    buttonTextStatic: 'Already have an account?  ',
                    buttonTextActive: 'Log In'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
