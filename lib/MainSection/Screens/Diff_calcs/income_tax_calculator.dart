import 'dart:math';

import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:tax_xpert/MainSection/Screens/Diff_calcs/utils/custom_button.dart';
import 'package:tax_xpert/MainSection/Screens/Diff_calcs/utils/custom_text_field.dart';

class NewTaxSlab {
  final double lowerLimit;
  final double upperLimit;
  final double rate;

  NewTaxSlab(this.lowerLimit, this.upperLimit, this.rate);
}

class TaxSlab {
  final double lowerLimit;
  final double upperLimit;
  final double rate;

  TaxSlab(this.lowerLimit, this.upperLimit, this.rate);
}

class IncomeTaxCalc extends StatefulWidget {
  const IncomeTaxCalc({super.key});

  @override
  State<IncomeTaxCalc> createState() => _IncomeTaxCalcState();
}

class _IncomeTaxCalcState extends State<IncomeTaxCalc> {
  final TextEditingController _assessmentYearController = TextEditingController();
  final TextEditingController _taxpayerCategoryController = TextEditingController();
  final TextEditingController _residentStatusController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _totalIncomeController = TextEditingController();
  final TextEditingController _deductionController = TextEditingController();
  double oldTaxed = 0.0;
  double newTaxed = 0.0;

  void calc() {
    double totalIncome = double.tryParse(_totalIncomeController.text) ?? 0.0;
    double totalDeduction = double.tryParse(_deductionController.text) ?? 0.0;

    double oldTax = newRegimeIncomeTaxCalc(totalIncome, totalDeduction);
    double newTax = oldRegimeIncomeTaxCalc(totalIncome, totalDeduction);

    setState(() {
      oldTaxed = oldTax;
      newTaxed = newTax;
    });
  }

  double newRegimeIncomeTaxCalc(double totalAnnualIncome, double totalDeductions) {
    double income = totalAnnualIncome - totalDeductions;

    final slabs = [
      NewTaxSlab(0, 250000, 0.05),
      NewTaxSlab(250000, 500000, 0.1),
      NewTaxSlab(500000, 750000, 0.15),
      NewTaxSlab(750000, 1000000, 0.2),
      NewTaxSlab(1000000, 1250000, 0.25),
      NewTaxSlab(1250000, 1500000, 0.3),
    ];

    double tax = 0.0;

    for (final slab in slabs) {
      if (income <= 0) {
        break;
      }

      final slabAmount = min(slab.upperLimit, income) - slab.lowerLimit;
      if (slabAmount > 0) {
        tax += slabAmount * slab.rate;
      }
      income -= slabAmount;
    }

    return tax;
  }

  double oldRegimeIncomeTaxCalc(double totalAnnualIncome, double totalDeductions) {
    double income = totalAnnualIncome - totalDeductions;

    final slabs = [
      TaxSlab(0, 250000, 0.05),
      TaxSlab(250000, 500000, 0.2),
      TaxSlab(500000, double.infinity, 0.3),
    ];

    double tax = 0.0;

    for (final slab in slabs) {
      if (income <= 0) {
        break;
      }

      final slabAmount = min(slab.upperLimit, income) - slab.lowerLimit;
      if (slabAmount > 0) {
        tax += slabAmount * slab.rate;
      }
      income -= slabAmount;
    }

    return tax;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff92B79F),
      appBar: AppBar(
        backgroundColor: const Color(0xff92B79F),
        title: const Text('Income Tax Calculator', style: TextStyle(color: Color(0xffffffff), fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Assessment Year'),
              const SizedBox(
                height: 10,
              ),
              CustomDropdown(
                items: const ["2022-23", "2023-24"],
                //controller: _assessmentYearController,
                onChanged: (p0) {},
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Taxpayer Category'),
              const SizedBox(
                height: 5,
              ),
              CustomDropdown(
                items: const ["Individual", "Trust", "Firm", "HUF"],
                // controller: _taxpayerCategoryController,
                onChanged: (p0) {},
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Residential Status'),
              const SizedBox(
                height: 5,
              ),
              CustomDropdown(
                items: const ["RES(Resident)", "NR(Non-Resident)", "RNOR(Resident But Not Ordinarly Resident)"],
                onChanged: (p0) {},

                //controller: _residentStatusController,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('Your Age'),
              const SizedBox(
                height: 5,
              ),
              CustomDropdown(
                items: const ["Below 60 years (Regular Citizen)", "60-79 years (Senior Citizen)", "80 and above (Super Senior Citizen)"],
                //controller: _ageController,
                onChanged: (p0) {},
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: 'Total Annual Income',
                controller: _totalIncomeController,
                logo: const Icon(
                  Icons.attach_money,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                hintText: 'Total Deductions',
                controller: _deductionController,
                logo: const Icon(
                  Icons.attach_money,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CustomButton(label: "Calculate", onPressed: calc),
              const SizedBox(
                height: 20,
              ),
              Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  width: double.infinity,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                      colors: [Colors.yellow.shade100, Colors.green.shade500],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            const Text(
                              'Tax Summary',
                              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Total Annual Income'),
                                Text(
                                  _totalIncomeController.text,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Total Deductions'),
                                Text(
                                  _deductionController.text,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Total Amount (Old Regime)'),
                                Text(
                                  '$oldTaxed',
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Total Amount (New Regime)'),
                                Text(
                                  '$newTaxed',
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
