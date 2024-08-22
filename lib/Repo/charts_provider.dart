import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tax_xpert/model/userCalculationModel.dart';

final userTaxCalculationProvider = StateProvider<UserTaxCalculation>((ref) {
  return UserTaxCalculation(); // Initial values can be set here
});

final selectedChartProvider = StateProvider<String>((ref) {
  return 'Gross Income vs Taxable Income'; // Default value
});
