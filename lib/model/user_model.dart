// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final userModelProvider = Provider<UserModel>((ref) {
  return UserModel();
});

class UserModel {
  double? salary;
  double? incomeFromInterest;
  double? rentalIncome;
  double? incomeFromOtherSources;

  double? lifeInsurance;
  double? providentFund;
  double? tuitionFees;
  double? annuities;
  double? pensionScheme;
  double? additionalPensionScheme;
  double? employerPensionContribution;
  double? agnipathContribution;
  double? healthInsurance;
  double? preventiveCheckup;
  double? medicalTreatment;
  double? educationLoanInterest;
  double? homeLoanInterest;
  double? firstTimeHomeBuyerInterest;
  double? electricVehicleLoanInterest;
  double? donations;
  double? rentPaid;
  double? scientificResearchDonations;
  double? politicalPartyDonations;
  double? savingsAccountInterest;
  double? depositsInterest;
  double? disabilityDeduction;

  UserModel({
    this.salary,
    this.incomeFromInterest,
    this.rentalIncome,
    this.incomeFromOtherSources,
    this.lifeInsurance,
    this.providentFund,
    this.tuitionFees,
    this.annuities,
    this.pensionScheme,
    this.additionalPensionScheme,
    this.employerPensionContribution,
    this.agnipathContribution,
    this.healthInsurance,
    this.preventiveCheckup,
    this.medicalTreatment,
    this.educationLoanInterest,
    this.homeLoanInterest,
    this.firstTimeHomeBuyerInterest,
    this.electricVehicleLoanInterest,
    this.donations,
    this.rentPaid,
    this.scientificResearchDonations,
    this.politicalPartyDonations,
    this.savingsAccountInterest,
    this.depositsInterest,
    this.disabilityDeduction,
  });

