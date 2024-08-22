import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tax_xpert/model/user_model.dart';

final userProvider = StateNotifierProvider<UserNotifier, UserModel>((ref) => UserNotifier());

class UserNotifier extends StateNotifier<UserModel> {
  UserNotifier() : super(UserModel());

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
      salary: salary ?? state.salary,
      incomeFromInterest: incomeFromInterest ?? state.incomeFromInterest,
      rentalIncome: rentalIncome ?? state.rentalIncome,
      incomeFromOtherSources: incomeFromOtherSources ?? state.incomeFromOtherSources,
      lifeInsurance: lifeInsurance ?? state.lifeInsurance,
      providentFund: providentFund ?? state.providentFund,
      tuitionFees: tuitionFees ?? state.tuitionFees,
      annuities: annuities ?? state.annuities,
      pensionScheme: pensionScheme ?? state.pensionScheme,
      additionalPensionScheme: additionalPensionScheme ?? state.additionalPensionScheme,
      employerPensionContribution: employerPensionContribution ?? state.employerPensionContribution,
      agnipathContribution: agnipathContribution ?? state.agnipathContribution,
      healthInsurance: healthInsurance ?? state.healthInsurance,
      preventiveCheckup: preventiveCheckup ?? state.preventiveCheckup,
      medicalTreatment: medicalTreatment ?? state.medicalTreatment,
      educationLoanInterest: educationLoanInterest ?? state.educationLoanInterest,
      homeLoanInterest: homeLoanInterest ?? state.homeLoanInterest,
      firstTimeHomeBuyerInterest: firstTimeHomeBuyerInterest ?? state.firstTimeHomeBuyerInterest,
      electricVehicleLoanInterest: electricVehicleLoanInterest ?? state.electricVehicleLoanInterest,
      donations: donations ?? state.donations,
      rentPaid: rentPaid ?? state.rentPaid,
      scientificResearchDonations: scientificResearchDonations ?? state.scientificResearchDonations,
      politicalPartyDonations: politicalPartyDonations ?? state.politicalPartyDonations,
      savingsAccountInterest: savingsAccountInterest ?? state.savingsAccountInterest,
      depositsInterest: depositsInterest ?? state.depositsInterest,
      disabilityDeduction: disabilityDeduction ?? state.disabilityDeduction,
    );
  }
}
