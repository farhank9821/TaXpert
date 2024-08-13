import 'package:flutter/material.dart';

import '../../widgets/TextWithdivider.dart';

class ExmeptionAndDeduction extends StatefulWidget {
  const ExmeptionAndDeduction({super.key});

  @override
  State<ExmeptionAndDeduction> createState() => _ExmeptionAndDeductionState();
}

class _ExmeptionAndDeductionState extends State<ExmeptionAndDeduction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            const TextWithdivider(
              label: "Standard Deduction",
              value: "Standard Deduction...",
              income: "₹50,000",
              showIncome: true,
              showDivider: true,
            ),
            GestureDetector(
              onLongPress: () => _showInformationDialog(context),
              child: const TextWithdivider(
                label: "80C",
                value: "Life Insurance,PPF,EPF...",
                income: "120000",
                showDivider: true,
              ),
            ),
            const TextWithdivider(
              label: "80CG",
              value: "Deduction and Rent Payment...",
              income: "1,20,000",
              showDivider: true,
            ),
            const TextWithdivider(
              label: "Professional Tax",
              value: "Professional Tax...",
              income: "1,20,000",
              showDivider: true,
            ),
            const TextWithdivider(
              label: "80D",
              value: "health Insurance Premia",
              income: "1,20,000",
              showDivider: true,
            ),
            const Center(
              child: Text("More", style: TextStyle(color: Colors.red, fontSize: 20)),
            )
          ]),
        ),
      ),
    );
  }

  void _showInformationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xff92B79F),
          title: const Text(
            'Section 80C',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          content: Column(
            children: const [
              Text(
                  '1. Investments in Provident Funds such as EPF, PPF, etc., payments made towards life insurance premiums, Equity Linked Saving Schemes, payments made towards the principal sum of a home loan, SSY, NSC, SCSS, etc.'),
              Text(
                  '2.  An individual can claim deductions up to Rs 1,50,000. By taking tax benefits under 80c, one can avail of a reduction in tax burden.'),
              Text(
                  "3.  Tax exemptions for investment under 80C are applicable only for individual taxpayers and Hindu Undivided Families. Corporate bodies, partnership firms, and other businesses are not qualified to avail of tax exemptions under Section 80C.")
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
