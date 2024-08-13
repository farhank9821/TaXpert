import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Widget logo;
  const CustomTextField({super.key, required this.hintText, required this.controller, required this.logo});

  @override
  Widget build(BuildContext context) {
    return TextFieldPlus(
      controller: controller,
      radius: RadiusPlus.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      height: 60,
      backgroundColor: Color(0xffEFF8F1),
      cursorColor: Colors.black,
      enabled: true,
      //textInputType: TextInputType.number,
      placeholder: TextPlus(
        hintText,
        color: Colors.black38,
      ),
      prefixWidget: logo,
    );
  }
}
