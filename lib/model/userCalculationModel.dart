import 'dart:convert';
import 'package:hive/hive.dart';

part 'userCalculationModel.g.dart';

@HiveType(typeId: 2)
class UserTaxCalculation {
  @HiveField(0)
  double? grossIncome = 0.0;

  @HiveField(1)
  double? totalDeductionNew = 0.0;

  @HiveField(2)
  double? taxableIncomeNew = 0.0;

  @HiveField(3)
  double? taxPayableNew = 0.0;

  @HiveField(4)
  double? taxesAlreadyPaidNew = 0.0;

  @HiveField(5)
  double? netTaxPayableNew = 0.0;

  @HiveField(6)
  double? standardDeductionNew = 75000.0;

  // Old Tax Regime fields
  @HiveField(7)
  double? standardDeductionOld = 50000.0;

  @HiveField(8)
  double? totalDeductionOld = 0.0;

  @HiveField(9)
  double? taxableIncomeOld = 0.0;

  @HiveField(10)
  double? taxPayableOld = 0.0;

  @HiveField(11)
  double? taxesAlreadyPaidOld = 0.0;

  @HiveField(12)
  double? netTaxPayableOld = 0.0;

  @HiveField(13)
  double? differenceBetween = 0.0;

  UserTaxCalculation({
    this.grossIncome,
    this.totalDeductionNew,
    this.taxableIncomeNew,
    this.taxPayableNew,
    this.taxesAlreadyPaidNew,
    this.netTaxPayableNew,
    this.standardDeductionNew,
    this.standardDeductionOld,
    this.totalDeductionOld,
    this.taxableIncomeOld,
    this.taxPayableOld,
    this.taxesAlreadyPaidOld,
    this.netTaxPayableOld,
    this.differenceBetween,
  });

  UserTaxCalculation copyWith({
    double? grossIncome,
    double? totalDeductionNew,
    double? taxableIncomeNew,
    double? taxPayableNew,
    double? taxesAlreadyPaidNew,
    double? netTaxPayableNew,
    double? standardDeductionNew,
    double? standardDeductionOld,
    double? totalDeductionOld,
    double? taxableIncomeOld,
    double? taxPayableOld,
    double? taxesAlreadyPaidOld,
    double? netTaxPayableOld,
    double? differenceBetween,
  }) {
    return UserTaxCalculation(
      grossIncome: grossIncome ?? this.grossIncome,
      totalDeductionNew: totalDeductionNew ?? this.totalDeductionNew,
      taxableIncomeNew: taxableIncomeNew ?? this.taxableIncomeNew,
      taxPayableNew: taxPayableNew ?? this.taxPayableNew,
      taxesAlreadyPaidNew: taxesAlreadyPaidNew ?? this.taxesAlreadyPaidNew,
      netTaxPayableNew: netTaxPayableNew ?? this.netTaxPayableNew,
      standardDeductionNew: standardDeductionNew ?? this.standardDeductionNew,
      standardDeductionOld: standardDeductionOld ?? this.standardDeductionOld,
      totalDeductionOld: totalDeductionOld ?? this.totalDeductionOld,
      taxableIncomeOld: taxableIncomeOld ?? this.taxableIncomeOld,
      taxPayableOld: taxPayableOld ?? this.taxPayableOld,
      taxesAlreadyPaidOld: taxesAlreadyPaidOld ?? this.taxesAlreadyPaidOld,
      netTaxPayableOld: netTaxPayableOld ?? this.netTaxPayableOld,
      differenceBetween: differenceBetween ?? this.differenceBetween,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'grossIncome': grossIncome,
      'totalDeductionNew': totalDeductionNew,
      'taxableIncomeNew': taxableIncomeNew,
      'taxPayableNew': taxPayableNew,
      'taxesAlreadyPaidNew': taxesAlreadyPaidNew,
      'netTaxPayableNew': netTaxPayableNew,
      'standardDeductionNew': standardDeductionNew,
      'standardDeductionOld': standardDeductionOld,
      'totalDeductionOld': totalDeductionOld,
      'taxableIncomeOld': taxableIncomeOld,
      'taxPayableOld': taxPayableOld,
      'taxesAlreadyPaidOld': taxesAlreadyPaidOld,
      'netTaxPayableOld': netTaxPayableOld,
      'differenceBetween': differenceBetween
    };
  }