  UserModel copyWith({
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
    return UserModel(
      salary: salary ?? this.salary,
      incomeFromInterest: incomeFromInterest ?? this.incomeFromInterest,
      rentalIncome: rentalIncome ?? this.rentalIncome,
      incomeFromOtherSources: incomeFromOtherSources ?? this.incomeFromOtherSources,
      lifeInsurance: lifeInsurance ?? this.lifeInsurance,
      providentFund: providentFund ?? this.providentFund,
      tuitionFees: tuitionFees ?? this.tuitionFees,
      annuities: annuities ?? this.annuities,
      pensionScheme: pensionScheme ?? this.pensionScheme,
      additionalPensionScheme: additionalPensionScheme ?? this.additionalPensionScheme,
      employerPensionContribution: employerPensionContribution ?? this.employerPensionContribution,
      agnipathContribution: agnipathContribution ?? this.agnipathContribution,
      healthInsurance: healthInsurance ?? this.healthInsurance,
      preventiveCheckup: preventiveCheckup ?? this.preventiveCheckup,
      medicalTreatment: medicalTreatment ?? this.medicalTreatment,
      educationLoanInterest: educationLoanInterest ?? this.educationLoanInterest,
      homeLoanInterest: homeLoanInterest ?? this.homeLoanInterest,
      firstTimeHomeBuyerInterest: firstTimeHomeBuyerInterest ?? this.firstTimeHomeBuyerInterest,
      electricVehicleLoanInterest: electricVehicleLoanInterest ?? this.electricVehicleLoanInterest,
      donations: donations ?? this.donations,
      rentPaid: rentPaid ?? this.rentPaid,
      scientificResearchDonations: scientificResearchDonations ?? this.scientificResearchDonations,
      politicalPartyDonations: politicalPartyDonations ?? this.politicalPartyDonations,
      savingsAccountInterest: savingsAccountInterest ?? this.savingsAccountInterest,
      depositsInterest: depositsInterest ?? this.depositsInterest,
      disabilityDeduction: disabilityDeduction ?? this.disabilityDeduction,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'salary': salary,
      'incomeFromInterest': incomeFromInterest,
      'rentalIncome': rentalIncome,
      'incomeFromOtherSources': incomeFromOtherSources,
      'lifeInsurance': lifeInsurance,
      'providentFund': providentFund,
      'tuitionFees': tuitionFees,
      'annuities': annuities,
      'pensionScheme': pensionScheme,
      'additionalPensionScheme': additionalPensionScheme,
      'employerPensionContribution': employerPensionContribution,
      'agnipathContribution': agnipathContribution,
      'healthInsurance': healthInsurance,
      'preventiveCheckup': preventiveCheckup,
      'medicalTreatment': medicalTreatment,
      'educationLoanInterest': educationLoanInterest,
      'homeLoanInterest': homeLoanInterest,
      'firstTimeHomeBuyerInterest': firstTimeHomeBuyerInterest,
      'electricVehicleLoanInterest': electricVehicleLoanInterest,
      'donations': donations,
      'rentPaid': rentPaid,
      'scientificResearchDonations': scientificResearchDonations,
      'politicalPartyDonations': politicalPartyDonations,
      'savingsAccountInterest': savingsAccountInterest,
      'depositsInterest': depositsInterest,
      'disabilityDeduction': disabilityDeduction,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      salary: map['salary']?.toDouble(),
      incomeFromInterest: map['incomeFromInterest']?.toDouble(),
      rentalIncome: map['rentalIncome']?.toDouble(),
      incomeFromOtherSources: map['incomeFromOtherSources']?.toDouble(),
      lifeInsurance: map['lifeInsurance']?.toDouble(),
      providentFund: map['providentFund']?.toDouble(),
      tuitionFees: map['tuitionFees']?.toDouble(),
      annuities: map['annuities']?.toDouble(),
      pensionScheme: map['pensionScheme']?.toDouble(),
      additionalPensionScheme: map['additionalPensionScheme']?.toDouble(),
      employerPensionContribution: map['employerPensionContribution']?.toDouble(),
      agnipathContribution: map['agnipathContribution']?.toDouble(),
      healthInsurance: map['healthInsurance']?.toDouble(),
      preventiveCheckup: map['preventiveCheckup']?.toDouble(),
      medicalTreatment: map['medicalTreatment']?.toDouble(),
      educationLoanInterest: map['educationLoanInterest']?.toDouble(),
      homeLoanInterest: map['homeLoanInterest']?.toDouble(),
      firstTimeHomeBuyerInterest: map['firstTimeHomeBuyerInterest']?.toDouble(),
      electricVehicleLoanInterest: map['electricVehicleLoanInterest']?.toDouble(),
      donations: map['donations']?.toDouble(),
      rentPaid: map['rentPaid']?.toDouble(),
      scientificResearchDonations: map['scientificResearchDonations']?.toDouble(),
      politicalPartyDonations: map['politicalPartyDonations']?.toDouble(),
      savingsAccountInterest: map['savingsAccountInterest']?.toDouble(),
      depositsInterest: map['depositsInterest']?.toDouble(),
      disabilityDeduction: map['disabilityDeduction']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(salary: $salary, incomeFromInterest: $incomeFromInterest, rentalIncome: $rentalIncome, incomeFromOtherSources: $incomeFromOtherSources, lifeInsurance: $lifeInsurance, providentFund: $providentFund, tuitionFees: $tuitionFees, annuities: $annuities, pensionScheme: $pensionScheme, additionalPensionScheme: $additionalPensionScheme, employerPensionContribution: $employerPensionContribution, agnipathContribution: $agnipathContribution, healthInsurance: $healthInsurance, preventiveCheckup: $preventiveCheckup, medicalTreatment: $medicalTreatment, educationLoanInterest: $educationLoanInterest, homeLoanInterest: $homeLoanInterest, firstTimeHomeBuyerInterest: $firstTimeHomeBuyerInterest, electricVehicleLoanInterest: $electricVehicleLoanInterest, donations: $donations, rentPaid: $rentPaid, scientificResearchDonations: $scientificResearchDonations, politicalPartyDonations: $politicalPartyDonations, savingsAccountInterest: $savingsAccountInterest, depositsInterest: $depositsInterest, disabilityDeduction: $disabilityDeduction)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.salary == salary &&
        other.incomeFromInterest == incomeFromInterest &&
        other.rentalIncome == rentalIncome &&
        other.incomeFromOtherSources == incomeFromOtherSources &&
        other.lifeInsurance == lifeInsurance &&
        other.providentFund == providentFund &&
        other.tuitionFees == tuitionFees &&
        other.annuities == annuities &&
        other.pensionScheme == pensionScheme &&
        other.additionalPensionScheme == additionalPensionScheme &&
        other.employerPensionContribution == employerPensionContribution &&
        other.agnipathContribution == agnipathContribution &&
        other.healthInsurance == healthInsurance &&
        other.preventiveCheckup == preventiveCheckup &&
        other.medicalTreatment == medicalTreatment &&
        other.educationLoanInterest == educationLoanInterest &&
        other.homeLoanInterest == homeLoanInterest &&
        other.firstTimeHomeBuyerInterest == firstTimeHomeBuyerInterest &&
        other.electricVehicleLoanInterest == electricVehicleLoanInterest &&
        other.donations == donations &&
        other.rentPaid == rentPaid &&
        other.scientificResearchDonations == scientificResearchDonations &&
        other.politicalPartyDonations == politicalPartyDonations &&
        other.savingsAccountInterest == savingsAccountInterest &&
        other.depositsInterest == depositsInterest &&
        other.disabilityDeduction == disabilityDeduction;
  }

  @override
  int get hashCode {
    return salary.hashCode ^
        incomeFromInterest.hashCode ^
        rentalIncome.hashCode ^
        incomeFromOtherSources.hashCode ^
        lifeInsurance.hashCode ^
        providentFund.hashCode ^
        tuitionFees.hashCode ^
        annuities.hashCode ^
        pensionScheme.hashCode ^
        additionalPensionScheme.hashCode ^
        employerPensionContribution.hashCode ^
        agnipathContribution.hashCode ^
        healthInsurance.hashCode ^
        preventiveCheckup.hashCode ^
        medicalTreatment.hashCode ^
        educationLoanInterest.hashCode ^
        homeLoanInterest.hashCode ^
        firstTimeHomeBuyerInterest.hashCode ^
        electricVehicleLoanInterest.hashCode ^
        donations.hashCode ^
        rentPaid.hashCode ^
        scientificResearchDonations.hashCode ^
        politicalPartyDonations.hashCode ^
        savingsAccountInterest.hashCode ^
        depositsInterest.hashCode ^
        disabilityDeduction.hashCode;
  }
}
