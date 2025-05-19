import 'package:hive/hive.dart';

part 'checkoutentitymodel.g.dart';

@HiveType(typeId: 1)
class CheckoutEntityModel {
  @HiveField(0)
  String serviceType;
  @HiveField(1)
  num serviceId;
  @HiveField(2)
  num doctorId;
  @HiveField(3)
  num slotId;
  @HiveField(4)
  String complaint;
  @HiveField(5)
  String doctor;
  @HiveField(6)
  String time;
  @HiveField(7)
  String date;
  @HiveField(8)
  String amount;

  CheckoutEntityModel({
    required this.serviceType,
    required this.serviceId,
    required this.doctorId,
    required this.slotId,
    required this.complaint,
    required this.amount,
    required this.date,
    required this.time,
    required this.doctor,
  });
}
