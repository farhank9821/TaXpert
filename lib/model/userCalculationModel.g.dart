// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userCalculationModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserTaxCalculationAdapter extends TypeAdapter<UserTaxCalculation> {
  @override
  final int typeId = 2;

  @override
  UserTaxCalculation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserTaxCalculation(
      grossIncome: fields[0] as double?,
      totalDeductionNew: fields[1] as double?,
      taxableIncomeNew: fields[2] as double?,
      taxPayableNew: fields[3] as double?,
      taxesAlreadyPaidNew: fields[4] as double?,
      netTaxPayableNew: fields[5] as double?,
      standardDeductionNew: fields[6] as double?,
      standardDeductionOld: fields[7] as double?,
      totalDeductionOld: fields[8] as double?,
      taxableIncomeOld: fields[9] as double?,
      taxPayableOld: fields[10] as double?,
      taxesAlreadyPaidOld: fields[11] as double?,
      netTaxPayableOld: fields[12] as double?,
      differenceBetween: fields[13] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, UserTaxCalculation obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.grossIncome)
      ..writeByte(1)
      ..write(obj.totalDeductionNew)
      ..writeByte(2)
      ..write(obj.taxableIncomeNew)
      ..writeByte(3)
      ..write(obj.taxPayableNew)
      ..writeByte(4)
      ..write(obj.taxesAlreadyPaidNew)
      ..writeByte(5)
      ..write(obj.netTaxPayableNew)
      ..writeByte(6)
      ..write(obj.standardDeductionNew)
      ..writeByte(7)
      ..write(obj.standardDeductionOld)
      ..writeByte(8)
      ..write(obj.totalDeductionOld)
      ..writeByte(9)
      ..write(obj.taxableIncomeOld)
      ..writeByte(10)
      ..write(obj.taxPayableOld)
      ..writeByte(11)
      ..write(obj.taxesAlreadyPaidOld)
      ..writeByte(12)
      ..write(obj.netTaxPayableOld)
      ..writeByte(13)
      ..write(obj.differenceBetween);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserTaxCalculationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