  factory UserTaxCalculation.fromMap(Map<String, dynamic> map) {
    return UserTaxCalculation(
        grossIncome: map['grossIncome'] as double,
        totalDeductionNew: map['totalDeductionNew'] as double,
        taxableIncomeNew: map['taxableIncomeNew'] as double,
        taxPayableNew: map['taxPayableNew'] as double,
        taxesAlreadyPaidNew: map['taxesAlreadyPaidNew'] as double,
        netTaxPayableNew: map['netTaxPayableNew'] as double,
        standardDeductionNew: map['standardDeductionNew'] as double,
        standardDeductionOld: map['standardDeductionOld'] as double,
        totalDeductionOld: map['totalDeductionOld'] as double,
        taxableIncomeOld: map['taxableIncomeOld'] as double,
        taxPayableOld: map['taxPayableOld'] as double,
        taxesAlreadyPaidOld: map['taxesAlreadyPaidOld'] as double,
        netTaxPayableOld: map['netTaxPayableOld'] as double,
        differenceBetween: map['differenceBetween'] as double);
  }

  String toJson() => json.encode(toMap());

  factory UserTaxCalculation.fromJson(String source) => UserTaxCalculation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserTaxCalculation(grossIncome: $grossIncome, totalDeductionNew: $totalDeductionNew, taxableIncomeNew: $taxableIncomeNew, taxPayableNew: $taxPayableNew, taxesAlreadyPaidNew: $taxesAlreadyPaidNew, netTaxPayableNew: $netTaxPayableNew, standardDeductionNew: $standardDeductionNew, standardDeductionOld: $standardDeductionOld, totalDeductionOld: $totalDeductionOld, taxableIncomeOld: $taxableIncomeOld, taxPayableOld: $taxPayableOld, taxesAlreadyPaidOld: $taxesAlreadyPaidOld, netTaxPayableOld: $netTaxPayableOld , differenceBetween: $differenceBetween)';
  }

  @override
  bool operator ==(covariant UserTaxCalculation other) {
    if (identical(this, other)) return true;

    return other.grossIncome == grossIncome &&
        other.totalDeductionNew == totalDeductionNew &&
        other.taxableIncomeNew == taxableIncomeNew &&
        other.taxPayableNew == taxPayableNew &&
        other.taxesAlreadyPaidNew == taxesAlreadyPaidNew &&
        other.netTaxPayableNew == netTaxPayableNew &&
        other.standardDeductionNew == standardDeductionNew &&
        other.standardDeductionOld == standardDeductionOld &&
        other.totalDeductionOld == totalDeductionOld &&
        other.taxableIncomeOld == taxableIncomeOld &&
        other.taxPayableOld == taxPayableOld &&
        other.taxesAlreadyPaidOld == taxesAlreadyPaidOld &&
        other.netTaxPayableOld == netTaxPayableOld &&
        other.differenceBetween == differenceBetween;
  }

  @override
  int get hashCode {
    return grossIncome.hashCode ^
        totalDeductionNew.hashCode ^
        taxableIncomeNew.hashCode ^
        taxPayableNew.hashCode ^
        taxesAlreadyPaidNew.hashCode ^
        netTaxPayableNew.hashCode ^
        standardDeductionNew.hashCode ^
        standardDeductionOld.hashCode ^
        totalDeductionOld.hashCode ^
        taxableIncomeOld.hashCode ^
        taxPayableOld.hashCode ^
        taxesAlreadyPaidOld.hashCode ^
        netTaxPayableOld.hashCode ^
        differenceBetween.hashCode;
  }
}
