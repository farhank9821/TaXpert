import 'dart:convert';

import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  final double? salary;
  @HiveField(1)
  final double? incomeFromInterest;
  @HiveField(2)
  final double? rentalIncome;
  @HiveField(3)
  final double? incomeFromOtherSources;
  @HiveField(4)
  final double? lifeInsurance;
  @HiveField(5)
  final double? providentFund;
  @HiveField(6)
  final double? tuitionFees;
  @HiveField(7)
  final double? annuities;
  @HiveField(8)
  final double? pensionScheme;
  @HiveField(9)
  final double? additionalPensionScheme;
  @HiveField(10)
  final double? employerPensionContribution;
  @HiveField(11)
  final double? agnipathContribution;
  @HiveField(12)
  final double? healthInsurance;
  @HiveField(13)
  final double? preventiveCheckup;
  @HiveField(14)
  final double? medicalTreatment;
  @HiveField(15)
  final double? educationLoanInterest;
  @HiveField(16)
  final double? homeLoanInterest;
  @HiveField(17)
  final double? firstTimeHomeBuyerInterest;
  @HiveField(18)
  final double? electricVehicleLoanInterest;
  @HiveField(19)
  final double? donations;
  @HiveField(20)
  final double? rentPaid;
  @HiveField(21)
  final double? scientificResearchDonations;
  @HiveField(22)
  final double? politicalPartyDonations;
  @HiveField(23)
  final double? savingsAccountInterest;
  @HiveField(24)
  final double? depositsInterest;
  @HiveField(25)
  final double? disabilityDeduction;
  @HiveField(26)
  final double? tds;
  @HiveField(27)
  final double? advanceTax;
  @HiveField(28)
  final double? self_assessment_tax;
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
    this.tds,
    this.advanceTax,
    this.self_assessment_tax,
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
    double? tds,
    double? advanceTax,
    double? self_assessment_tax,
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
      tds: tds ?? this.tds,
      advanceTax: advanceTax ?? this.advanceTax,
      self_assessment_tax: self_assessment_tax ?? this.self_assessment_tax,
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
      'tds': tds,
      'advanceTax': advanceTax,
      'self_assessment_tax': self_assessment_tax,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      salary: map['salary'] != null ? map['salary'] as double : null,
      incomeFromInterest: map['incomeFromInterest'] != null ? map['incomeFromInterest'] as double : null,
      rentalIncome: map['rentalIncome'] != null ? map['rentalIncome'] as double : null,
      incomeFromOtherSources: map['incomeFromOtherSources'] != null ? map['incomeFromOtherSources'] as double : null,
      lifeInsurance: map['lifeInsurance'] != null ? map['lifeInsurance'] as double : null,
      providentFund: map['providentFund'] != null ? map['providentFund'] as double : null,
      tuitionFees: map['tuitionFees'] != null ? map['tuitionFees'] as double : null,
      annuities: map['annuities'] != null ? map['annuities'] as double : null,
      pensionScheme: map['pensionScheme'] != null ? map['pensionScheme'] as double : null,
      additionalPensionScheme: map['additionalPensionScheme'] != null ? map['additionalPensionScheme'] as double : null,
      employerPensionContribution: map['employerPensionContribution'] != null ? map['employerPensionContribution'] as double : null,
      agnipathContribution: map['agnipathContribution'] != null ? map['agnipathContribution'] as double : null,
      healthInsurance: map['healthInsurance'] != null ? map['healthInsurance'] as double : null,
      preventiveCheckup: map['preventiveCheckup'] != null ? map['preventiveCheckup'] as double : null,
      medicalTreatment: map['medicalTreatment'] != null ? map['medicalTreatment'] as double : null,
      educationLoanInterest: map['educationLoanInterest'] != null ? map['educationLoanInterest'] as double : null,
      homeLoanInterest: map['homeLoanInterest'] != null ? map['homeLoanInterest'] as double : null,
      firstTimeHomeBuyerInterest: map['firstTimeHomeBuyerInterest'] != null ? map['firstTimeHomeBuyerInterest'] as double : null,
      electricVehicleLoanInterest: map['electricVehicleLoanInterest'] != null ? map['electricVehicleLoanInterest'] as double : null,
      donations: map['donations'] != null ? map['donations'] as double : null,
      rentPaid: map['rentPaid'] != null ? map['rentPaid'] as double : null,
      scientificResearchDonations: map['scientificResearchDonations'] != null ? map['scientificResearchDonations'] as double : null,
      politicalPartyDonations: map['politicalPartyDonations'] != null ? map['politicalPartyDonations'] as double : null,
      savingsAccountInterest: map['savingsAccountInterest'] != null ? map['savingsAccountInterest'] as double : null,
      depositsInterest: map['depositsInterest'] != null ? map['depositsInterest'] as double : null,
      disabilityDeduction: map['disabilityDeduction'] != null ? map['disabilityDeduction'] as double : null,
      tds: map['tds'] != null ? map['tds'] as double : null,
      advanceTax: map['advanceTax'] != null ? map['advanceTax'] as double : null,
      self_assessment_tax: map['self_assessment_tax'] != null ? map['self_assessment_tax'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

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
        other.disabilityDeduction == disabilityDeduction &&
        other.tds == tds &&
        other.advanceTax == advanceTax &&
        other.self_assessment_tax == self_assessment_tax;
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
        disabilityDeduction.hashCode ^
        tds.hashCode ^
        advanceTax.hashCode ^
        self_assessment_tax.hashCode;
  }

  @override
  String toString() {
    return 'UserModel(salary: $salary, incomeFromInterest: $incomeFromInterest, rentalIncome: $rentalIncome, incomeFromOtherSources: $incomeFromOtherSources, lifeInsurance: $lifeInsurance, providentFund: $providentFund, tuitionFees: $tuitionFees, annuities: $annuities, pensionScheme: $pensionScheme, additionalPensionScheme: $additionalPensionScheme, employerPensionContribution: $employerPensionContribution, agnipathContribution: $agnipathContribution, healthInsurance: $healthInsurance, preventiveCheckup: $preventiveCheckup, medicalTreatment: $medicalTreatment, educationLoanInterest: $educationLoanInterest, homeLoanInterest: $homeLoanInterest, firstTimeHomeBuyerInterest: $firstTimeHomeBuyerInterest, electricVehicleLoanInterest: $electricVehicleLoanInterest, donations: $donations, rentPaid: $rentPaid, scientificResearchDonations: $scientificResearchDonations, politicalPartyDonations: $politicalPartyDonations, savingsAccountInterest: $savingsAccountInterest, depositsInterest: $depositsInterest, disabilityDeduction: $disabilityDeduction, tds: $tds, advanceTax: $advanceTax, self_assessment_tax: $self_assessment_tax)';
  }
}
