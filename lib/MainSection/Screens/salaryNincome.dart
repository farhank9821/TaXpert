import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tax_xpert/MainSection/Screens/userSalaryandIncome.dart';

import '../../widgets/TextWithdivider.dart';

class SalaryandIncome extends StatefulWidget {
  const SalaryandIncome({super.key});

  @override
  State<SalaryandIncome> createState() => _SalaryandIncomeState();
}

class _SalaryandIncomeState extends State<SalaryandIncome> {
  double totalSalary = 0.0;

  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    initSharedPreferences();
  }

  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    // Retrieve the totalSalary from SharedPreferences
    double savedTotalSalary = prefs.getDouble('totalSalary') ?? 0.0;
    setState(() {
      totalSalary = savedTotalSalary;
    });
  }

  Future<void> saveTotalSalaryToSharedPreferences(double totalSalary) async {
    // Save the totalSalary to SharedPreferences
    await prefs.setDouble('totalSalary', totalSalary);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEFF8F1),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            GestureDetector(
              onDoubleTap: () async {
                final newTotalSalary = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserSalaryIncome(
                      onTotalSalaryCalculated: (newTotalSalary) {
                        setState(() {
                          totalSalary = newTotalSalary;
                        });
                        saveTotalSalaryToSharedPreferences(newTotalSalary);
                      },
                    ),
                  ),
                );
              },
              child: TextWithdivider(
                label: "Salary and Income",
                value: "Taxable Income from business...",
                income: '₹${totalSalary.toStringAsFixed(2)}',
                showIncome: true,
                showDivider: true,
              ),
            ),
            const TextWithdivider(
              label: "Business and Profession",
              value: "Taxable Income From business...",
              income: "120000",
              showDivider: true,
            ),
            const TextWithdivider(
              label: "Capital Gains",
              value: "Income From Capital Gain...",
              income: "1,20,000",
              showDivider: true,
            ),
            const TextWithdivider(
              label: "Other Sources",
              value: "Income from Other Sources...",
              income: "1,20,000",
              showDivider: true,
            ),
          ]),
        ),
      ),
    );
  }
}
