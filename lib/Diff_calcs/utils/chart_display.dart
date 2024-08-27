import 'package:flutter/material.dart';
import 'package:tax_xpert/utils/tax_pie.dart';

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
    return Container(
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
            top: 10,
            right: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '${totalTaxPercentage.toStringAsFixed(1)}%',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  'Total tax',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${netPayPercentage.toStringAsFixed(1)}%',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Text(
                  'Net pay',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
