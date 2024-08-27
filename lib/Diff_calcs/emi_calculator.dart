import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class LoanCalculatorScreen extends StatefulWidget {
  const LoanCalculatorScreen({super.key});

  @override
  _LoanCalculatorScreenState createState() => _LoanCalculatorScreenState();
}

class _LoanCalculatorScreenState extends State<LoanCalculatorScreen> {
  final _amountController = TextEditingController();
  final _tenureController = TextEditingController();
  final _rateController = TextEditingController();
  String _tenureUnit = 'Years';

  double _emi = 0.0;
  double _totalInterest = 0.0;
  double _totalAmount = 0.0;
  double _yearlyAmount = 0.0;

  void _calculateLoan() {
    final double amount = double.tryParse(_amountController.text) ?? 0.0;
    final double rate = double.tryParse(_rateController.text) ?? 0.0;
    final int tenure = int.tryParse(_tenureController.text) ?? 0;

    if (amount > 0 && tenure > 0 && rate > 0) {
      final monthlyRate = rate / 12 / 100;
      final int numberOfPayments = _tenureUnit == 'Years' ? tenure * 12 : tenure;

      _emi = amount * monthlyRate * pow(1 + monthlyRate, numberOfPayments) / (pow(1 + monthlyRate, numberOfPayments) - 1);

      _totalAmount = _emi * numberOfPayments;
      _totalInterest = _totalAmount - amount;
      _yearlyAmount = _emi * 12;
    } else {
      _emi = 0.0;
      _totalInterest = 0.0;
      _totalAmount = 0.0;
      _yearlyAmount = 0.0;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loan Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _amountController,
              decoration: const InputDecoration(labelText: 'Loan Amount'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _tenureController,
              decoration: const InputDecoration(labelText: 'Loan Tenure'),
              keyboardType: TextInputType.number,
            ),
            DropdownButton<String>(
              value: _tenureUnit,
              items: ['Years', 'Months'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _tenureUnit = newValue!;
                });
              },
            ),
            TextField(
              controller: _rateController,
              decoration: const InputDecoration(labelText: 'Rate of Interest (%)'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateLoan,
              child: const Text('Calculate'),
            ),
            const SizedBox(height: 20),
            if (_emi > 0)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Monthly EMI: ${NumberFormat.currency(symbol: '₹').format(_emi)}'),
                  Text('Principal Amount: ${NumberFormat.currency(symbol: '₹').format(double.tryParse(_amountController.text) ?? 0)}'),
                  Text('Total Interest: ${NumberFormat.currency(symbol: '₹').format(_totalInterest)}'),
                  Text('Total Amount: ${NumberFormat.currency(symbol: '₹').format(_totalAmount)}'),
                  Text('Yearly Amount to be Paid: ${NumberFormat.currency(symbol: '₹').format(_yearlyAmount)}'),
                  const SizedBox(height: 20),
                  Container(
                    height: 200,
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            color: Colors.blue,
                            value: double.tryParse(_amountController.text) ?? 0,
                            title: 'Principal',
                            titleStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          PieChartSectionData(
                            color: Colors.red,
                            value: _totalInterest,
                            title: 'Interest',
                            titleStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ],
                        centerSpaceRadius: 40,
                        sectionsSpace: 2,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
