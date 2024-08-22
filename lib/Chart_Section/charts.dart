import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ChartType {
  grossVsTaxable,
  oldVsNewRegime,
  oldTaxVsNewTax,
}

class TaxChart extends ConsumerWidget {
  final double grossIncome;
  final double taxPayableNew;
  final double taxableIncome;
  final double oldRegimeTax;
  final double newRegimeTax;

  const TaxChart({
    Key? key,
    required this.grossIncome,
    required this.taxableIncome,
    required this.taxPayableNew,
    required this.oldRegimeTax,
    required this.newRegimeTax,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedChartType = ref.watch(chartTypeProvider);

    return Column(
      children: [
        DropdownButton<ChartType>(
          value: selectedChartType,
          onChanged: (ChartType? newValue) {
            if (newValue != null) {
              ref.read(chartTypeProvider.notifier).state = newValue;
            }
          },
          items: ChartType.values.map<DropdownMenuItem<ChartType>>((ChartType value) {
            return DropdownMenuItem<ChartType>(
              value: value,
              child: Text(_getChartTypeName(value)),
            );
          }).toList(),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 300,
          child: _buildChart(selectedChartType),
        ),
      ],
    );
  }

  String _getChartTypeName(ChartType type) {
    switch (type) {
      case ChartType.grossVsTaxable:
        return 'Gross Income vs Taxable Income';
      case ChartType.oldVsNewRegime:
        return 'Old Regime vs New Regime';
      case ChartType.oldTaxVsNewTax:
        return 'Old Tax vs New Tax';
    }
  }

  Widget _buildChart(ChartType type) {
    switch (type) {
      case ChartType.grossVsTaxable:
        return _buildGrossVsTaxableDoughnutChart();
      case ChartType.oldVsNewRegime:
        return _buildOldVsNewRegimeBarChart();
      case ChartType.oldTaxVsNewTax:
        return _buildOldTaxVsNewTaxBarChart();
    }
  }

  // Doughnut chart for Gross Income vs Taxable Income
  Widget _buildGrossVsTaxableDoughnutChart() {
    double nonTaxableIncome = grossIncome - taxableIncome;
    return PieChart(
      PieChartData(
        titleSunbeamLayout: true,
        sectionsSpace: 0,
        centerSpaceRadius: 70,
        sections: grossIncome > 0 && taxableIncome > 0
            ? [
                PieChartSectionData(
                  color: Colors.blue,
                  value: grossIncome,
                  title: 'Gross',
                  showTitle: true,
                  radius: 100,
                  titleStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                PieChartSectionData(
                  color: Colors.green,
                  value: taxPayableNew,
                  title: 'Tax',
                  radius: 100,
                  titleStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ]
            : [
                PieChartSectionData(
                  color: Colors.grey,
                  value: 1,
                  title: 'No Data',
                  radius: 100,
                  titleStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
      ),
    );
  }

  // Bar chart for Old Regime vs New Regime
  Widget _buildOldVsNewRegimeBarChart() {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: grossIncome > 0 ? grossIncome : 100,
        barTouchData: BarTouchData(enabled: false),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                switch (value.toInt()) {
                  case 0:
                    return const Text('Old Regime');
                  case 1:
                    return const Text('New Regime');
                  default:
                    return const Text('');
                }
              },
              reservedSize: 38,
            ),
          ),
          leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(toY: grossIncome > 0 ? grossIncome - oldRegimeTax : 50, color: Colors.blue),
            ],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(toY: grossIncome > 0 ? grossIncome - newRegimeTax : 60, color: Colors.green),
            ],
          ),
        ],
      ),
    );
  }

  // Bar chart for Old Tax vs New Tax comparison
  Widget _buildOldTaxVsNewTaxBarChart() {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: oldRegimeTax > newRegimeTax
            ? oldRegimeTax
            : newRegimeTax > 0
                ? newRegimeTax
                : 100,
        barTouchData: BarTouchData(enabled: false),
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                switch (value.toInt()) {
                  case 0:
                    return const Text('Old Tax');
                  case 1:
                    return const Text('New Tax');
                  default:
                    return const Text('');
                }
              },
              reservedSize: 38,
            ),
          ),
          leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        ),
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(toY: oldRegimeTax > 0 ? oldRegimeTax : 50, color: Colors.red),
            ],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(toY: newRegimeTax > 0 ? newRegimeTax : 60, color: Colors.orange),
            ],
          ),
        ],
      ),
    );
  }
}

final chartTypeProvider = StateProvider<ChartType>((ref) => ChartType.grossVsTaxable);
