import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tax_xpert/Repo/UserCalculationRepo.dart';
import 'package:tax_xpert/model/userCalculationModel.dart';

class NewRegime extends ConsumerStatefulWidget {
  const NewRegime({super.key});

  @override
  _NewRegimeState createState() => _NewRegimeState();
}

class _NewRegimeState extends ConsumerState<NewRegime> {
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
    var theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: theme.colorScheme.onTertiary,
          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCircularIndicator(),
          const SizedBox(height: 20),
          _buildSummaryDetails(),
        ],
      ),
    );
  }

  Widget _buildCircularIndicator() {
    double progress = 0.0;
    if (_taxCalculation.grossIncome != null && _taxCalculation.grossIncome! > 0) {
      progress = (_taxCalculation.netTaxPayableNew ?? 0) / _taxCalculation.grossIncome!;
    }
    progress = progress.clamp(0.0, 1.0);

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  blurRadius: 1.5,
                  spreadRadius: 1.0,
                ),
              ],
            ),
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
              Text('Net Tax payable', style: Theme.of(context).textTheme.titleSmall),
              Text('₹${(_taxCalculation.netTaxPayableNew ?? 0).toStringAsFixed(2)}', style: Theme.of(context).textTheme.displaySmall),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryDetails() {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildDetailRow('Gross Income', _taxCalculation.grossIncome ?? 0, Colors.green)),
            Expanded(child: _buildDetailRow('Standard Deduction', _taxCalculation.standardDeductionNew ?? 0, Colors.orange)),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildDetailRow('Total Deduction', _taxCalculation.totalDeductionNew ?? 0, Colors.amber)),
            Expanded(child: _buildDetailRow('Taxable Income', _taxCalculation.taxableIncomeNew ?? 0, Colors.grey)),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildDetailRow('Tax Payable', _taxCalculation.taxPayableNew ?? 0, Colors.blue)),
            Expanded(child: _buildDetailRow('Taxes Already Paid', _taxCalculation.taxesAlreadyPaidNew ?? 0, Colors.purple))
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: _buildDetailRow('Net Tax Payable', _taxCalculation.netTaxPayableNew ?? 0, Colors.green)),
          ],
        ),
      ],
    );
  }

  Widget _buildDetailRow(String label, double value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 12),
                ),
                Text(
                  '₹ ${value.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(fontSize: 16),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
