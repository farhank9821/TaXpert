import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Define your salary and tax values
    double annualSalary = 1200000;
    double rentalIncome = 300000;

    // Calculate the values for the Pie Chart
    double totalIncome = annualSalary + rentalIncome;
    double incomeTax = 229320; // Corrected: Define incomeTax
    double propertyTax = totalIncome - annualSalary - incomeTax; // Corrected: Calculate propertyTax

    double annualSalaryPercentage = (annualSalary / totalIncome) * 100;
    double rentalIncomePercentage = (rentalIncome / totalIncome) * 100;
    double incomeTaxPercentage = (incomeTax / totalIncome) * 100;
    double propertyTaxPercentage = (propertyTax / totalIncome) * 100;

    return Scaffold(
      backgroundColor: const Color(0xff92B79F),
      appBar: AppBar(
        backgroundColor: const Color(0xff25472B),
        elevation: 0,
        title: const Text('Income and Tax Pie Chart'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: 400,
              height: 400,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0), // Adjust the radius as needed
                  bottomRight: Radius.circular(20.0), // Adjust the radius as needed
                ),
                color: Color(0xff25472B),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: PieChart(
                          PieChartData(
                            sections: [
                              PieChartSectionData(
                                color: Colors.blue,
                                value: annualSalaryPercentage,
                                title: '${annualSalaryPercentage.toStringAsFixed(2)}%',
                              ),
                              PieChartSectionData(
                                color: Colors.red,
                                value: rentalIncomePercentage,
                                title: '${rentalIncomePercentage.toStringAsFixed(2)}%',
                              ),
                              PieChartSectionData(
                                color: Colors.green,
                                value: incomeTaxPercentage,
                                title: '${incomeTaxPercentage.toStringAsFixed(2)}%',
                              ),
                              PieChartSectionData(
                                color: Colors.orange,
                                value: propertyTaxPercentage,
                                title: '${propertyTaxPercentage.toStringAsFixed(2)}%',
                              ),
                            ],
                            borderData: FlBorderData(show: false),
                            centerSpaceRadius: 60,
                            sectionsSpace: 0,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildLegendItem('Gross Salary', annualSalary, Colors.blue),
                        _buildLegendItem('Rental Income', rentalIncome, Colors.red),
                        _buildLegendItem('Income Tax', incomeTax, Colors.green),
                        _buildLegendItem('Property Tax', propertyTax, Colors.orange),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  const Text("Annual INCOME", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Table(
                          border: TableBorder.all(), // Add borders around cells
                          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                          children: [
                            const TableRow(
                              children: [
                                TableCell(
                                  child: Center(
                                    child: Text(" Net income Before Tax's", softWrap: true, style: TextStyle(fontSize: 18)),
                                  ),
                                ),
                                TableCell(
                                  child: Center(
                                    child: Text(" Net income After Tax's", style: TextStyle(fontSize: 18)),
                                  ),
                                )
                              ],
                            ),
                            TableRow(
                              children: [
                                TableCell(
                                  child: Center(
                                    child: Text('₹${(totalIncome).toStringAsFixed(2)}', style: const TextStyle(fontSize: 20)),
                                  ),
                                ),
                                TableCell(
                                  child: Center(
                                    child: Text(
                                      '₹${(totalIncome - incomeTax - propertyTax).toStringAsFixed(2)}',
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: const Text(
                      "You can reduce tax to ₹2,13,720 and save ₹46,800 by investing ₹1,50,000 more with 80C as per the old tax regime.",
                      style: TextStyle(fontSize: 20, color: Color(0xffffffff), fontWeight: FontWeight.bold),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        // Show an alert dialog when the button is pressed.
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Reducing Taxes with 80C'),
                              content: const Text(
                                'Section 80C of the Income Tax Act allows individuals to claim deductions on investments such as EPF, PPF, NSC, ELSS, and more, up to a maximum limit of Rs. 1.5 lakh per year. By investing in these instruments, you can reduce your taxable income and ultimately pay less income tax.',
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Close'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: const Text(
                        "Tell me more about reducing taxes with 80C.",
                        style: TextStyle(color: Colors.red, fontSize: 15),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLegendItem(String title, double value, Color color) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 12,
            height: 12,
            color: color,
          ),
          const SizedBox(width: 4),
          Text(
            '$title: ₹${value.toStringAsFixed(2)}',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xffffffff)),
          ),
        ],
      ),
    );
  }
}
