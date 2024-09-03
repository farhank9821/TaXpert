// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import '../../widgets/TextWithdivider.dart';

// class UserSalaryIncome extends StatefulWidget {
//   const UserSalaryIncome({super.key});

//   @override
//   State<UserSalaryIncome> createState() => _UserSalaryIncomeState();
// }

// class _UserSalaryIncomeState extends State<UserSalaryIncome> {
//   Map<String, String> selectedOptions = {
//     'BasicAllowance': 'M',
//     'HRA': 'M',
//     'Bonus': 'M',
//     'OtherAllowances': 'M',
//   };

//   TextEditingController basicAllowanceController = TextEditingController();
//   TextEditingController hraController = TextEditingController();
//   TextEditingController bonusController = TextEditingController();
//   TextEditingController otherAllowancesController = TextEditingController();
//   double totalSalary = 0.0; // Initialize with 0

//   @override
//   void initState() {
//     super.initState();
//     basicAllowanceController.addListener(calculateSalary);
//     hraController.addListener(calculateSalary);
//     bonusController.addListener(calculateSalary);
//     otherAllowancesController.addListener(calculateSalary);
//   }

//   @override
//   void dispose() {
//     basicAllowanceController.dispose();
//     hraController.dispose();
//     bonusController.dispose();
//     otherAllowancesController.dispose();
//     super.dispose();
//   }

//   void calculateSalary() {
//     double totalSalary = 0.0;
//     selectedOptions.forEach((fieldName, option) {
//       totalSalary += calculateField(fieldName);
//     });

//     setState(() {
//       this.totalSalary = totalSalary;
//     });
//   }

//   double calculateField(String fieldName) {
//     double fieldValue = 0.0;
//     if (fieldName == 'BasicAllowance') {
//       fieldValue = double.tryParse(basicAllowanceController.text) ?? 0.0;
//     } else if (fieldName == 'HRA') {
//       fieldValue = double.tryParse(hraController.text) ?? 0.0;
//     } else if (fieldName == 'Bonus') {
//       fieldValue = double.tryParse(bonusController.text) ?? 0.0;
//     } else if (fieldName == 'OtherAllowances') {
//       fieldValue = double.tryParse(otherAllowancesController.text) ?? 0.0;
//     }

//     if (selectedOptions[fieldName] == 'M') {
//       fieldValue *= 12;
//     }

//     return fieldValue;
//   }

//   void showFormDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Edit Salary Details'),
//           content: SingleChildScrollView(
//             child: Column(
//               children: [
//                 buildInputField('BasicAllowance', 'Basic + Dear Allowance'),
//                 buildInputField('HRA', 'HRA (House Rent Allowance)'),
//                 buildInputField('Bonus', 'Bonus/Commission'),
//                 buildInputField('OtherAllowances', 'Other Allowances'),
//                 SizedBox(height: 20.0),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Calculate the total salary here
//                     double totalSalary = 0.0;
//                     selectedOptions.forEach((fieldName, option) {
//                       totalSalary += calculateField(fieldName);
//                     });

//                     // Handle the result as needed
//                     print('Total Salary: $totalSalary');

//                     Navigator.of(context).pop(); // Close the dialog
//                   },
//                   child: Text('Calculate Salary'),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         appBar: AppBar(title: Text('Salary & Income')),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Column(children: [
//               SizedBox(height: 20.0),
//               Text(
//                 'Total Salary: ${totalSalary.toStringAsFixed(2)}', // Display the total salary
//                 style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
//               ),
//               GestureDetector(
//                 onTap: () => showFormDialog(),
//                 child: const TextWithdivider(
//                   label: "Salary and Income",
//                   value: "Taxable Income from business...",
//                   income: "₹1,20,000",
//                   showIncome: false,
//                   showDivider: true,
//                 ),
//               ),
//               const TextWithdivider(
//                 label: "Business and Profession",
//                 value: "Taxable Income From business...",
//                 income: "120000",
//                 showDivider: true,
//               ),
//               const TextWithdivider(
//                 label: "Capital Gains",
//                 value: "Income From Capital Gain...",
//                 income: "1,20,000",
//                 showDivider: true,
//               ),
//               const TextWithdivider(
//                 label: "Other Sources",
//                 value: "Income from Other Sources...",
//                 income: "1,20,000",
//                 showDivider: true,
//               ),
//             ]),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildInputField(String fieldName, String labelText) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(labelText),
//         Row(
//           children: [
//             Flexible(
//               flex: 2,
//               child: TextField(
//                 controller: getController(fieldName),
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   labelText: 'Amount',
//                 ),
//               ),
//             ),
//             Flexible(
//               flex: 1,
//               child: CupertinoSlidingSegmentedControl(
//                 groupValue: selectedOptions[fieldName],
//                 onValueChanged: (value) {
//                   setState(() {
//                     selectedOptions[fieldName] = value ?? 'M';
//                   });
//                 },
//                 children: {
//                   'M': Container(
//                     padding: EdgeInsets.all(3.0),
//                     child: Text('M'),
//                   ),
//                   'Y': Container(
//                     padding: EdgeInsets.all(3.0),
//                     child: Text('Y'),
//                   ),
//                 },
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }

//   TextEditingController getController(String fieldName) {
//     switch (fieldName) {
//       case 'BasicAllowance':
//         return basicAllowanceController;
//       case 'HRA':
//         return hraController;
//       case 'Bonus':
//         return bonusController;
//       case 'OtherAllowances':
//         return otherAllowancesController;
//       default:
//         return TextEditingController();
//     }
//   }
// }
