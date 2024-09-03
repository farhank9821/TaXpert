import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class IncomeTaxChart extends StatelessWidget {
  final double grossIncome;
  final double totalDeductionNew;
  final double netTaxPayableNew;
  final double standardDeductionNew;
  final double taxPayableNew;
  final double taxableIncomeNew;
  final double taxesAlreadyPaidNew;
  final double differenceBetween;

  const IncomeTaxChart({
    super.key,
    required this.grossIncome,
    required this.totalDeductionNew,
    required this.netTaxPayableNew,
    required this.standardDeductionNew,
    required this.taxPayableNew,
    required this.taxableIncomeNew,
    required this.taxesAlreadyPaidNew,
    required this.differenceBetween,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.center,
              maxY: grossIncome,
              barGroups: [
                createBarGroup(0, grossIncome, 'Gross Income'),
                createBarGroup(1, totalDeductionNew, 'Total Deduction'),
                createBarGroup(2, netTaxPayableNew, 'Net Tax Payable'),
                createBarGroup(3, standardDeductionNew, 'Standard Deduction'),
                createBarGroup(4, taxPayableNew, 'Tax Payable'),
                createBarGroup(5, taxableIncomeNew, 'Taxable Income'),
                createBarGroup(6, taxesAlreadyPaidNew, 'Taxes Already Paid'),
                createBarGroup(7, differenceBetween, 'Difference'),
              ],
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      const titles = ['GI', 'TD', 'NTP', 'SD', 'TP', 'TI', 'TAP', 'Diff'];
                      return Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          titles[value.toInt()],
                          style: const TextStyle(fontSize: 10),
                        ),
                      );
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 60,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        '₹${value.toInt()}',
                        style: const TextStyle(fontSize: 10),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        _buildEnhancedLegend(context),
      ],
    );
  }

  BarChartGroupData createBarGroup(int x, double value, String label) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: value,
          color: Colors.blue,
          width: 15,
        ),
      ],
    );
  }

  Widget _buildEnhancedLegend(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tax Breakdown',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 12),
            _enhancedLegendItem(context, 'GI', 'Gross Income', grossIncome, Colors.green),
            _enhancedLegendItem(context, 'TD', 'Total Deduction', totalDeductionNew, Colors.red),
            _enhancedLegendItem(context, 'NTP', 'Net Tax Payable', netTaxPayableNew, Colors.orange),
            _enhancedLegendItem(context, 'SD', 'Standard Deduction', standardDeductionNew, Colors.purple),
            _enhancedLegendItem(context, 'TP', 'Tax Payable', taxPayableNew, Colors.blue),
            _enhancedLegendItem(context, 'TI', 'Taxable Income', taxableIncomeNew, Colors.teal),
            _enhancedLegendItem(context, 'TAP', 'Taxes Already Paid', taxesAlreadyPaidNew, Colors.indigo),
            _enhancedLegendItem(context, 'Diff', 'Difference', differenceBetween, Colors.amber),
          ],
        ),
      ),
    );
  }

  Widget _enhancedLegendItem(BuildContext context, String abbreviation, String fullName, double value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                abbreviation,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  fullName,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '₹${value.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
