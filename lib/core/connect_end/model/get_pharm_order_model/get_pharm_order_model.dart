class GetPharmOrderModel {
  Headers? headers;
  Original? original;
  dynamic exception;

  GetPharmOrderModel({this.headers, this.original, this.exception});

  GetPharmOrderModel.fromJson(Map<String, dynamic> json) {
    headers =
        json['headers'] != null ? new Headers.fromJson(json['headers']) : null;
    original =
        json['original'] != null
            ? new Original.fromJson(json['original'])
            : null;
    exception = json['exception'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.headers != null) {
      data['headers'] = this.headers!.toJson();
    }
    if (this.original != null) {
      data['original'] = this.original!.toJson();
    }
    data['exception'] = this.exception;
    return data;
  }
}

class Headers {
  Headers.fromJson(Map<String, dynamic> json) {}

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
        orders!.add(new Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pharmacy_id'] = this.pharmacyId;
    data['pharmacy_name'] = this.pharmacyName;
    if (this.orders != null) {
      data['orders'] = this.orders!.map((v) => v.toJson()).toList();
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
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['order_trx'] = this.orderTrx;
    data['status'] = this.status;
    data['total_amount'] = this.totalAmount;
    data['payment_method'] = this.paymentMethod;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['total_sum'] = this.totalSum;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['profile_image'] = this.profileImage;
    data['address'] = this.address;
    data['state'] = this.state;
    data['city'] = this.city;
    data['classtype'] = this.classtype;
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
        json['medicine'] != null
            ? new Medicine.fromJson(json['medicine'])
            : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    data['service_type'] = this.serviceType;
    data['service_id'] = this.serviceId;
    data['giver_id'] = this.giverId;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.medicine != null) {
      data['medicine'] = this.medicine!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['user_id'] = this.userId;
    return data;
  }
}
