import 'dart:math';

class TaxSlab {
  final double lowerLimit;
  final double upperLimit;
  final double rate;

  TaxSlab(this.lowerLimit, this.upperLimit, this.rate);

  double oldRegimeIncomeTaxCalc(double totalAnnualIncome, double totalDeductions) {
    double income = totalAnnualIncome - totalDeductions;

    final slabs = [
      TaxSlab(250000, 500000, 0.05),
      TaxSlab(500000, 1000000, 0.2),
      TaxSlab(1000000, double.infinity, 0.3),
    ];

    double tax = 0.0;
    double taxableIncome = income;

    for (final slab in slabs) {
      if (taxableIncome <= 0) {
        break;
      }

      final slabAmount = min(slab.upperLimit, taxableIncome) - slab.lowerLimit;
      tax += slabAmount * slab.rate;
      taxableIncome -= slabAmount;
    }

    print(tax);
    return tax;
  }
}
