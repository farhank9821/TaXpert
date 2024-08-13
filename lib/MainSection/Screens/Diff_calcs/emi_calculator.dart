import 'package:flutter/material.dart';
import 'package:tax_xpert/MainSection/Screens/Diff_calcs/utils/custom_button.dart';
import 'package:tax_xpert/MainSection/Screens/Diff_calcs/utils/custom_text_field.dart';

class EMICalc extends StatefulWidget {
  const EMICalc({super.key});

  @override
  State<EMICalc> createState() => _EMICalcState();
}

class _EMICalcState extends State<EMICalc> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _loanAmountController = TextEditingController();
  final TextEditingController _interestController = TextEditingController();
  final TextEditingController _tenureController = TextEditingController();
  String name = '';
  String ogName = '';
  int loanAmount = 0;
  int ogAmount = 0;
  int years = 0;
  int ogYears = 0;
  double interest = 0.0;
  double ogInterest = 0.0;

  void calcEmi() {
    ogName = _nameController.toString();
    ogAmount = int.tryParse(_loanAmountController.text)!;
    ogYears = int.tryParse(_tenureController.text)!;
    ogInterest = double.tryParse(_interestController.text)!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff92B79F),
      appBar: AppBar(
        elevation: 0,
        title: const Text("Emi Calculator"),
        backgroundColor: const Color(0xff92B79F),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                hintText: 'Eg. Home loan, Electronics, etc',
                controller: _nameController,
                logo: const Icon(Icons.accessibility_sharp),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                hintText: 'Loan Amount',
                controller: _loanAmountController,
                logo: const Icon(Icons.attach_money_outlined),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                hintText: 'Tenure (in Months)',
                controller: _tenureController,
                logo: const Icon(
                  Icons.calendar_month,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomTextField(
                hintText: 'Interest in %',
                controller: _interestController,
                logo: const Icon(
                  Icons.percent_outlined,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButton(label: 'Calculate', onPressed: calcEmi),
              const SizedBox(
                height: 15,
              ),
              Card(
                elevation: 5.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  width: 400,
                  height: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    gradient: LinearGradient(
                      colors: [Colors.yellow.shade100, Colors.green.shade500],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text(
                          'Your loan details as specified by you ',
                          style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Loan Amount', style: TextStyle(fontSize: 20)),
                            Text('₹ 1500000', style: TextStyle(color: Colors.black, fontSize: 24)),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Tenure',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              '20 years',
                              style: TextStyle(color: Colors.black, fontSize: 24),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Interest Rate ', style: TextStyle(fontSize: 20)),
                            Text('20 %', style: TextStyle(color: Colors.black, fontSize: 24)),
                          ],
                        ),
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
