// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/TextWithdivider.dart';

class UserSalaryIncome extends StatefulWidget {
  final void Function(double totalSalary) onTotalSalaryCalculated;

  const UserSalaryIncome({super.key, required this.onTotalSalaryCalculated});

  @override
  State<UserSalaryIncome> createState() => _UserSalaryIncomeState();
}

class _UserSalaryIncomeState extends State<UserSalaryIncome> {
  Map<String, String> selectedOptions = {
    'BasicAllowance': 'M',
    'HRA': 'M',
    'Bonus': 'M',
    'OtherAllowances': 'M',
  };

  TextEditingController basicAllowanceController = TextEditingController();
  TextEditingController hraController = TextEditingController();
  TextEditingController bonusController = TextEditingController();
  TextEditingController otherAllowancesController = TextEditingController();
  double totalSalary = 0.0; // Initialize with 0

  // Define a key to uniquely identify the totalSalary in SharedPreferences
  static const String totalSalaryKey = 'totalSalary';

  // SharedPreferences instance
  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    basicAllowanceController.addListener(calculateSalary);
    hraController.addListener(calculateSalary);
    bonusController.addListener(calculateSalary);
    otherAllowancesController.addListener(calculateSalary);

    // Initialize SharedPreferences
    initSharedPreferences();
  }

  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    // Retrieve the totalSalary from SharedPreferences
    double savedTotalSalary = prefs.getDouble(totalSalaryKey) ?? 0.0;
    setState(() {
      totalSalary = savedTotalSalary;
    });
  }

  Future<void> saveTotalSalaryToSharedPreferences(double totalSalary) async {
    // Save the totalSalary to SharedPreferences
    await prefs.setDouble(totalSalaryKey, totalSalary);
  }

  @override
  void dispose() {
    basicAllowanceController.dispose();
    hraController.dispose();
    bonusController.dispose();
    otherAllowancesController.dispose();
    saveTotalSalaryToSharedPreferences(totalSalary); // Save totalSalary when disposing
    super.dispose();
  }

  void calculateSalary() {
    double totalSalary = 0.0;
    selectedOptions.forEach((fieldName, option) {
      totalSalary += calculateField(fieldName);
    });

    setState(() {
      this.totalSalary = totalSalary;
    });

    // Save the updated totalSalary to SharedPreferences
    saveTotalSalaryToSharedPreferences(totalSalary);

    widget.onTotalSalaryCalculated(totalSalary);
  }

  double calculateField(String fieldName) {
    double fieldValue = 0.0;
    if (fieldName == 'BasicAllowance') {
      fieldValue = double.tryParse(basicAllowanceController.text) ?? 0.0;
    } else if (fieldName == 'HRA') {
      fieldValue = double.tryParse(hraController.text) ?? 0.0;
    } else if (fieldName == 'Bonus') {
      fieldValue = double.tryParse(bonusController.text) ?? 0.0;
    } else if (fieldName == 'OtherAllowances') {
      fieldValue = double.tryParse(otherAllowancesController.text) ?? 0.0;
    }

    if (selectedOptions[fieldName] == 'M') {
      fieldValue *= 12;
    }

    return fieldValue;
  }

  void showFormDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xff92B79F),
          title: const Text('Edit Salary Details'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                buildInputField('BasicAllowance', 'Basic + Dear Allowance'),
                buildInputField('HRA', 'HRA (House Rent Allowance)'),
                buildInputField('Bonus', 'Bonus/Commission'),
                buildInputField('OtherAllowances', 'Other Allowances'),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Calculate the total salary here
                    double totalSalary = 0.0;
                    selectedOptions.forEach((fieldName, option) {
                      totalSalary += calculateField(fieldName);
                    });

                    // Handle the result as needed
                    print('Total Salary: $totalSalary');

                    Navigator.of(context).pop(); // Close the dialog
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff2F873C))),
                  child: const Text('Calculate Salary'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff92B79F),
        appBar: AppBar(
          title: const Center(child: Text('Salary & Income')),
          backgroundColor: const Color(0xff92B79F),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(children: [
              const SizedBox(height: 20.0),
              Center(
                child: Container(
                  width: 210,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xffEFF8F1),
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: const Color(0xff2F873C), width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Text("Total Salary : ",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff25472B),
                            )),
                        Text(
                          '${totalSalary.toStringAsFixed(2)}', // Display the total salary
                          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              GestureDetector(
                onTap: () => showFormDialog(),
                child: const TextWithdivider(
                  label: "Salary and Income",
                  value: "Taxable Income from business...",
                  income: "₹1,20,000",
                  showIncome: false,
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
      ),
    );
  }

  Widget buildInputField(String fieldName, String labelText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: Text(labelText),
        ),
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: Row(
            children: [
              Flexible(
                flex: 2,
                child: TextField(
                  controller: getController(fieldName),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Amount',
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: CupertinoSlidingSegmentedControl(
                  thumbColor: const Color(0xff2F873C),
                  groupValue: selectedOptions[fieldName],
                  onValueChanged: (value) {
                    setState(() {
                      selectedOptions[fieldName] = value ?? 'M';
                    });
                  },
                  children: {
                    'M': Container(
                      padding: const EdgeInsets.all(3.0),
                      child: const Text('M'),
                    ),
                    'Y': Container(
                      padding: const EdgeInsets.all(3.0),
                      child: const Text('Y'),
                    ),
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  TextEditingController getController(String fieldName) {
    switch (fieldName) {
      case 'BasicAllowance':
        return basicAllowanceController;
      case 'HRA':
        return hraController;
      case 'Bonus':
        return bonusController;
      case 'OtherAllowances':
        return otherAllowancesController;
      default:
        return TextEditingController();
    }
  }
}
