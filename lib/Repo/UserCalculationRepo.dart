import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:tax_xpert/Repo/userbasicInfoRepo.dart';
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
          standardDeductionNew: 75000,
          taxPayableNew: 0,
          taxPayableOld: 0,
          taxableIncomeNew: 0,
          taxableIncomeOld: 0,
          taxesAlreadyPaidNew: 0,
          taxesAlreadyPaidOld: 0,
          totalDeductionOld: 0,
        )) {
    loadTaxCalculation();
  }

  static const String _boxName = 'taxCalculationBox';
  static const String _key = 'userTaxCalculation';

  Future<void> loadTaxCalculation() async {
    final box = await Hive.openBox<UserTaxCalculation>(_boxName);
    final savedCalculation = box.get(_key);
    if (savedCalculation != null) {
      state = savedCalculation;
    }
  }

  Future<void> calculateTax(UserModel um, ref) async {
    final basicInfo = ref.read(userBasicProvider);
    double rental_income = (um.rentalIncome ?? 0.0) - ((um.rentalIncome ?? 0.0) * 0.3);
    rental_income = rental_income > 0 ? rental_income : 0;

    double grossIncome = (um.salary ?? 0.0) + (um.incomeFromInterest ?? 0.0) + rental_income + (um.incomeFromOtherSources ?? 0.0);

    // Combined limit for 80C, 80CCC, and 80CCD(1)
    double deduction_80C_CCC_CCD1 =
        (um.lifeInsurance ?? 0.0) + (um.providentFund ?? 0.0) + (um.tuitionFees ?? 0.0) + (um.annuities ?? 0.0) + (um.pensionScheme ?? 0.0);
    deduction_80C_CCC_CCD1 = deduction_80C_CCC_CCD1 > 150000 ? 150000 : deduction_80C_CCC_CCD1;

    double deduction_80CCD1B = um.additionalPensionScheme ?? 0.0;
    deduction_80CCD1B = deduction_80CCD1B > 50000 ? 50000 : deduction_80CCD1B;

    // 80CCD(2) should be limited to 10% or 14% of salary
    double deduction_80CCD2 = um.employerPensionContribution ?? 0.0;
    double salary = um.salary ?? 0.0;

    double deduction_80CCH = um.agnipathContribution ?? 0.0;

    // 80D calculation including parents' premium
    double deduction_80D = 0;
    double selfAndFamilyPremium = (um.healthInsurance ?? 0.0) + (um.preventiveCheckup ?? 0.0);
    selfAndFamilyPremium = basicInfo.age > 60
        ? (selfAndFamilyPremium > 50000 ? 50000 : selfAndFamilyPremium)
        : (selfAndFamilyPremium > 25000 ? 25000 : selfAndFamilyPremium);

    deduction_80D = selfAndFamilyPremium;

    double deduction_80DDB = 0;
    if (basicInfo.age < 60) {
      deduction_80DDB = um.medicalTreatment ?? 0.0;
      deduction_80DDB = deduction_80DDB > 40000 ? 40000 : deduction_80DDB;
    } else {
      deduction_80DDB = um.medicalTreatment ?? 0.0;
      deduction_80DDB = deduction_80DDB > 100000 ? 100000 : deduction_80DDB;
    }

    double deduction_80E = um.educationLoanInterest ?? 0.0;

    double deduction_80EE = um.homeLoanInterest ?? 0.0;
    deduction_80EE = deduction_80EE > 50000 ? 50000 : deduction_80EE;

    double deduction_80EEA = um.firstTimeHomeBuyerInterest ?? 0.0;
    deduction_80EEA = deduction_80EEA > 150000 ? 150000 : deduction_80EEA;

    double deduction_80EEB = um.electricVehicleLoanInterest ?? 0.0;
    deduction_80EEB = deduction_80EEB > 150000 ? 150000 : deduction_80EEB;

    double deduction_80G = um.donations ?? 0.0;
    double deduction_80GG = (um.rentPaid ?? 0.0) > 5000 ? 5000 * 12 : (um.rentPaid ?? 0.0 * 12);

    double deduction_80GGA = um.scientificResearchDonations ?? 0.0;

    double deduction_80GGC = um.politicalPartyDonations ?? 0.0;

    double deduction_80TTA = um.savingsAccountInterest ?? 0.0;
    deduction_80TTA = deduction_80TTA > 10000 ? 10000 : deduction_80TTA;

    double deduction_80TTB = um.depositsInterest ?? 0.0;
    deduction_80TTB = deduction_80TTB > 50000 ? 50000 : deduction_80TTB;

    double deduction_80U = um.disabilityDeduction ?? 0.0;
    deduction_80U = deduction_80U > 125000 ? 125000 : (deduction_80U > 75000 ? 75000 : deduction_80U);

    double total_deduction = deduction_80C_CCC_CCD1 +
        deduction_80CCD1B +
        deduction_80CCD2 +
        deduction_80CCH +
        deduction_80D +
        deduction_80DDB +
        deduction_80E +
        deduction_80GG +
        deduction_80EE +
        deduction_80EEA +
        deduction_80EEB +
        deduction_80G +
        deduction_80GGA +
        deduction_80GGC +
        deduction_80TTA +
        deduction_80TTB +
        deduction_80U;

    double tds = um.tds ?? 0.0;
    double advance_tax = um.advanceTax ?? 0.0;
    double self_Ass = um.self_assessment_tax ?? 0.0;
    double tax_paid_already = tds + advance_tax + self_Ass;

    double taxable_income_new = grossIncome - 75000;
    taxable_income_new = taxable_income_new > 0 ? taxable_income_new : 0;

    double taxable_income_old = grossIncome - total_deduction - 50000;
    taxable_income_old = taxable_income_old > 0 ? taxable_income_old : 0;

    double calculateOldTax(double income, int age) {
      double tax = 0;
      if (age < 60) {
        if (income <= 250000) {
          tax = 0;
        } else if (income <= 500000) {
          tax = (income - 250000) * 0.05;
        } else if (income <= 1000000) {
          tax = 12500 + (income - 500000) * 0.20;
        } else {
          tax = 112500 + (income - 1000000) * 0.30;
        }
      } else if (age >= 60 && age < 80) {
        if (income <= 300000) {
          tax = 0;
        } else if (income <= 500000) {
          tax = (income - 300000) * 0.05;
        } else if (income <= 1000000) {
          tax = 10000 + (income - 500000) * 0.20;
        } else {
          tax = 110000 + (income - 1000000) * 0.30;
        }
      } else if (age >= 80) {
        if (income <= 500000) {
          tax = 0;
        } else if (income <= 1000000) {
          tax = (income - 500000) * 0.20;
        } else {
          tax = 100000 + (income - 1000000) * 0.30;
        }
      }

      // Apply 87A rebate
      if (income <= 500000) {
        tax = tax > 12500 ? tax - 12500 : 0;
      }

      double cess = tax * 0.04;
      tax += cess;
      return tax > 0 ? tax : 0;
    }

    double calculateNewTax(double income, int age) {
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

      // Apply 87A rebate
      if (income <= 700000) {
        tax = tax > 25000 ? tax - 25000 : 0;
      }

      double cess = tax * 0.04;
      tax += cess;
      return tax > 0 ? tax : 0;
    }

    double net_payable_new = calculateNewTax(taxable_income_new, basicInfo.age) - tax_paid_already;
    net_payable_new = net_payable_new > 0 ? net_payable_new : 0;

    double net_payable_old = calculateOldTax(taxable_income_old, basicInfo.age) - tax_paid_already;
    net_payable_old = net_payable_old > 0 ? net_payable_old : 0;

    state = UserTaxCalculation(
      grossIncome: grossIncome,
      totalDeductionNew: 75000,
      netTaxPayableNew: net_payable_new,
      netTaxPayableOld: net_payable_old,
      standardDeductionOld: 50000,
      standardDeductionNew: 75000,
      taxPayableNew: calculateNewTax(taxable_income_new, basicInfo.age),
      taxPayableOld: calculateOldTax(taxable_income_old, basicInfo.age),
      taxableIncomeNew: taxable_income_new,
      taxableIncomeOld: taxable_income_old,
      taxesAlreadyPaidNew: tax_paid_already,
      taxesAlreadyPaidOld: tax_paid_already,
      totalDeductionOld: total_deduction,
    );

    final box = await Hive.openBox<UserTaxCalculation>(_boxName);
    await box.put(_key, state);
  }
}
