import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';

import 'package:tax_xpert/Repo/UserCalculationRepo.dart';
import 'package:tax_xpert/Repo/userModelRepo.dart';
import 'package:tax_xpert/model/userCalculationModel.dart';
import 'package:tax_xpert/model/user_model.dart';

// Assume you have providers for UserTaxCalculation and userModel

class ReportGeneratorScreen extends ConsumerWidget {
  const ReportGeneratorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final taxCalc = ref.watch(taxCalculationProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Tax Report Generator')),
      body: Column(
        children: [
          Expanded(
            child: SizedBox(
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      color: Colors.blue,
                      value: taxCalc.grossIncome,
                      title: taxCalc.grossIncome! > 0 ? '${taxCalc.grossIncome}' : '',
                      titlePositionPercentageOffset: 0.55, // Move title slightly outward
                      radius: taxCalc.grossIncome! > 0 ? 50 : 0, // Adjust size based on value
                    ),
                    PieChartSectionData(
                      color: Colors.red,
                      value: user.rentalIncome,
                      title: user.rentalIncome! > 0 ? '${user.rentalIncome}%' : '',
                      titlePositionPercentageOffset: 0.55,
                      radius: user.rentalIncome! > 0 ? 50 : 0,
                    ),
                    PieChartSectionData(
                      color: Colors.green,
                      value: taxCalc.netTaxPayableNew,
                      title: taxCalc.netTaxPayableNew! > 0 ? '${taxCalc.netTaxPayableNew}' : '',
                      titlePositionPercentageOffset: 0.55,
                      radius: taxCalc.netTaxPayableNew! > 0 ? 50 : 0,
                    ),
                    PieChartSectionData(
                      color: Colors.orange,
                      value: taxCalc.totalDeductionNew,
                      title: taxCalc.totalDeductionNew! > 0 ? '${taxCalc.totalDeductionNew}' : '',
                      titlePositionPercentageOffset: 0.55,
                      radius: taxCalc.totalDeductionNew! > 0 ? 50 : 0,
                    ),
                  ],
                  borderData: FlBorderData(show: false),
                  centerSpaceRadius: 60,
                  sectionsSpace: 2, // Increase space between sections
                ),
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              child: const Text('Generate and Share PDF Report'),
              onPressed: () => _generateAndSharePDF(context, ref),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _generateAndSharePDF(BuildContext context, WidgetRef ref) async {
    final user = ref.watch(userProvider);
    final taxCalc = ref.watch(taxCalculationProvider);

    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        build: (context) => [
          pw.Header(level: 0, child: pw.Text('Tax Calculation Report')),
          pw.Header(level: 1, child: pw.Text('User Information')),
          _buildUserInfoTable(user),
          pw.SizedBox(height: 20),
          pw.Header(level: 1, child: pw.Text('Tax Calculation Comparison')),
          _buildComparisonTable(taxCalc),
          pw.SizedBox(height: 20),
          pw.Header(level: 1, child: pw.Text('Detailed Breakdown')),
          _buildDetailedBreakdown(taxCalc, user),
        ],
      ),
    );

    final output = await getTemporaryDirectory();
    final file = File('${output.path}/tax_report.pdf');
    await file.writeAsBytes(await pdf.save());

    final xFile = XFile(file.path);
    await Share.shareXFiles([xFile], text: 'Tax Calculation Report');
  }

  pw.Widget _buildUserInfoTable(UserModel user) {
    return pw.Table(
      border: pw.TableBorder.all(),
      children: [
        pw.TableRow(children: [
          pw.Text('Income Source'),
          pw.Text('Amount'),
        ]),
        pw.TableRow(children: [
          pw.Text('Salary'),
          pw.Text('${user.salary}'),
        ]),
        pw.TableRow(children: [
          pw.Text('Income from Interest'),
          pw.Text('${user.incomeFromInterest}'),
        ]),
        pw.TableRow(children: [
          pw.Text('Rental Income'),
          pw.Text('${user.rentalIncome}'),
        ]),
        pw.TableRow(children: [
          pw.Text('Income from Other Sources'),
          pw.Text('${user.incomeFromOtherSources}'),
        ]),
      ],
    );
  }

  pw.Widget _buildComparisonTable(UserTaxCalculation taxCalc) {
    return pw.Table(
      border: pw.TableBorder.all(),
      children: [
        pw.TableRow(children: [
          pw.Text(''),
          pw.Text('New Regime'),
          pw.Text('Old Regime'),
        ]),
        pw.TableRow(children: [
          pw.Text('Gross Income'),
          pw.Text('${taxCalc.grossIncome}'),
          pw.Text('${taxCalc.grossIncome}'),
        ]),
        pw.TableRow(children: [
          pw.Text('Total Deduction'),
          pw.Text('${taxCalc.totalDeductionNew}'),
          pw.Text('${taxCalc.totalDeductionOld}'),
        ]),
        pw.TableRow(children: [
          pw.Text('Taxable Income'),
          pw.Text('${taxCalc.taxableIncomeNew}'),
          pw.Text('${taxCalc.taxableIncomeOld}'),
        ]),
        pw.TableRow(children: [
          pw.Text('Tax Payable'),
          pw.Text('${taxCalc.taxPayableNew}'),
          pw.Text('${taxCalc.taxPayableOld}'),
        ]),
        pw.TableRow(children: [
          pw.Text('Taxes Already Paid'),
          pw.Text('${taxCalc.taxesAlreadyPaidNew}'),
          pw.Text('${taxCalc.taxesAlreadyPaidOld}'),
        ]),
        pw.TableRow(children: [
          pw.Text('Net Tax Payable'),
          pw.Text('${taxCalc.netTaxPayableNew}'),
          pw.Text('${taxCalc.netTaxPayableOld}'),
        ]),
      ],
    );
  }

  pw.Widget _buildDetailedBreakdown(UserTaxCalculation taxCalc, UserModel user) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text('Deductions:'),
        pw.Text('Life Insurance: ${user.lifeInsurance}'),
        pw.Text('Provident Fund: ${user.providentFund}'),
        pw.Text('Tuition Fees: ${user.tuitionFees}'),
        pw.Text('Health Insurance: ${user.healthInsurance}'),
        pw.SizedBox(height: 10),
        pw.Text('Other Details:'),
        pw.Text('TDS: ${user.tds}'),
        pw.Text('Advance Tax: ${user.advanceTax}'),
        pw.Text('Self Assessment Tax: ${user.self_assessment_tax}'),
      ],
    );
  }
}
