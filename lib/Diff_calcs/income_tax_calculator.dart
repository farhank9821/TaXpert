import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:tax_xpert/Diff_calcs/utils/chart_display.dart';

class SalaryCalculatorScreen extends StatefulWidget {
  const SalaryCalculatorScreen({super.key});

  @override
  _SalaryCalculatorScreenState createState() => _SalaryCalculatorScreenState();
}

class _SalaryCalculatorScreenState extends State<SalaryCalculatorScreen> {
  final TextEditingController _salaryController = TextEditingController(text: '0');
  double _salary = 0;
  double _pf = 0;
  double _tax = 0;
  double _netPay = 0;
  double _totalTax = 0;

  String _salaryRate = 'Annual';

  void _calculate() {
    setState(() {
      _salary = double.tryParse(_salaryController.text.replaceAll(',', '')) ?? 0;
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

      _pf = _salary * 0.12;
      _tax = calculateNewTax(_salary - _pf);
      _netPay = _salary - _pf - _tax;
      _totalTax = _pf + _tax;
    });
  }

  double calculateNewTax(double income) {
    income = income - 75000;
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

    double cess = tax * 0.04;
    tax += cess;

    return tax;
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
                decoration: const InputDecoration(
                  labelText: "Salary",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
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
              Text('Salary: ₹${NumberFormat('#,##,##0').format(_salary)}'),
              Text('Provident Fund (PF): ₹${NumberFormat('#,##,##0').format(_pf)}'),
              Text('Total Tax: ₹${NumberFormat('#,##,##0').format(_tax)}'),
              Text('Net Pay: ₹${NumberFormat('#,##,##0').format(_netPay)}'),
              if (_netPay > 0)
                TaxBreakdownChart(
                  netPayPercentage: (_netPay / (_netPay + _totalTax)) * 100,
                  totalTaxPercentage: (_totalTax / (_netPay + _totalTax)) * 100,
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class NumberInputFormatter extends TextInputFormatter {
  final NumberFormat numberFormat = NumberFormat("#,##,##0");

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.isEmpty || double.tryParse(newValue.text.replaceAll(',', '')) == null) {
      return oldValue;
    }

    double value = double.parse(newValue.text.replaceAll(',', ''));
    String formattedValue = numberFormat.format(value);

    int cursorPosition = formattedValue.length - (newValue.text.length - newValue.selection.baseOffset);

    return TextEditingValue(
      text: formattedValue,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }
}
