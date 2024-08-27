import 'dart:math';
import 'package:flutter/material.dart';

class TaxPieChart extends CustomPainter {
  final double netPayPercentage;
  final double totalTaxPercentage;

  TaxPieChart({
    required this.netPayPercentage,
    required this.totalTaxPercentage,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2;

    final netPayPaint = Paint()
      ..color = Colors.purple
      ..style = PaintingStyle.fill;

    final taxPaint = Paint()
      ..color = Colors.lightBlue
      ..style = PaintingStyle.fill;

    // Draw net pay arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * (netPayPercentage / 100),
      true,
      netPayPaint,
    );

    // Draw total tax arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2 + 2 * pi * (netPayPercentage / 100),
      2 * pi * (totalTaxPercentage / 100),
      true,
      taxPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
