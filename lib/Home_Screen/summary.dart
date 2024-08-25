import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tax_xpert/Repo/UserCalculationRepo.dart';
import 'package:tax_xpert/model/userCalculationModel.dart';

class OverallSummary extends ConsumerStatefulWidget {
  const OverallSummary({super.key});

  @override
  _OverallSummaryState createState() => _OverallSummaryState();
}

class _OverallSummaryState extends ConsumerState<OverallSummary> {
  late UserTaxCalculation _taxCalculation;

  @override
  void initState() {
    super.initState();
    _taxCalculation = ref.read(taxCalculationProvider);
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<UserTaxCalculation>(taxCalculationProvider, (previous, next) {
      setState(() {
        _taxCalculation = next;
      });
    });

    return Container(
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Overall Summary',
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: _buildCircularIndicator(),
              ),
              Expanded(
                flex: 3,
                child: _buildSummaryDetails(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCircularIndicator() {
    double progress = 0.0;
    if (_taxCalculation.grossIncome != null && _taxCalculation.grossIncome! > 0) {
      progress = (_taxCalculation.totalDeductionNew ?? 0) / _taxCalculation.grossIncome!;
    }
    progress = progress.clamp(0.0, 1.0);

    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 100,
          height: 100,
          child: CircularProgressIndicator(
            value: progress,
            strokeWidth: 10,
            backgroundColor: Colors.green.withOpacity(0.2),
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Net Tax payable',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            Text(
              '₹${(_taxCalculation.netTaxPayableNew ?? 0).toStringAsFixed(2)}',
              style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSummaryDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildDetailRow('Gross Income', _taxCalculation.grossIncome ?? 0, Colors.green),
        _buildDetailRow('Standard Deduction', _taxCalculation.standardDeductionOld ?? 0, Colors.orange),
        _buildDetailRow('Total Deduction', _taxCalculation.totalDeductionNew ?? 0, Colors.amber),
        _buildDetailRow('Taxable Income', _taxCalculation.taxableIncomeNew ?? 0, Colors.grey),
        _buildDetailRow('Tax Payable', _taxCalculation.taxPayableNew ?? 0, Colors.blue),
        _buildDetailRow('Taxes Already Paid', _taxCalculation.taxesAlreadyPaidNew ?? 0, Colors.purple),
        _buildDetailRow('Net Tax Payable', _taxCalculation.netTaxPayableNew ?? 0, Colors.green),
      ],
    );
  }

  Widget _buildDetailRow(String label, double value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Text(
            '₹${value.toStringAsFixed(2)}',
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
