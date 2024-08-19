// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserTaxCalculation {
  // New Tax Regime fields
  double? grossIncome = 0.0;
  double? totalDeductionNew = 75000.0;
  double? taxableIncomeNew = 0.0;
  double? taxPayableNew = 0.0;
  double? taxesAlreadyPaidNew = 0.0;
  double? netTaxPayableNew = 0.0;

  double? standardDeductionOld = 50000.0;
  double? totalDeductionOld = 0.0;
  double? taxableIncomeOld = 0.0;
  double? taxPayableOld = 0.0;
  double? taxesAlreadyPaidOld = 0.0;
  double? netTaxPayableOld = 0.0;

  UserTaxCalculation({
    this.grossIncome,
    this.totalDeductionNew,
    this.taxableIncomeNew,
    this.taxPayableNew,
    this.taxesAlreadyPaidNew,
    this.netTaxPayableNew,
    this.standardDeductionOld,
    this.totalDeductionOld,
    this.taxableIncomeOld,
    this.taxPayableOld,
    this.taxesAlreadyPaidOld,
    this.netTaxPayableOld,
  });

  UserTaxCalculation copyWith({
    double? grossIncome,
    double? totalDeductionNew,
    double? taxableIncomeNew,
    double? taxPayableNew,
    double? taxesAlreadyPaidNew,
    double? netTaxPayableNew,
    double? standardDeductionOld,
    double? totalDeductionOld,
    double? taxableIncomeOld,
    double? taxPayableOld,
    double? taxesAlreadyPaidOld,
    double? netTaxPayableOld,
  }) {
    return UserTaxCalculation(
      grossIncome: grossIncome ?? this.grossIncome,
      totalDeductionNew: totalDeductionNew ?? this.totalDeductionNew,
      taxableIncomeNew: taxableIncomeNew ?? this.taxableIncomeNew,
      taxPayableNew: taxPayableNew ?? this.taxPayableNew,
      taxesAlreadyPaidNew: taxesAlreadyPaidNew ?? this.taxesAlreadyPaidNew,
      netTaxPayableNew: netTaxPayableNew ?? this.netTaxPayableNew,
      standardDeductionOld: standardDeductionOld ?? this.standardDeductionOld,
      totalDeductionOld: totalDeductionOld ?? this.totalDeductionOld,
      taxableIncomeOld: taxableIncomeOld ?? this.taxableIncomeOld,
      taxPayableOld: taxPayableOld ?? this.taxPayableOld,
      taxesAlreadyPaidOld: taxesAlreadyPaidOld ?? this.taxesAlreadyPaidOld,
      netTaxPayableOld: netTaxPayableOld ?? this.netTaxPayableOld,
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
      'standardDeductionOld': standardDeductionOld,
      'totalDeductionOld': totalDeductionOld,
      'taxableIncomeOld': taxableIncomeOld,
      'taxPayableOld': taxPayableOld,
      'taxesAlreadyPaidOld': taxesAlreadyPaidOld,
      'netTaxPayableOld': netTaxPayableOld,
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
      standardDeductionOld: map['standardDeductionOld'] as double,
      totalDeductionOld: map['totalDeductionOld'] as double,
      taxableIncomeOld: map['taxableIncomeOld'] as double,
      taxPayableOld: map['taxPayableOld'] as double,
      taxesAlreadyPaidOld: map['taxesAlreadyPaidOld'] as double,
      netTaxPayableOld: map['netTaxPayableOld'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserTaxCalculation.fromJson(String source) => UserTaxCalculation.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserTaxCalculation(grossIncome: $grossIncome, totalDeductionNew: $totalDeductionNew, taxableIncomeNew: $taxableIncomeNew, taxPayableNew: $taxPayableNew, taxesAlreadyPaidNew: $taxesAlreadyPaidNew, netTaxPayableNew: $netTaxPayableNew, standardDeductionOld: $standardDeductionOld, totalDeductionOld: $totalDeductionOld, taxableIncomeOld: $taxableIncomeOld, taxPayableOld: $taxPayableOld, taxesAlreadyPaidOld: $taxesAlreadyPaidOld, netTaxPayableOld: $netTaxPayableOld)';
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
        other.standardDeductionOld == standardDeductionOld &&
        other.totalDeductionOld == totalDeductionOld &&
        other.taxableIncomeOld == taxableIncomeOld &&
        other.taxPayableOld == taxPayableOld &&
        other.taxesAlreadyPaidOld == taxesAlreadyPaidOld &&
        other.netTaxPayableOld == netTaxPayableOld;
  }

  @override
  int get hashCode {
    return grossIncome.hashCode ^
        totalDeductionNew.hashCode ^
        taxableIncomeNew.hashCode ^
        taxPayableNew.hashCode ^
        taxesAlreadyPaidNew.hashCode ^
        netTaxPayableNew.hashCode ^
        standardDeductionOld.hashCode ^
        totalDeductionOld.hashCode ^
        taxableIncomeOld.hashCode ^
        taxPayableOld.hashCode ^
        taxesAlreadyPaidOld.hashCode ^
        netTaxPayableOld.hashCode;
  }
}
