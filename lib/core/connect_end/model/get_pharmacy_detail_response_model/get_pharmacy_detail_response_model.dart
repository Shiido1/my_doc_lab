class GetPharmacyDetailResponseModel {
  Headers? headers;
  Original? original;
  dynamic exception;

  GetPharmacyDetailResponseModel({this.headers, this.original, this.exception});

  GetPharmacyDetailResponseModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? uuid;
  String? firstName;
  String? lastName;
  String? gender;
  String? email;
  String? phone;
  dynamic about;
  String? status;
  String? emailVerifiedAt;
  dynamic certifications;
  dynamic experience;
  dynamic profileImage;
  String? city;
  String? state;
  String? address;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Wallets? wallets;

  Original({
    this.id,
    this.uuid,
    this.firstName,
    this.lastName,
    this.gender,
    this.email,
    this.phone,
    this.about,
    this.status,
    this.emailVerifiedAt,
    this.certifications,
    this.experience,
    this.profileImage,
    this.city,
    this.state,
    this.address,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.wallets,
  });

  Original.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    email = json['email'];
    phone = json['phone'];
    about = json['about'];
    status = json['status'];
    emailVerifiedAt = json['email_verified_at'];
    certifications = json['certifications'];
    experience = json['experience'];
    profileImage = json['profile_image'];
    city = json['city'];
    state = json['state'];
    address = json['address'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    wallets =
        json['wallets'] != null ? Wallets.fromJson(json['wallets']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uuid'] = uuid;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['gender'] = gender;
    data['email'] = email;
    data['phone'] = phone;
    data['about'] = about;
    data['status'] = status;
    data['email_verified_at'] = emailVerifiedAt;
    data['certifications'] = certifications;
    data['experience'] = experience;
    data['profile_image'] = profileImage;
    data['city'] = city;
    data['state'] = state;
    data['address'] = address;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (wallets != null) {
      data['wallets'] = wallets!.toJson();
    }
    return data;
  }
}

class Wallets {
  int? id;
  String? uuid;
  int? ownerId;
  String? ownerType;
  int? currencyId;
  int? balance;
  dynamic deletedAt;
  String? createdAt;
  String? updatedAt;

  Wallets({
    this.id,
    this.uuid,
    this.ownerId,
    this.ownerType,
    this.currencyId,
    this.balance,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  Wallets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    ownerId = json['owner_id'];
    ownerType = json['owner_type'];
    currencyId = json['currency_id'];
    balance = json['balance'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['uuid'] = uuid;
    data['owner_id'] = ownerId;
    data['owner_type'] = ownerType;
    data['currency_id'] = currencyId;
    data['balance'] = balance;
    data['deleted_at'] = deletedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
