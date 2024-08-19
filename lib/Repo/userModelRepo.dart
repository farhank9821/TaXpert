import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tax_xpert/model/user_model.dart';

final userModelProvider = StateNotifierProvider<UserModelNotifier, UserModel>((ref) {
  return UserModelNotifier(UserModel());
});

class UserModelNotifier extends StateNotifier<UserModel> {
  UserModelNotifier(super.state);

  void updateUser({
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
  }) {
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
    );
  }
}
