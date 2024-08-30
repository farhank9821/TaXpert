import 'package:flutter/material.dart';
import 'package:tax_xpert/utils/tax_pie.dart';
import 'dart:math';

class TaxBreakdownChart extends StatelessWidget {
  final double netPayPercentage;
  final double totalTaxPercentage;

  const TaxBreakdownChart({
    super.key,
    required this.netPayPercentage,
    required this.totalTaxPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        children: [
          CustomPaint(
            size: const Size(200, 200),
            painter: TaxPieChart(
              netPayPercentage: netPayPercentage,
              totalTaxPercentage: totalTaxPercentage,
            ),
          ),
          Positioned(
            child: SizedBox(
              width: 200,
              height: 200,
              child: CustomPaint(
                painter: LabelPainter(
                  netPayPercentage: netPayPercentage,
                  totalTaxPercentage: totalTaxPercentage,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LabelPainter extends CustomPainter {
  final double netPayPercentage;
  final double totalTaxPercentage;

  LabelPainter({
    required this.netPayPercentage,
    required this.totalTaxPercentage,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = min(size.width, size.height) / 2;

    void drawLabel(String text, String subText, double angle) {
      final labelOffset = Offset(
        center.dx + radius * 0.7 * cos(angle),
        center.dy + radius * 0.7 * sin(angle),
      );

      final textPainter = TextPainter(
        text: TextSpan(
          children: [
            TextSpan(
              text: '$text\n',
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            TextSpan(
              text: subText,
              style: const TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
      );

      textPainter.layout();
      textPainter.paint(
        canvas,
        labelOffset - Offset(textPainter.width / 2, textPainter.height / 2),
      );
    }

    // Draw net pay label
    drawLabel(
      '${netPayPercentage.toStringAsFixed(1)}%',
      'Net pay',
      -pi / 2 + (netPayPercentage / 100) * pi,
    );

    // Draw total tax label
    drawLabel(
      '${totalTaxPercentage.toStringAsFixed(1)}%',
      'Total tax',
      -pi / 2 + ((netPayPercentage + totalTaxPercentage / 2) / 100) * 2 * pi,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
