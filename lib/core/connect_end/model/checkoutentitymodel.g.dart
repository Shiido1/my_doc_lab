// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkoutentitymodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CheckoutEntityModelAdapter extends TypeAdapter<CheckoutEntityModel> {
  @override
  final int typeId = 1;

  @override
  CheckoutEntityModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CheckoutEntityModel(
      serviceType: fields[0] as String,
      serviceId: fields[1] as num,
      doctorId: fields[2] as num,
      slotId: fields[3] as num,
      complaint: fields[4] as String,
      amount: fields[8] as String,
      date: fields[7] as String,
      time: fields[6] as String,
      doctor: fields[5] as String,
      productId: fields[9] as num,
      qty: fields[10] as num,
    );
  }

  @override
  void write(BinaryWriter writer, CheckoutEntityModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.serviceType)
      ..writeByte(1)
      ..write(obj.serviceId)
      ..writeByte(2)
      ..write(obj.doctorId)
      ..writeByte(3)
      ..write(obj.slotId)
      ..writeByte(4)
      ..write(obj.complaint)
      ..writeByte(5)
      ..write(obj.doctor)
      ..writeByte(6)
      ..write(obj.time)
      ..writeByte(7)
      ..write(obj.date)
      ..writeByte(8)
      ..write(obj.amount)
      ..writeByte(9)
      ..write(obj.productId)
      ..writeByte(10)
      ..write(obj.qty);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CheckoutEntityModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
