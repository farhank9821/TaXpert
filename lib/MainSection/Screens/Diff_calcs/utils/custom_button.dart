import 'package:flutter/material.dart';
import 'package:flutter_plus/flutter_plus.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ButtonPlus(
      width: 200,
      height: 60,
      radius: RadiusPlus.all(12),
      color: Color(0xff41854e),
      enabled: true,
      splashColor: Colors.red,
      highlightColor: Colors.yellow,
      focusColor: Colors.green,
      hoverColor: Colors.pink,
      onPressed: onPressed,
      child: TextPlus(
        label,
        color: Colors.white,
      ),
    );
  }
}
