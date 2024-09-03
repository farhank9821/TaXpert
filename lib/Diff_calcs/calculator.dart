import 'package:flutter/material.dart';
import 'package:tax_xpert/Diff_calcs/emi_calculator.dart';
import 'package:tax_xpert/Diff_calcs/bill_split.dart';
import 'package:tax_xpert/Diff_calcs/salary_breakDown.dart';
import 'package:tax_xpert/Diff_calcs/utils/logoName.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LogoNameContainer(
                image: const AssetImage("assets/salary_b.png"),
                name: "Salary BreakDown",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SalaryCalculatorScreen()), // Adjust based on actual target screen
                  );
                },
              ),
              LogoNameContainer(
                image: const AssetImage("assets/receipt.png"),
                name: "Bill Splitter",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BillSplitterPage()), // Adjust based on actual target screen
                  );
                },
              ),
              LogoNameContainer(
                image: const AssetImage("assets/home_loan.png"),
                name: "Loan Emi Calculator",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoanCalculatorScreen()), // Adjust based on actual target screen
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
