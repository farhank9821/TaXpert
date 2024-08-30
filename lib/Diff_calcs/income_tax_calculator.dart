import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:number_to_words/number_to_words.dart';
import 'package:tax_xpert/Diff_calcs/utils/chart_display.dart';
import 'package:tax_xpert/Diff_calcs/utils/condition_column.dart';
import 'package:tax_xpert/utils/number_to_words.dart';

import '../utils/numberFormat.dart';

class SalaryCalculatorScreen extends StatefulWidget {
  const SalaryCalculatorScreen({super.key});

  @override
  _SalaryCalculatorScreenState createState() => _SalaryCalculatorScreenState();
}

class _SalaryCalculatorScreenState extends State<SalaryCalculatorScreen> {
  final TextEditingController _salaryController = TextEditingController(text: '0');
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

      // Adjust salary based on the selected rate
      if (_salaryRate == 'Month') {
        _salary *= 12;
      } else if (_salaryRate == 'Semimonthly') {
        _salary *= 24;
      } else if (_salaryRate == 'Weekly') {
        _salary *= 52;
      } else if (_salaryRate == 'Day') {
        _salary *= 365;
      } else if (_salaryRate == 'Hour') {
        _salary *= 365 * 8; // Assuming 8 working hours per day
      }

      // Calculate PF (12% of salary)
      _pf = _salary * 0.12;

      // Calculate income tax and health & cess only if salary > 3,00,000
      if (_salary > 300000) {
        _incomeTax = calculateNewTax(_salary);
        _healthandCess = (_incomeTax * 0.04);
      } else {
        _incomeTax = 0;
        _healthandCess = 0;
        standard_deduction = 0;
      }

      // Calculate total tax
      _totalTax = _pf + _incomeTax + _healthandCess - standard_deduction;

      // Calculate tax per 10 spent and net pay
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

  final NumberToWordsConverter _converter = NumberToWordsConverter(); // Instantiate the class
  String _labelText = '';
  void _updateLabelText(String value) {
    if (value.isEmpty) {
      setState(() {
        _labelText = "Salary";
      });
      return;
    }

    int val = int.parse(_salaryController.text.replaceAll(',', ''));

    setState(() {
      _labelText = _converter.numberToWords(val); // Use the class method
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Salary Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: _salaryController,
                decoration: InputDecoration(
                  labelText: _labelText,
                  hintText: "Enter your Salary",
                  border: const OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: _updateLabelText,
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
              const SizedBox(height: 16.0),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: DropdownButton<String>(
                  value: _salaryRate,
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
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _calculate,
                child: const Text('Calculate'),
              ),
              const SizedBox(height: 20.0),
              // Text('Salary: ₹${NumberFormat('#,##,##0').format(_salary)}'),
              // Text('Provident Fund (PF): ₹${NumberFormat('#,##,##0').format(_pf)}'),
              // Text('Income Tax : ₹${NumberFormat('#,##,##0').format(_incomeTax)}'),
              // Text('Health and Cess: ₹${NumberFormat('#,##,##0').format(_healthandCess)}'),
              // Text('Total Tax: ₹${NumberFormat('#,##,##0').format(_totalTax)}'),
              // Text('Standard Deduction: ₹${NumberFormat('#,##,##0').format(standart_deduction)}'),
              // Text('Net Pay: ₹${NumberFormat('#,##,##0').format(_netPay)}'),

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
                isHighlighted: false,
              ),
              ConditionColumn(
                name: 'Income Tax',
                value: _incomeTax,
                check_Condition: _netPay > 0,
                modifier: '- ',
                isHighlighted: false,
              ),
              ConditionColumn(
                name: 'Health and Cess',
                value: _healthandCess,
                check_Condition: _netPay > 0,
                modifier: '- ',
                isHighlighted: false,
              ),
              ConditionColumn(
                name: 'Total Tax',
                value: _totalTax,
                check_Condition: _netPay > 0,
                isHighlighted: false,
              ),
              GestureDetector(
                onDoubleTap: () => _showStandardDeductionDialog,
                child: ConditionColumn(
                  name: 'Standard Deduction',
                  value: standard_deduction,
                  check_Condition: _netPay > 0,
                  modifier: '- ',
                  isHighlighted: false,
                ),
              ),
              ConditionColumn(
                name: 'Net Pay',
                value: _netPay,
                check_Condition: _netPay > 0,
                modifier: '* ',
                isHighlighted: false,
              ),

              if (_netPay > 0)
                TaxBreakdownChart(
                  netPayPercentage: (_netPay / (_netPay + _totalTax)) * 100,
                  totalTaxPercentage: (_totalTax / (_netPay + _totalTax)) * 100,
                ),
              if (_netPay > 0)
                Text(
                  'In other words, every time you spend ₹10 of your hard-earned money, ₹${taxPerTenSpent.toStringAsFixed(2)} goes to the government.',
                  style: TextStyle(fontSize: 16),
                ),
              if (_netPay > 0) Text('Summary'),
              if (_netPay > 0)
                Text(
                    'If you make ₹${_salary.toStringAsFixed(2)}  a year living in India, you will be taxed ₹${_totalTax.toStringAsFixed(2)}. That means that your net pay will be ₹${_netPay.toStringAsFixed(2)} per year, or ₹${(_netPay / 12).toStringAsFixed(2)} per month. Your average tax rate is 22.3% and your marginal')
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
