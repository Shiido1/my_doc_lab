class GetPharmOrderModel {
  Headers? headers;
  Original? original;
  dynamic exception;

  GetPharmOrderModel({this.headers, this.original, this.exception});

  GetPharmOrderModel.fromJson(Map<String, dynamic> json) {
    headers =
        json['headers'] != null ? Headers.fromJson(json['headers']) : null;
    original =
        json['original'] != null ? Original.fromJson(json['original']) : null;
    exception = json['exception'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (headers != null) {
      data['headers'] = headers!.toJson();
    }
    if (original != null) {
      data['original'] = original!.toJson();
    }
    data['exception'] = exception;
    return data;
  }
}

class Headers {
  Headers.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}

class Original {
  int? pharmacyId;
  dynamic pharmacyName;
  List<Orders>? orders;

  Original({this.pharmacyId, this.pharmacyName, this.orders});

  Original.fromJson(Map<String, dynamic> json) {
    pharmacyId = json['pharmacy_id'];
    pharmacyName = json['pharmacy_name'];
    if (json['orders'] != null) {
      orders = <Orders>[];
      json['orders'].forEach((v) {
        orders!.add(Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pharmacy_id'] = pharmacyId;
    data['pharmacy_name'] = pharmacyName;
    if (orders != null) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  int? id;
  int? userId;
  String? orderTrx;
  String? status;
  String? totalAmount;
  String? paymentMethod;
  String? createdAt;
  String? updatedAt;
  int? totalSum;
  User? user;
  List<Items>? items;

  Orders({
    this.id,
    this.userId,
    this.orderTrx,
    this.status,
    this.totalAmount,
    this.paymentMethod,
    this.createdAt,
    this.updatedAt,
    this.totalSum,
    this.user,
    this.items,
  });

  Orders.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    orderTrx = json['order_trx'];
    status = json['status'];
    totalAmount = json['total_amount'];
    paymentMethod = json['payment_method'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    totalSum = json['total_sum'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['order_trx'] = orderTrx;
    data['status'] = status;
    data['total_amount'] = totalAmount;
    data['payment_method'] = paymentMethod;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['total_sum'] = totalSum;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (id != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  String? id;
  String? firstName;
  String? lastName;
  String? profileImage;
  String? address;
  String? state;
  String? city;
  String? classtype;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.profileImage,
    this.address,
    this.state,
    this.city,
    this.classtype,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    profileImage = json['profile_image'];
    address = json['address'];
    state = json['state'];
    city = json['city'];
    classtype = json['classtype'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['profile_image'] = profileImage;
    data['address'] = address;
    data['state'] = state;
    data['city'] = city;
    data['classtype'] = classtype;
    return data;
  }
}

class Items {
  int? id;
  int? orderId;
  String? serviceType;
  int? serviceId;
  int? giverId;
  int? quantity;
  String? price;
  String? status;
  String? createdAt;
  String? updatedAt;
  Medicine? medicine;

  Items({
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
    this.medicine,
  });

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    serviceType = json['service_type'];
    serviceId = json['service_id'];
    giverId = json['giver_id'];
    quantity = json['quantity'];
    price = json['price'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    medicine =
        json['medicine'] != null ? Medicine.fromJson(json['medicine']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_id'] = orderId;
    data['service_type'] = serviceType;
    data['service_id'] = serviceId;
    data['giver_id'] = giverId;
    data['quantity'] = quantity;
    data['price'] = price;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (medicine != null) {
      data['medicine'] = medicine!.toJson();
    }
    return data;
  }
}

class Medicine {
  int? id;
  String? name;
  int? price;
  int? userId;

  Medicine({this.id, this.name, this.price, this.userId});

  Medicine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['user_id'] = userId;
    return data;
  }
}
