import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:tax_xpert/Diff_calcs/income_tax_calculator.dart';
import 'package:tax_xpert/Diff_calcs/utils/condition_column.dart';
import 'package:tax_xpert/utils/numberFormat.dart';
import 'dart:math';

import 'package:tax_xpert/utils/number_to_words.dart';

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
    final double amount = double.tryParse(_amountController.text.replaceAll(',', '')) ?? 0.0;
    final double rate = double.tryParse(_rateController.text.replaceAll(',', '')) ?? 0.0;
    final int tenure = int.tryParse(_tenureController.text.replaceAll(',', '')) ?? 0;

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

  final NumberToWordsConverter _converter = NumberToWordsConverter(); // Instantiate the class
  String _labelText = 'Loan Amount';

  void _updateLabelText(String value, TextEditingController _controller) {
    if (value.isEmpty) {
      setState(() {
        _labelText = "Salary";
      });
      return;
    }

    int val = int.parse(_controller.text.replaceAll(',', ''));

    setState(() {
      _labelText = _converter.numberToWords(val); // Use the class method
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Loan Calculator'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  controller: _amountController,
                  decoration: InputDecoration(
                    labelText: _labelText,
                    hintText: "Enter your Salary",
                    border: const OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => _updateLabelText(value, _amountController),
                  inputFormatters: [
                    NumberInputFormatter(),
                  ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a number';
                    }
                    return null;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _tenureController,
                        decoration: const InputDecoration(labelText: 'Loan Tenure'),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Expanded(
                      child: DropdownButton<String>(
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
                    ),
                  ],
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
                      ConditionColumn(
                        name: 'Monthly EMI',
                        value: _emi,
                        check_Condition: _emi > 0,
                        isHighlighted: false,
                      ),
                      ConditionColumn(
                        name: 'Principal Amount',
                        value: double.tryParse(_amountController.text.replaceAll(',', '')) ?? 0.0,
                        check_Condition: _emi > 0,
                        isHighlighted: false,
                      ),
                      ConditionColumn(
                        name: 'Total Interest',
                        value: _totalInterest,
                        check_Condition: _emi > 0,
                        isHighlighted: false,
                      ),
                      ConditionColumn(
                        name: 'Total Amount',
                        value: _totalAmount,
                        check_Condition: _emi > 0,
                        isHighlighted: false,
                      ),
                      ConditionColumn(
                        name: 'Yearly Amount to be Paid',
                        value: _yearlyAmount,
                        check_Condition: _emi > 0,
                        modifier: '* ',
                        isHighlighted: true,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        height: 200,
                        child: PieChart(
                          PieChartData(
                            sections: [
                              PieChartSectionData(
                                color: Colors.blue,
                                value: double.tryParse(_amountController.text.replaceAll(',', '')) ?? 0,
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
        ),
      ),
    );
  }
}
