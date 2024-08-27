import 'package:flutter/material.dart';

void main() => runApp(const TaxCalculatorApp());

class TaxCalculatorApp extends StatelessWidget {
  const TaxCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Income Tax Calculator India',
      theme: ThemeData.dark(),
      home: const TaxCalculatorScreen(),
    );
  }
}

class TaxCalculatorScreen extends StatefulWidget {
  const TaxCalculatorScreen({super.key});

  @override
  _TaxCalculatorScreenState createState() => _TaxCalculatorScreenState();
}

class _TaxCalculatorScreenState extends State<TaxCalculatorScreen> {
  final TextEditingController _incomeController = TextEditingController();
  String _selectedPeriod = 'Annual';
  String _selectedLocation = 'India';
  double _netPay = 0;
  double _totalTax = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Income tax calculator India'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Find out how much your salary is after tax', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            TextField(
              controller: _incomeController,
              decoration: const InputDecoration(
                labelText: 'Enter your gross income',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.currency_rupee_sharp),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedPeriod,
              decoration: const InputDecoration(
                labelText: 'Per',
                border: OutlineInputBorder(),
              ),
              items: ['Annual', 'Month', 'Semimonthly', 'Weekly', 'Day', 'Hour'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedPeriod = newValue!;
                });
              },
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              value: _selectedLocation,
              decoration: const InputDecoration(
                labelText: 'Where do you work?',
                border: OutlineInputBorder(),
              ),
              items: ['India'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedLocation = newValue!;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Calculate'),
              onPressed: _calculateTax,
            ),
            const SizedBox(height: 20),
            if (_netPay > 0) ...[
              const Text('Results', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text('Net Pay: ₹${_netPay.toStringAsFixed(2)}'),
              Text('Total Tax: ₹${_totalTax.toStringAsFixed(2)}'),
              // Here you would add more detailed breakdown and the pie chart
            ],
          ],
        ),
      ),
    );
  }

  void _calculateTax() {
    // This is a simplified calculation and doesn't reflect actual Indian tax laws
    double grossIncome = double.tryParse(_incomeController.text) ?? 0;
    double tax = grossIncome * 0.2; // Simplified 20% flat tax
    setState(() {
      _totalTax = tax;
      _netPay = grossIncome - tax;
    });
  }
}
