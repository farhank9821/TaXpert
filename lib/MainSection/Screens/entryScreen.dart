import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tax_xpert/MainSection/Screens/enterYourbasc.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xff92B79F),
      body: Column(
        children: [
          Material(
            elevation: 10,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50.0), // Adjust the radius as needed
              bottomRight: Radius.circular(50.0), // Adjust the radius as needed
            ),
            child: Container(
              width: 400,
              height: 500,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50.0), // Adjust the radius as needed
                  bottomRight: Radius.circular(50.0), // Adjust the radius as needed
                ),
                color: Color(0xff25472B),
              ),
              child: Column(
                children: [
                  Image.asset(
                    "assets/TAXX-01.png",
                    width: 500,
                    height: 500,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
        ],
      ),
    ));
  }
}
