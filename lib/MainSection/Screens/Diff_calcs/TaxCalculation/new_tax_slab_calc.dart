import 'dart:math';

class NewTaxSlab {
  final double lowerLimit;
  final double upperLimit;
  final double rate;

  NewTaxSlab(this.lowerLimit, this.upperLimit, this.rate);
}

class NewTax {
  double newRegimeIncomeTaxCalc(
      double totalAnnualIncome, double totalDeductions) {
    double income = totalAnnualIncome - totalDeductions;

    final slabs = [
      NewTaxSlab(250000, 500000, 0.05),
      NewTaxSlab(500000, 750000, 0.1),
      NewTaxSlab(750000, 1000000, 0.15),
      NewTaxSlab(1000000, 1250000, 0.2),
      NewTaxSlab(1250000, 1500000, 0.25),
      NewTaxSlab(1500000, double.infinity, 0.3),
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
