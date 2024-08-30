// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      salary: fields[0] as double?,
      incomeFromInterest: fields[1] as double?,
      rentalIncome: fields[2] as double?,
      incomeFromOtherSources: fields[3] as double?,
      lifeInsurance: fields[4] as double?,
      providentFund: fields[5] as double?,
      tuitionFees: fields[6] as double?,
      annuities: fields[7] as double?,
      pensionScheme: fields[8] as double?,
      additionalPensionScheme: fields[9] as double?,
      employerPensionContribution: fields[10] as double?,
      agnipathContribution: fields[11] as double?,
      healthInsurance: fields[12] as double?,
      preventiveCheckup: fields[13] as double?,
      medicalTreatment: fields[14] as double?,
      educationLoanInterest: fields[15] as double?,
      homeLoanInterest: fields[16] as double?,
      firstTimeHomeBuyerInterest: fields[17] as double?,
      electricVehicleLoanInterest: fields[18] as double?,
      donations: fields[19] as double?,
      rentPaid: fields[20] as double?,
      scientificResearchDonations: fields[21] as double?,
      politicalPartyDonations: fields[22] as double?,
      savingsAccountInterest: fields[23] as double?,
      depositsInterest: fields[24] as double?,
      disabilityDeduction: fields[25] as double?,
      tds: fields[26] as double?,
      advanceTax: fields[27] as double?,
      self_assessment_tax: fields[28] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(29)
      ..writeByte(0)
      ..write(obj.salary)
      ..writeByte(1)
      ..write(obj.incomeFromInterest)
      ..writeByte(2)
      ..write(obj.rentalIncome)
      ..writeByte(3)
      ..write(obj.incomeFromOtherSources)
      ..writeByte(4)
      ..write(obj.lifeInsurance)
      ..writeByte(5)
      ..write(obj.providentFund)
      ..writeByte(6)
      ..write(obj.tuitionFees)
      ..writeByte(7)
      ..write(obj.annuities)
      ..writeByte(8)
      ..write(obj.pensionScheme)
      ..writeByte(9)
      ..write(obj.additionalPensionScheme)
      ..writeByte(10)
      ..write(obj.employerPensionContribution)
      ..writeByte(11)
      ..write(obj.agnipathContribution)
      ..writeByte(12)
      ..write(obj.healthInsurance)
      ..writeByte(13)
      ..write(obj.preventiveCheckup)
      ..writeByte(14)
      ..write(obj.medicalTreatment)
      ..writeByte(15)
      ..write(obj.educationLoanInterest)
      ..writeByte(16)
      ..write(obj.homeLoanInterest)
      ..writeByte(17)
      ..write(obj.firstTimeHomeBuyerInterest)
      ..writeByte(18)
      ..write(obj.electricVehicleLoanInterest)
      ..writeByte(19)
      ..write(obj.donations)
      ..writeByte(20)
      ..write(obj.rentPaid)
      ..writeByte(21)
      ..write(obj.scientificResearchDonations)
      ..writeByte(22)
      ..write(obj.politicalPartyDonations)
      ..writeByte(23)
      ..write(obj.savingsAccountInterest)
      ..writeByte(24)
      ..write(obj.depositsInterest)
      ..writeByte(25)
      ..write(obj.disabilityDeduction)
      ..writeByte(26)
      ..write(obj.tds)
      ..writeByte(27)
      ..write(obj.advanceTax)
      ..writeByte(28)
      ..write(obj.self_assessment_tax);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
