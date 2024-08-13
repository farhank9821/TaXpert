class UserModel {
  String assessmentYear;
  String name;
  String formNumber;
  String status;
  double currentYearBusinessLoss;
  double totalIncome;
  double bookProfitUnderMAT;
  double adjustedTotalIncomeUnderAMT;
  double netTaxPayable;
  double interestAndFeePayable;
  double totalTaxInterestAndFeePayable;
  double taxesPaid;
  double taxPayableOrRefundable;
  double accretedIncomeAsPerSection115TD;
  double additionalTaxPayableU_S115TD;
  double interestPayableU_S115TE;
  double additionalTaxAndInterestPayable;
  double taxAndInterestPaid;
  double finalTaxPayableOrRefundable;

  UserModel({
    required this.assessmentYear,
    required this.name,
    required this.formNumber,
    required this.status,
    required this.currentYearBusinessLoss,
    required this.totalIncome,
    required this.bookProfitUnderMAT,
    required this.adjustedTotalIncomeUnderAMT,
    required this.netTaxPayable,
    required this.interestAndFeePayable,
    required this.totalTaxInterestAndFeePayable,
    required this.taxesPaid,
    required this.taxPayableOrRefundable,
    required this.accretedIncomeAsPerSection115TD,
    required this.additionalTaxPayableU_S115TD,
    required this.interestPayableU_S115TE,
    required this.additionalTaxAndInterestPayable,
    required this.taxAndInterestPaid,
    required this.finalTaxPayableOrRefundable,
  });
}
