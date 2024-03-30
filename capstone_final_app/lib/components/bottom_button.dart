import 'package:flutter/material.dart';
import 'package:phone_app/utilities/constants.dart';

class BottomButton extends StatelessWidget {
  // custom constructor
  BottomButton({required this.onTap, required this.buttonText, this.width});

  // use VoidCallback instead of Function
  final VoidCallback onTap;
  final String buttonText;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Text(
          buttonText,
          style: kBottomButtonText,
        ),
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 10.0, bottom: 40),
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        width: width ?? 180, // 180 by default if not provided
        height: kBottomContainerHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: kLoginRegisterBtnColour,

          // Adjust border radius as needed
        ),
        /*child: TextButton(
          onPressed: () {
            // Navigate back to first route when tapped.
            // with old setup:

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return SecondRoute();
                },
              ),
            );


            // with routes:
            Navigator.pushNamed(context, '/second');
          },*/
      ),
    );
  }
}
