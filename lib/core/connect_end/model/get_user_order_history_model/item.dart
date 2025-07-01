import 'package:json_annotation/json_annotation.dart';

part 'item.g.dart';

@JsonSerializable()
class Item {
  num? id;
  @JsonKey(name: 'order_id')
  num? orderId;
  @JsonKey(name: 'service_type')
  String? serviceType;
  @JsonKey(name: 'service_id')
  num? serviceId;
  @JsonKey(name: 'giver_id')
  num? giverId;
  num? quantity;
  String? price;
  String? status;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;
  @JsonKey(name: 'service_name')
  String? serviceName;

  Item({
    this.id,
    this.orderId,
    this.serviceType,
    this.serviceId,
    this.giverId,
    this.quantity,
    this.price,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.serviceName,
  });

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);

  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
