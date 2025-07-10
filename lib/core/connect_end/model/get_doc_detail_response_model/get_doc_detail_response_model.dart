class GetDocDetailResponseModel {
  Headers? headers;
  Original? original;
  dynamic exception;

  GetDocDetailResponseModel({this.headers, this.original, this.exception});

  GetDocDetailResponseModel.fromJson(Map<String, dynamic> json) {
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
  // Headers({});

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
  String? about;
  String? speciality;
  String? status;
  String? emailVerifiedAt;
  String? certifications;
  String? experience;
  String? profileImage;
  String? city;
  String? state;
  String? address;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  List<Availabilities>? availabilities;
  List<AvailableSlots>? availableSlots;
  BankAccount? bankAccount;

  Original({
    this.id,
    this.uuid,
    this.firstName,
    this.lastName,
    this.gender,
    this.email,
    this.phone,
    this.about,
    this.speciality,
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
    this.availabilities,
    this.availableSlots,
    this.bankAccount,
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
    speciality = json['speciality'];
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
    if (json['availabilities'] != null) {
      availabilities = <Availabilities>[];
      json['availabilities'].forEach((v) {
        availabilities!.add(Availabilities.fromJson(v));
      });
    }
    if (json['available_slots'] != null) {
      availableSlots = <AvailableSlots>[];
      json['available_slots'].forEach((v) {
        availableSlots!.add(AvailableSlots.fromJson(v));
      });
    }
    bankAccount =
        json['bank_account'] != null
            ? BankAccount.fromJson(json['bank_account'])
            : null;
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
    data['speciality'] = speciality;
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
    if (availabilities != null) {
      data['availabilities'] = availabilities!.map((v) => v.toJson()).toList();
    }
    if (availableSlots != null) {
      data['available_slots'] = availableSlots!.map((v) => v.toJson()).toList();
    }
    if (bankAccount != null) {
      data['bank_account'] = bankAccount!.toJson();
    }
    return data;
  }
}

class Availabilities {
  int? id;
  int? doctorId;
  String? dayOfWeek;
  String? date;
  String? startTime;
  String? endTime;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Availabilities({
    this.id,
    this.doctorId,
    this.dayOfWeek,
    this.startTime,
    this.date,
    this.endTime,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  Availabilities.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    dayOfWeek = json['day_of_week'];
    date = json['date'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['doctor_id'] = doctorId;
    data['day_of_week'] = dayOfWeek;
    data['date'] = date;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class AvailableSlots {
  int? id;
  int? doctorId;
  String? availableDate;
  String? availableTime;
  dynamic availabilityId;
  bool? isBooked;
  String? createdAt;
  String? updatedAt;

  AvailableSlots({
    this.id,
    this.doctorId,
    this.availableDate,
    this.availableTime,
    this.isBooked,
    this.availabilityId,
    this.createdAt,
    this.updatedAt,
  });

  AvailableSlots.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    availableDate = json['available_date'];
    availableTime = json['available_time'];
    availabilityId = json['availability_id'];
    isBooked = json['is_booked'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['doctor_id'] = doctorId;
    data['available_date'] = availableDate;
    data['available_time'] = availableTime;
    data['availability_id'] = availabilityId;
    data['is_booked'] = isBooked;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class BankAccount {
  int? id;
  String? ownerType;
  int? ownerId;
  String? accountNumber;
  String? bankCode;
  String? accountName;
  String? createdAt;
  String? updatedAt;

  BankAccount({
    this.id,
    this.ownerType,
    this.ownerId,
    this.accountNumber,
    this.bankCode,
    this.accountName,
    this.createdAt,
    this.updatedAt,
  });

  BankAccount.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ownerType = json['owner_type'];
    ownerId = json['owner_id'];
    accountNumber = json['account_number'];
    bankCode = json['bank_code'];
    accountName = json['account_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['owner_type'] = ownerType;
    data['owner_id'] = ownerId;
    data['account_number'] = accountNumber;
    data['bank_code'] = bankCode;
    data['account_name'] = accountName;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
