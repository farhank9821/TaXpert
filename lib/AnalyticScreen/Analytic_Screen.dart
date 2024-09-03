import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tax_xpert/AnalyticScreen/deduction_list.dart';
import 'package:tax_xpert/AnalyticScreen/widget/chartsss.dart';
import 'dart:io';

import 'package:tax_xpert/Repo/UserCalculationRepo.dart';
import 'package:tax_xpert/Repo/userModelRepo.dart';
import 'package:tax_xpert/model/userCalculationModel.dart';
import 'package:tax_xpert/model/user_model.dart';

class ReportGeneratorScreen extends ConsumerWidget {
  const ReportGeneratorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider);
    final taxCalc = ref.watch(taxCalculationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tax Report'),
      ),
      body: _buildBody(context, user, taxCalc, ref),
    );
  }

  Widget _buildBody(BuildContext context, UserModel user, UserTaxCalculation taxCalc, WidgetRef ref) {
    if (taxCalc.grossIncome == null || taxCalc.grossIncome! <= 0) {
      return DeductionScreen();
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildIncomeTaxChart(taxCalc),
              const SizedBox(height: 20),
              _buildGeneratePDFButton(context, ref),
              const SizedBox(height: 20),
              _buildSummaryCard(taxCalc),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIncomeTaxChart(UserTaxCalculation taxCalc) {
    return SizedBox(
      child: IncomeTaxChart(
        grossIncome: taxCalc.grossIncome ?? 0.0,
        totalDeductionNew: taxCalc.totalDeductionNew ?? 0.0,
        netTaxPayableNew: taxCalc.netTaxPayableNew ?? 0.0,
        standardDeductionNew: taxCalc.standardDeductionNew ?? 0.0,
        taxPayableNew: taxCalc.taxPayableNew ?? 0.0,
        taxableIncomeNew: taxCalc.taxableIncomeNew ?? 0.0,
        taxesAlreadyPaidNew: taxCalc.taxesAlreadyPaidNew ?? 0.0,
        differenceBetween: taxCalc.differenceBetween ?? 0.0,
      ),
    );
  }

  Widget _buildGeneratePDFButton(BuildContext context, WidgetRef ref) {
    return Center(
      child: ElevatedButton.icon(
        icon: const Icon(Icons.picture_as_pdf),
        label: const Text('Generate and Share PDF Report'),
        onPressed: () => _generateAndSharePDF(context, ref),
      ),
    );
  }

  Widget _buildSummaryCard(UserTaxCalculation taxCalc) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Summary', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildSummaryRow('Gross Income', taxCalc.grossIncome),
            _buildSummaryRow('Total Deduction', taxCalc.totalDeductionNew),
            _buildSummaryRow('Taxable Income', taxCalc.taxableIncomeNew),
            _buildSummaryRow('Tax Payable', taxCalc.taxPayableNew),
            _buildSummaryRow('Net Tax Payable', taxCalc.netTaxPayableNew),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, double? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value?.toStringAsFixed(2) ?? 'N/A'),
        ],
      ),
    );
  }

  Future<void> _generateAndSharePDF(BuildContext context, WidgetRef ref) async {
    final user = ref.read(userProvider);
    final taxCalc = ref.read(taxCalculationProvider);

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
          pw.Text(user.salary?.toStringAsFixed(2) ?? 'N/A'),
        ]),
        pw.TableRow(children: [
          pw.Text('Income from Interest'),
          pw.Text(user.incomeFromInterest?.toStringAsFixed(2) ?? 'N/A'),
        ]),
        pw.TableRow(children: [
          pw.Text('Rental Income'),
          pw.Text(user.rentalIncome?.toStringAsFixed(2) ?? 'N/A'),
        ]),
        pw.TableRow(children: [
          pw.Text('Income from Other Sources'),
          pw.Text(user.incomeFromOtherSources?.toStringAsFixed(2) ?? 'N/A'),
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
          pw.Text(taxCalc.grossIncome?.toStringAsFixed(2) ?? 'N/A'),
          pw.Text(taxCalc.grossIncome?.toStringAsFixed(2) ?? 'N/A'),
        ]),
        pw.TableRow(children: [
          pw.Text('Total Deduction'),
          pw.Text(taxCalc.totalDeductionNew?.toStringAsFixed(2) ?? 'N/A'),
          pw.Text(taxCalc.totalDeductionOld?.toStringAsFixed(2) ?? 'N/A'),
        ]),
        pw.TableRow(children: [
          pw.Text('Taxable Income'),
          pw.Text(taxCalc.taxableIncomeNew?.toStringAsFixed(2) ?? 'N/A'),
          pw.Text(taxCalc.taxableIncomeOld?.toStringAsFixed(2) ?? 'N/A'),
        ]),
        pw.TableRow(children: [
          pw.Text('Tax Payable'),
          pw.Text(taxCalc.taxPayableNew?.toStringAsFixed(2) ?? 'N/A'),
          pw.Text(taxCalc.taxPayableOld?.toStringAsFixed(2) ?? 'N/A'),
        ]),
        pw.TableRow(children: [
          pw.Text('Taxes Already Paid'),
          pw.Text(taxCalc.taxesAlreadyPaidNew?.toStringAsFixed(2) ?? 'N/A'),
          pw.Text(taxCalc.taxesAlreadyPaidOld?.toStringAsFixed(2) ?? 'N/A'),
        ]),
        pw.TableRow(children: [
          pw.Text('Net Tax Payable'),
          pw.Text(taxCalc.netTaxPayableNew?.toStringAsFixed(2) ?? 'N/A'),
          pw.Text(taxCalc.netTaxPayableOld?.toStringAsFixed(2) ?? 'N/A'),
        ]),
      ],
    );
  }

  pw.Widget _buildDetailedBreakdown(UserTaxCalculation taxCalc, UserModel user) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text('Deductions:'),
        pw.Text('Life Insurance: ${user.lifeInsurance?.toStringAsFixed(2) ?? 'N/A'}'),
        pw.Text('Provident Fund: ${user.providentFund?.toStringAsFixed(2) ?? 'N/A'}'),
        pw.Text('Tuition Fees: ${user.tuitionFees?.toStringAsFixed(2) ?? 'N/A'}'),
        pw.Text('Health Insurance: ${user.healthInsurance?.toStringAsFixed(2) ?? 'N/A'}'),
        pw.SizedBox(height: 10),
        pw.Text('Other Details:'),
        pw.Text('TDS: ${user.tds?.toStringAsFixed(2) ?? 'N/A'}'),
        pw.Text('Advance Tax: ${user.advanceTax?.toStringAsFixed(2) ?? 'N/A'}'),
        pw.Text('Self Assessment Tax: ${user.self_assessment_tax?.toStringAsFixed(2) ?? 'N/A'}'),
      ],
    );
  }
}
