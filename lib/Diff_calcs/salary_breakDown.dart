import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:number_to_words/number_to_words.dart';
import 'package:tax_xpert/Diff_calcs/utils/chart_display.dart';
import 'package:tax_xpert/Diff_calcs/utils/condition_column.dart';
import 'package:tax_xpert/Home_Screen/utils/customTextField.dart';
import 'package:tax_xpert/utils/number_to_words.dart';

import '../utils/numberFormat.dart';

class SalaryCalculatorScreen extends StatefulWidget {
  const SalaryCalculatorScreen({super.key});

  @override
  _SalaryCalculatorScreenState createState() => _SalaryCalculatorScreenState();
}

class _SalaryCalculatorScreenState extends State<SalaryCalculatorScreen> {
  final TextEditingController _salaryController = TextEditingController();
  double _salary = 0;
  double _pf = 0;
  double _incomeTax = 0;
  double _healthandCess = 0;
  double _netPay = 0;
  double _totalTax = 0;
  double taxPerTenSpent = 0;
  double standard_deduction = 75000;

  String _salaryRate = 'Annual';

  void _calculate() {
    setState(() {
      _salary = double.tryParse(_salaryController.text.replaceAll(',', '')) ?? 0;

      if (_salary == 0) {
        _pf = 0;
        _incomeTax = 0;
        _healthandCess = 0;
        _netPay = 0;
        _totalTax = 0;
        taxPerTenSpent = 0;
        return;
      }

      if (_salaryRate == 'Month') {
        _salary *= 12;
      } else if (_salaryRate == 'Semimonthly') {
        _salary *= 24;
      } else if (_salaryRate == 'Weekly') {
        _salary *= 52;
      } else if (_salaryRate == 'Day') {
        _salary *= 365;
      } else if (_salaryRate == 'Hour') {
        _salary *= 365 * 8;
      }

      _pf = _salary * 0.12;

      if (_salary > 300000) {
        _incomeTax = calculateNewTax(_salary);
        _healthandCess = (_incomeTax * 0.04);
      } else {
        _incomeTax = 0;
        _healthandCess = 0;
        standard_deduction = 0;
      }

      _totalTax = _pf + _incomeTax + _healthandCess - standard_deduction;

      taxPerTenSpent = (_totalTax / _salary) * 10;
      _netPay = _salary - _totalTax;
    });
  }

  double calculateNewTax(double income) {
    income = income > 0 ? income : 0;
    double tax = 0;

    if (income <= 300000) {
      tax = 0;
    } else if (income <= 600000) {
      tax = (income - 300000) * 0.05;
    } else if (income <= 900000) {
      tax = 15000 + (income - 600000) * 0.10;
    } else if (income <= 1200000) {
      tax = 45000 + (income - 900000) * 0.15;
    } else if (income <= 1500000) {
      tax = 90000 + (income - 1200000) * 0.20;
    } else {
      tax = 150000 + (income - 1500000) * 0.30;
    }

    return tax;
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

    int val = int.parse(_salaryController.text.replaceAll(',', ''));

    setState(() {
      _labelText = _converter.numberToWords(val); // Use the class method
    });
  }

  @override
  void initState() {
    super.initState();
    _salaryController.text;
  }

  @override
  void dispose() {
    _salaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salary Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTF(
                _salaryController,
                "Salary",
                (p0) => _updateLabelText(p0),
              ),
              const SizedBox(height: 16.0),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: Colors.grey),
                    color: Theme.of(context).colorScheme.onTertiary),
                child: Center(
                  child: DropdownButton<String>(
                    padding: const EdgeInsets.all(4.0),
                    alignment: Alignment.bottomCenter,
                    value: _salaryRate,
                    autofocus: true,
                    dropdownColor: Theme.of(context).colorScheme.onTertiary,
                    onChanged: (String? newValue) {
                      setState(() {
                        _salaryRate = newValue!;
                      });
                    },
                    items: <String>['Annual', 'Month', 'Semimonthly', 'Weekly', 'Day', 'Hour'].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  maximumSize: Size(MediaQuery.of(context).size.width * 0.8, 60),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  padding: const EdgeInsets.all(8.0),
                ),
                onPressed: _calculate,
                child: Text("Calculate", style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).colorScheme.surface)),
              ),
              const SizedBox(height: 20.0),
              ConditionColumn(
                name: 'Salary',
                value: _salary,
                check_Condition: _netPay > 0,
                isHighlighted: false,
              ),
              ConditionColumn(
                name: 'Provident Fund (PF)',
                value: _pf,
                check_Condition: _netPay > 0,
                modifier: '- ',
                isHighlighted: true,
              ),
              ConditionColumn(
                name: 'Income Tax',
                value: _incomeTax,
                check_Condition: _netPay > 0,
                modifier: '- ',
                isHighlighted: true,
              ),
              ConditionColumn(
                name: 'Health and Cess',
                value: _healthandCess,
                check_Condition: _netPay > 0,
                modifier: '- ',
                isHighlighted: true,
              ),
              GestureDetector(
                onDoubleTap: () => _showStandardDeductionDialog,
                child: ConditionColumn(
                  name: 'Standard Deduction',
                  value: standard_deduction,
                  check_Condition: _netPay > 0,
                  modifier: '- ',
                  isHighlighted: true,
                ),
              ),
              ConditionColumn(
                name: 'Total Tax',
                value: _totalTax,
                check_Condition: _netPay > 0,
                isHighlighted: false,
              ),
              ConditionColumn(
                name: 'Net Pay',
                value: _netPay,
                check_Condition: _netPay > 0,
                modifier: '* ',
                isHighlighted: false,
              ),
              const SizedBox(
                height: 10,
              ),
              if (_netPay > 0)
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TaxBreakdownChart(
                            netPayPercentage: (_netPay / (_netPay + _totalTax)) * 100,
                            totalTaxPercentage: (_totalTax / (_netPay + _totalTax)) * 100,
                          ),
                        ),
                        Text(
                          'In other words, every time you spend ₹10 of your hard-earned money, ₹${taxPerTenSpent.toStringAsFixed(2)} goes to the government.',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                ),
              if (_netPay > 0)
                const SizedBox(
                  height: 20,
                ),
              if (_netPay > 0)
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
                        Text(
                          'If you make ₹${_salary.toStringAsFixed(2)}  a year living in India, you will be taxed ₹${_totalTax.toStringAsFixed(2)}. That means that your net pay will be ₹${_netPay.toStringAsFixed(2)} per year, or ₹${(_netPay / 12).toStringAsFixed(2)} per month. Your average tax rate is 22.3% and your marginal',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _showStandardDeductionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Standard Deduction Update'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'With effect from FY 2024-25, under the new tax regime, the standard deduction is increased to Rs.75,000. There has been no change to the old tax regime with respect to the standard deduction. Thus, salaried taxpayers are eligible for the standard deduction of only Rs.50,000 under the old regime.',
                ),
                SizedBox(height: 16),
                Text(
                  'Purpose of Standard Deduction',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  '• Simplify tax filing by reducing paperwork and enabling deductions regardless of actual expenses.',
                ),
                Text(
                  '• Offer tax relief specifically to middle-class salaried individuals.',
                ),
                Text(
                  '• Extend benefits to pensioners through the standard deduction.',
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
