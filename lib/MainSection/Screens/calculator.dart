import 'package:flutter/material.dart';
import 'package:tax_xpert/MainSection/Screens/Diff_calcs/emi_calculator.dart';
import 'package:tax_xpert/MainSection/Screens/Diff_calcs/gst_calculator.dart';
import 'package:tax_xpert/MainSection/Screens/Diff_calcs/income_tax_calculator.dart';
import 'package:tax_xpert/MainSection/Screens/Diff_calcs/utils/custom_calc_card.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff92B79F),
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Calculator',
          style: TextStyle(fontSize: 20),
        )),
        elevation: 0,
        backgroundColor: const Color(0xff92B79F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCalcCard(
                title: "  Income Tax Calculator",
                logo: const Icon(Icons.calculate),
                destinationNavigate: const IncomeTaxCalc(),
                color: Colors.greenAccent,
              ),
              CustomCalcCard(
                title: "  GST Calculator",
                logo: const Icon(Icons.monitor_heart_sharp),
                destinationNavigate: const GSTCalc(),
                color: Colors.greenAccent,
              ),
              CustomCalcCard(
                title: "  EMI Calculator",
                logo: const Icon(Icons.mobile_friendly_rounded),
                destinationNavigate: const EMICalc(),
                color: Colors.greenAccent,
              ),
              CustomCalcCard(
                title: "  Home Loan",
                logo: const Icon(Icons.home_work_outlined),
                destinationNavigate: const EMICalc(),
                color: Colors.greenAccent,
              ),
              CustomCalcCard(
                title: "  Student Loan",
                logo: const Icon(Icons.cast_for_education),
                destinationNavigate: const EMICalc(),
                color: Colors.greenAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
