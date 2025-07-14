class AvailabilityHistoryModel {
  Headers? headers;
  List<Original>? original;
  dynamic exception;

  AvailabilityHistoryModel({this.headers, this.original, this.exception});

  AvailabilityHistoryModel.fromJson(Map<String, dynamic> json) {
    headers =
        json['headers'] != null ? new Headers.fromJson(json['headers']) : null;
    if (json['original'] != null) {
      original = <Original>[];
      json['original'].forEach((v) {
        original!.add(new Original.fromJson(v));
      });
    }
    exception = json['exception'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (headers != null) {
      data['headers'] = headers!.toJson();
    }
    if (original != null) {
      data['original'] = original!.map((v) => v.toJson()).toList();
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
  int? doctorId;
  String? dayOfWeek;
  String? date;
  String? startTime;
  String? endTime;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Original({
    this.id,
    this.doctorId,
    this.dayOfWeek,
    this.date,
    this.startTime,
    this.endTime,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  Original.fromJson(Map<String, dynamic> json) {
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
