// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final userModelProvider = Provider<UserModel>((ref) {
  return UserModel();
});

class UserModel {
  int? salary;
  int? incomeFromInterest;
  int? rentalIncome;
  int? incomeFromOtherSources;

  int? lifeInsurance;
  int? providentFund;
  int? tuitionFees;
  int? annuities;
  int? pensionScheme;
  int? additionalPensionScheme;
  int? employerPensionContribution;
  int? agnipathContribution;
  int? healthInsurance;
  int? preventiveCheckup;
  int? medicalTreatment;
  int? educationLoanInterest;
  int? homeLoanInterest;
  int? firstTimeHomeBuyerInterest;
  int? electricVehicleLoanInterest;
  int? donations;
  int? rentPaid;
  int? scientificResearchDonations;
  int? politicalPartyDonations;
  int? savingsAccountInterest;
  int? depositsInterest;
  int? disabilityDeduction;

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
    int? salary,
    int? incomeFromInterest,
    int? rentalIncome,
    int? incomeFromOtherSources,
    int? lifeInsurance,
    int? providentFund,
    int? tuitionFees,
    int? annuities,
    int? pensionScheme,
    int? additionalPensionScheme,
    int? employerPensionContribution,
    int? agnipathContribution,
    int? healthInsurance,
    int? preventiveCheckup,
    int? medicalTreatment,
    int? educationLoanInterest,
    int? homeLoanInterest,
    int? firstTimeHomeBuyerInterest,
    int? electricVehicleLoanInterest,
    int? donations,
    int? rentPaid,
    int? scientificResearchDonations,
    int? politicalPartyDonations,
    int? savingsAccountInterest,
    int? depositsInterest,
    int? disabilityDeduction,
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
      salary: map['salary'] != null ? map['salary'] as int : null,
      incomeFromInterest: map['incomeFromInterest'] != null ? map['incomeFromInterest'] as int : null,
      rentalIncome: map['rentalIncome'] != null ? map['rentalIncome'] as int : null,
      incomeFromOtherSources: map['incomeFromOtherSources'] != null ? map['incomeFromOtherSources'] as int : null,
      lifeInsurance: map['lifeInsurance'] != null ? map['lifeInsurance'] as int : null,
      providentFund: map['providentFund'] != null ? map['providentFund'] as int : null,
      tuitionFees: map['tuitionFees'] != null ? map['tuitionFees'] as int : null,
      annuities: map['annuities'] != null ? map['annuities'] as int : null,
      pensionScheme: map['pensionScheme'] != null ? map['pensionScheme'] as int : null,
      additionalPensionScheme: map['additionalPensionScheme'] != null ? map['additionalPensionScheme'] as int : null,
      employerPensionContribution: map['employerPensionContribution'] != null ? map['employerPensionContribution'] as int : null,
      agnipathContribution: map['agnipathContribution'] != null ? map['agnipathContribution'] as int : null,
      healthInsurance: map['healthInsurance'] != null ? map['healthInsurance'] as int : null,
      preventiveCheckup: map['preventiveCheckup'] != null ? map['preventiveCheckup'] as int : null,
      medicalTreatment: map['medicalTreatment'] != null ? map['medicalTreatment'] as int : null,
      educationLoanInterest: map['educationLoanInterest'] != null ? map['educationLoanInterest'] as int : null,
      homeLoanInterest: map['homeLoanInterest'] != null ? map['homeLoanInterest'] as int : null,
      firstTimeHomeBuyerInterest: map['firstTimeHomeBuyerInterest'] != null ? map['firstTimeHomeBuyerInterest'] as int : null,
      electricVehicleLoanInterest: map['electricVehicleLoanInterest'] != null ? map['electricVehicleLoanInterest'] as int : null,
      donations: map['donations'] != null ? map['donations'] as int : null,
      rentPaid: map['rentPaid'] != null ? map['rentPaid'] as int : null,
      scientificResearchDonations: map['scientificResearchDonations'] != null ? map['scientificResearchDonations'] as int : null,
      politicalPartyDonations: map['politicalPartyDonations'] != null ? map['politicalPartyDonations'] as int : null,
      savingsAccountInterest: map['savingsAccountInterest'] != null ? map['savingsAccountInterest'] as int : null,
      depositsInterest: map['depositsInterest'] != null ? map['depositsInterest'] as int : null,
      disabilityDeduction: map['disabilityDeduction'] != null ? map['disabilityDeduction'] as int : null,
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
