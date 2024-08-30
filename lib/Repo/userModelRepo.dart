import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tax_xpert/model/user_model.dart';

final userProvider = StateNotifierProvider<UserNotifier, UserModel>((ref) => UserNotifier());

class UserNotifier extends StateNotifier<UserModel> {
  UserNotifier() : super(UserModel());

  Future<void> updateUser({
    double? salary,
    double? incomeFromInterest,
    double? rentalIncome,
    double? incomeFromOtherSources,
    double? lifeInsurance,
    double? providentFund,
    double? tuitionFees,
    double? annuities,
    double? pensionScheme,
    double? additionalPensionScheme,
    double? employerPensionContribution,
    double? agnipathContribution,
    double? healthInsurance,
    double? preventiveCheckup,
    double? medicalTreatment,
    double? educationLoanInterest,
    double? homeLoanInterest,
    double? firstTimeHomeBuyerInterest,
    double? electricVehicleLoanInterest,
    double? donations,
    double? rentPaid,
    double? scientificResearchDonations,
    double? politicalPartyDonations,
    double? savingsAccountInterest,
    double? depositsInterest,
    double? disabilityDeduction,
    double? tds,
    double? advanceTax,
    double? self_assessment_tax,
  }) async {
    state = state.copyWith(
      salary: salary,
      incomeFromInterest: incomeFromInterest,
      rentalIncome: rentalIncome,
      incomeFromOtherSources: incomeFromOtherSources,
      lifeInsurance: lifeInsurance,
      providentFund: providentFund,
      tuitionFees: tuitionFees,
      annuities: annuities,
      pensionScheme: pensionScheme,
      additionalPensionScheme: additionalPensionScheme,
      employerPensionContribution: employerPensionContribution,
      agnipathContribution: agnipathContribution,
      healthInsurance: healthInsurance,
      preventiveCheckup: preventiveCheckup,
      medicalTreatment: medicalTreatment,
      educationLoanInterest: educationLoanInterest,
      homeLoanInterest: homeLoanInterest,
      firstTimeHomeBuyerInterest: firstTimeHomeBuyerInterest,
      electricVehicleLoanInterest: electricVehicleLoanInterest,
      donations: donations,
      rentPaid: rentPaid,
      scientificResearchDonations: scientificResearchDonations,
      politicalPartyDonations: politicalPartyDonations,
      savingsAccountInterest: savingsAccountInterest,
      depositsInterest: depositsInterest,
      disabilityDeduction: disabilityDeduction,
      tds: tds,
      advanceTax: advanceTax,
      self_assessment_tax: self_assessment_tax,
    );
  }
}
