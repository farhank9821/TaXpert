import 'package:flutter/material.dart';
import 'package:tax_xpert/Diff_calcs/emi_calculator.dart';
import 'package:tax_xpert/Diff_calcs/bill_split.dart';
import 'package:tax_xpert/Diff_calcs/income_tax_calculator.dart';
import 'package:tax_xpert/Diff_calcs/utils/logoName.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onTertiary,
        title: Center(
            child: Text(
          'Calculator',
          style: Theme.of(context).textTheme.displayMedium,
        )),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LogoNameContainer(
                image: const AssetImage("assets/home_loan.png"),
                name: "Salary BreakDown",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SalaryCalculatorScreen()), // Adjust based on actual target screen
                  );
                },
              ),
              LogoNameContainer(
                image: const AssetImage("assets/home_loan.png"),
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
                name: "Loan Splitter",
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
