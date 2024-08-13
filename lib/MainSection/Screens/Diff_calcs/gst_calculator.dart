import 'package:flutter/material.dart';
import 'package:tax_xpert/MainSection/Screens/Diff_calcs/utils/custom_button.dart';
import 'package:tax_xpert/MainSection/Screens/Diff_calcs/utils/custom_text_field.dart';
import 'package:tax_xpert/widgets/TextWithdivider.dart';

class GSTCalc extends StatefulWidget {
  const GSTCalc({super.key});

  @override
  State<GSTCalc> createState() => _GSTCalcState();
}

class _GSTCalcState extends State<GSTCalc> {
  TextEditingController _gstController = TextEditingController();
  double inputAmount = 0.0;
  double gstRate = 18.0;
  double cgstAmount = 0.0;
  double sgstAmount = 0.0;
  double gstAmount = 0.0;

  double calculateGSTAmount(double amount) {
    return (amount * gstRate) / 100;
  }

  void calculateGST() {
    setState(() {
      inputAmount = double.tryParse(_gstController.text) ?? 0.0;
      cgstAmount = calculateGSTAmount(inputAmount) / 2;
      sgstAmount = calculateGSTAmount(inputAmount) / 2;
      gstAmount = calculateGSTAmount(inputAmount);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _gstController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff92B79F),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff92B79F),
        title: const Text("GST Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0).copyWith(top: 30),
        child: Column(
          children: [
            CustomTextField(
              hintText: 'Enter Amount',
              controller: _gstController,
              logo: const Icon(
                Icons.monetization_on,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(label: 'Calculate', onPressed: calculateGST),
            const SizedBox(
              height: 20,
            ),
            Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                width: 400,
                height: 450,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                    colors: [Colors.yellow.shade100, Colors.green.shade500],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Table(
                        border: TableBorder.all(), // Add borders around cells
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                        children: [
                          TableRow(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            children: const [
                              TableCell(
                                child: Center(
                                  child: Text('Central GST', style: TextStyle(fontSize: 20)),
                                ),
                              ),
                              TableCell(
                                child: Center(
                                  child: Text('GST', style: TextStyle(fontSize: 25)),
                                ),
                              ),
                              TableCell(
                                child: Center(
                                  child: Text('StateGST', style: TextStyle(fontSize: 25)),
                                ),
                              ),
                            ],
                          ),
                          TableRow(
                            children: [
                              TableCell(
                                child: Center(
                                  child: Text('$cgstAmount', style: const TextStyle(fontSize: 25)),
                                ),
                              ),
                              TableCell(
                                child: Center(
                                  child: Text('$gstAmount.', style: const TextStyle(fontSize: 25)),
                                ),
                              ),
                              TableCell(
                                child: Center(
                                  child: Text('$sgstAmount', style: const TextStyle(fontSize: 25)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: TextWithdivider(label: "What is SGST ?", value: " ", income: ""),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: TextWithdivider(label: "What is CGST ?", value: " ", income: ""),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: TextWithdivider(label: "Pros of GST ?", value: " ", income: ""),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(4.0),
                      child: TextWithdivider(
                        label: "How Does SGST & CGST differ?",
                        value: " ",
                        income: "",
                        showDivider: false,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
