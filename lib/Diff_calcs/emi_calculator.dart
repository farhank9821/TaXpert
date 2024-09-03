import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:tax_xpert/Diff_calcs/utils/condition_column.dart';
import 'package:tax_xpert/Home_Screen/utils/customTextField.dart';
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
  double _loanAmount = 0.0;
  double _interestRate = 0.0;
  int _loanTenure = 0;

  void _calculateLoan() {
    _loanAmount = double.tryParse(_amountController.text.replaceAll(',', '')) ?? 0.0;
    _interestRate = double.tryParse(_rateController.text.replaceAll(',', '')) ?? 0.0;
    _loanTenure = int.tryParse(_tenureController.text.replaceAll(',', '')) ?? 0;

    if (_loanAmount > 0 && _loanTenure > 0 && _interestRate > 0) {
      final monthlyRate = _interestRate / 12 / 100;
      final int numberOfPayments = _tenureUnit == 'Years' ? _loanTenure * 12 : _loanTenure;

      _emi = _loanAmount * monthlyRate * pow(1 + monthlyRate, numberOfPayments) / (pow(1 + monthlyRate, numberOfPayments) - 1);

      _totalAmount = _emi * numberOfPayments;
      _totalInterest = _totalAmount - _loanAmount;
      _yearlyAmount = _emi * 12;
    } else {
      _emi = 0.0;
      _totalInterest = 0.0;
      _totalAmount = 0.0;
      _yearlyAmount = 0.0;
    }

    setState(() {});
  }

  final NumberToWordsConverter _converter = NumberToWordsConverter();
  String _labelText = 'Salary';
  void _updateLabelText(String value) {
    if (value.isEmpty) {
      setState(() {
        _labelText = _labelText;
      });
      return;
    }

    int val = int.parse(_amountController.text.replaceAll(',', ''));

    setState(() {
      _labelText = _converter.numberToWords(val); // Use the class method
    });
  }

  @override
  void initState() {
    super.initState();
    _amountController.text;

    _tenureController.text;
    _rateController.text;
  }

  @override
  void dispose() {
    _amountController.dispose();
    _tenureController.dispose();
    _rateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

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
                CustomTF(
                  _amountController,
                  "Salary",
                  (p0) => _updateLabelText(p0),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _tenureController,
                        decoration: InputDecoration(
                          labelText: "Loan Tenture",
                          labelStyle: theme.textTheme.titleSmall!.copyWith(color: theme.colorScheme.onPrimary),
                          filled: true,
                          fillColor: theme.colorScheme.onTertiary,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(color: theme.colorScheme.primaryContainer, width: 2.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const Expanded(
                      child: SizedBox(
                        width: 10,
                      ),
                    ),
                    Expanded(
                      child: DropdownButton<String>(
                        autofocus: true,
                        dropdownColor: Theme.of(context).colorScheme.onTertiary,
                        padding: const EdgeInsets.all(4.0),
                        value: _tenureUnit,
                        items: ['Years', 'Months'].map((String value) {
                          return DropdownMenuItem<String>(
                            alignment: Alignment.center,
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
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _rateController,
                  decoration: InputDecoration(
                    labelText: "Rate of Interest (%)",
                    labelStyle: theme.textTheme.titleSmall!.copyWith(color: theme.colorScheme.onPrimary),
                    filled: true,
                    fillColor: theme.colorScheme.onTertiary,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(color: theme.colorScheme.primaryContainer, width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(color: Colors.grey, width: 1.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _calculateLoan,
                  child: const Text('Calculate'),
                ),
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
                      SizedBox(
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
                if (_emi > 0)
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20.0),
                          bottomLeft: Radius.circular(20.0),
                        ),
                        color: Theme.of(context).colorScheme.onTertiary,
                        shape: BoxShape.rectangle),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                      child: Column(
                        children: [
                          Text(
                            'Summary',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'For a loan of ₹${_loanAmount.toStringAsFixed(2)}, your monthly EMI will be ₹${_emi.toStringAsFixed(2)} for a tenure of $_loanTenure $_tenureUnit at an interest rate of $_interestRate%. '
                            'You will pay a total of ₹${_totalInterest.toStringAsFixed(2)} in interest, bringing the total amount payable to ₹${_totalAmount.toStringAsFixed(2)}. '
                            'This means your yearly payment amount will be approximately ₹${_yearlyAmount.toStringAsFixed(2)}.',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
