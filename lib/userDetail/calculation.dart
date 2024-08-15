import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final calculationProvider = Provider<CalculationField>((ref) => CalculationField());

class CalculationField {
  double grossSalary = 0.0;

  void grossSalarySum(
    TextEditingController salaryIncomeController,
    TextEditingController incomeFromInterestController,
    TextEditingController rentalIncomeController,
    TextEditingController incomeFromOtherSourcesController,
  ) {
    double salary = double.tryParse(salaryIncomeController.text) ?? 0.0;
    double incomeFromInterest = double.tryParse(incomeFromInterestController.text) ?? 0.0;
    double rentalIncome = double.tryParse(rentalIncomeController.text) ?? 0.0;
    double incomeFromOtherSources = double.tryParse(incomeFromOtherSourcesController.text) ?? 0.0;

    double totalGrossSalary = salary + incomeFromInterest + rentalIncome + incomeFromOtherSources;
    grossSalary = totalGrossSalary;
  }

  double deduction80D(
    TextEditingController healthInsuranceController,
    TextEditingController preventiveCheckupController,
  ) {
    double healthInsurance = double.tryParse(healthInsuranceController.text) ?? 0.0;
    double preventiveCheckup = double.tryParse(preventiveCheckupController.text) ?? 0.0;

    double cappedHealthInsurance = healthInsurance > 25000 ? 25000.0 : healthInsurance;
    double cappedPreventiveCheckup = preventiveCheckup > 5000 ? 5000.0 : preventiveCheckup;

    return cappedHealthInsurance + cappedPreventiveCheckup;
  }

  double deduction80E(
    TextEditingController educationLoanInterestController,
    TextEditingController homeLoanInterestController,
    TextEditingController firstTimeHomeBuyerInterestController,
    TextEditingController electricVehicleLoanInterestController,
    TextEditingController donationsController,
    TextEditingController rentPaidController,
    TextEditingController scientificResearchDonationsController,
    TextEditingController politicalPartyDonationsController,
    TextEditingController savingsAccountInterestController,
    TextEditingController depositsInterestController,
    TextEditingController disabilityDeductionController,
  ) {
    double educationLoanInterest = double.tryParse(educationLoanInterestController.text) ?? 0.0;
    double homeLoanInterest = double.tryParse(homeLoanInterestController.text) ?? 0.0;
    double firstTimeHomeBuyerInterest = double.tryParse(firstTimeHomeBuyerInterestController.text) ?? 0.0;
    double electricVehicleLoanInterest = double.tryParse(electricVehicleLoanInterestController.text) ?? 0.0;
    double donations = double.tryParse(donationsController.text) ?? 0.0;
    double rentPaid = double.tryParse(rentPaidController.text) ?? 0.0;
    double scientificResearchDonations = double.tryParse(scientificResearchDonationsController.text) ?? 0.0;
    double politicalPartyDonations = double.tryParse(politicalPartyDonationsController.text) ?? 0.0;
    double savingsAccountInterest = double.tryParse(savingsAccountInterestController.text) ?? 0.0;
    double depositsInterest = double.tryParse(depositsInterestController.text) ?? 0.0;
    double disabilityDeduction = double.tryParse(disabilityDeductionController.text) ?? 0.0;

    double cappedHomeLoanInterest = homeLoanInterest > 50000 ? 50000.0 : homeLoanInterest;
    double cappedFirstTimeHomeBuyerInterest = firstTimeHomeBuyerInterest > 150000 ? 150000.0 : firstTimeHomeBuyerInterest;
    double cappedElectricVehicleLoanInterest = electricVehicleLoanInterest > 150000 ? 150000.0 : electricVehicleLoanInterest;
    double cappedSavingsAccountInterest = savingsAccountInterest > 10000 ? 10000.0 : savingsAccountInterest;
    double cappedDepositsInterest = depositsInterest > 50000 ? 50000.0 : depositsInterest;
    double cappedDisabilityDeduction = disabilityDeduction > 125000 ? 125000.0 : (disabilityDeduction > 75000 ? 75000.0 : disabilityDeduction);

    return educationLoanInterest +
        cappedHomeLoanInterest +
        cappedFirstTimeHomeBuyerInterest +
        cappedElectricVehicleLoanInterest +
        donations +
        rentPaid +
        scientificResearchDonations +
        politicalPartyDonations +
        cappedSavingsAccountInterest +
        cappedDepositsInterest +
        cappedDisabilityDeduction;
  }

  double rentalIncomeDeduction(TextEditingController rentalIncomeController) {
    double rentalIncome = double.tryParse(rentalIncomeController.text) ?? 0.0;
    return rentalIncome - (rentalIncome * 0.30);
  }
}
