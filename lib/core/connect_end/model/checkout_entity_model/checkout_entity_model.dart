import 'item.dart';

class CheckoutEntityModel {
  List<Item>? items;
  String? paymentMethod;

  CheckoutEntityModel({this.items, this.paymentMethod});

  factory CheckoutEntityModel.fromJson(Map<String, dynamic> json) {
    return CheckoutEntityModel(
      items:
          (json['items'] as List<dynamic>?)
              ?.map((e) => Item.fromJson(Map<String, dynamic>.from(e)))
              .toList(),
      paymentMethod: json['payment_method']?.toString(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (items != null) 'items': items?.map((e) => e.toJson()).toList(),
    if (paymentMethod != null) 'payment_method': paymentMethod,
  };
}
