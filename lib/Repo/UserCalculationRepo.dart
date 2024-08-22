import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tax_xpert/model/userCalculationModel.dart';
import 'package:tax_xpert/model/user_model.dart';

final taxCalculationProvider = StateNotifierProvider<TaxCalculationNotifier, UserTaxCalculation>((ref) => TaxCalculationNotifier());

class TaxCalculationNotifier extends StateNotifier<UserTaxCalculation> {
  TaxCalculationNotifier()
      : super(UserTaxCalculation(
          grossIncome: 0,
          totalDeductionNew: 75000,
          netTaxPayableNew: 0,
          netTaxPayableOld: 0,
          standardDeductionOld: 50000,
          taxPayableNew: 0,
          taxPayableOld: 0,
          taxableIncomeNew: 0,
          taxableIncomeOld: 0,
          taxesAlreadyPaidNew: 0,
          taxesAlreadyPaidOld: 0,
          totalDeductionOld: 0,
        ));

  void calculateTax(UserModel um) {
    double grossIncome = (um.salary ?? 0.0) + (um.incomeFromInterest ?? 0.0) + (um.rentalIncome ?? 0.0) + (um.incomeFromOtherSources ?? 0.0);

    double deduction_80 = (um.lifeInsurance ?? 0.0) + (um.providentFund ?? 0.0) + (um.tuitionFees ?? 0.0);
    deduction_80 = deduction_80 > 150000 ? 150000 : deduction_80;

    double deduction_80CCC = um.annuities ?? 0.0;

    double deduction_80CCD1 = um.pensionScheme ?? 0.0;
    deduction_80CCD1 = deduction_80CCD1 > 150000 ? 150000 : deduction_80CCD1;

    double deduction_80CCD1B = um.additionalPensionScheme ?? 0.0;
    deduction_80CCD1B = deduction_80CCD1B > 50000 ? 50000 : deduction_80CCD1B;

    double deduction_80CCD2 = um.employerPensionContribution ?? 0.0;

    double deduction_80CCH = um.agnipathContribution ?? 0.0;

    double deduction_80D = (um.healthInsurance ?? 0.0) + (um.preventiveCheckup ?? 0.0);
    deduction_80D = deduction_80D > 25000 ? 25000 : deduction_80D;
    // double deduction_80D_Senior = (um.healthInsurance ?? 0.0) + (um.preventiveCheckup ?? 0.0);
    // deduction_80D_Senior = deduction_80D_Senior > 50000 ? 50000 : deduction_80D_Senior;

    double deduction_80DDB = um.medicalTreatment ?? 0.0;
    deduction_80DDB = deduction_80DDB > 40000 ? 40000 : deduction_80DDB;
    // double deduction_80DDB_Senior = um.medicalTreatment ?? 0.0;
    // deduction_80DDB_Senior = deduction_80DDB_Senior > 100000 ? 100000 : deduction_80DDB_Senior;

    double deduction_80E = um.educationLoanInterest ?? 0.0;

    double deduction_80EE = um.homeLoanInterest ?? 0.0;
    deduction_80EE = deduction_80EE > 50000 ? 50000 : deduction_80EE;

    double deduction_80EEA = um.firstTimeHomeBuyerInterest ?? 0.0;
    deduction_80EEA = deduction_80EEA > 150000 ? 150000 : deduction_80EEA;

    double deduction_80EEB = um.electricVehicleLoanInterest ?? 0.0;
    deduction_80EEB = deduction_80EEB > 150000 ? 150000 : deduction_80EEB;

    double deduction_80G = um.donations ?? 0.0;
    // TODO: hra allowance
    // double deduction_80GG = um.rentPaid ?? 0.0;

    double deduction_80GGA = um.scientificResearchDonations ?? 0.0;

    double deduction_80GGC = um.politicalPartyDonations ?? 0.0;

    double deduction_80TTA = um.savingsAccountInterest ?? 0.0;
    deduction_80TTA = deduction_80TTA > 10000 ? 10000 : deduction_80TTA;

    double deduction_80TTB = um.depositsInterest ?? 0.0;
    deduction_80TTB = deduction_80TTB > 50000 ? 50000 : deduction_80TTB;

    double deduction_80U = um.disabilityDeduction ?? 0.0;
    deduction_80U = deduction_80U > 125000 ? 125000 : (deduction_80U > 75000 ? 75000 : deduction_80U);

    double total_deduction = deduction_80 +
        deduction_80CCC +
        deduction_80CCD1 +
        deduction_80CCD1B +
        deduction_80CCD2 +
        deduction_80CCH +
        deduction_80D +
        deduction_80DDB +
        deduction_80E +
        deduction_80EE +
        deduction_80EEA +
        deduction_80EEB +
        deduction_80G +
        deduction_80GGA +
        deduction_80GGC +
        deduction_80TTA +
        deduction_80TTB +
        deduction_80U;

    double taxable_income = grossIncome - total_deduction;

    double calculateOldTax(double income) {
      income = income - 50000;
      income = income > 0 ? income : 0;
      double tax = 0;

      if (income <= 250000) {
        tax = 0;
      } else if (income <= 500000) {
        tax = (income - 250000) * 0.05;
      } else if (income <= 1000000) {
        tax = 12500 + (income - 500000) * 0.20;
      } else {
        tax = 112500 + (income - 1000000) * 0.30;
      }

      return tax;
    }

    double calculateNewTax(double income) {
      income = income - 75000;
      income = income > 0 ? income : 0;
      double tax = 0;

      if (income <= 300000) {
        tax = 0;
      } else if (income <= 600000) {
        tax = (income - 300000) * 0.05;
      } else if (income <= 900000) {
        tax = 15000 + (income - 600000) * 0.10;
      } else if (income <= 1200000) {
        tax = 45000 + (income - 900000) * 0.15;
      } else if (income <= 1500000) {
        tax = 90000 + (income - 1200000) * 0.20;
      } else {
        tax = 150000 + (income - 1500000) * 0.30;
      }
      return tax;
    }
    // state = UserTaxCalculation(totalIncome: totalIncome, payableTax: payableTax, deduction: deduction);

    state = UserTaxCalculation(
      grossIncome: grossIncome,
      totalDeductionNew: total_deduction,
      netTaxPayableNew: 0,
      netTaxPayableOld: 0,
      standardDeductionOld: 50000,
      taxPayableNew: calculateNewTax(taxable_income),
      taxPayableOld: calculateOldTax(taxable_income),
      taxableIncomeNew: taxable_income,
      taxableIncomeOld: taxable_income,
      taxesAlreadyPaidNew: 0,
      taxesAlreadyPaidOld: 0,
      totalDeductionOld: total_deduction,
    );
  }
}
