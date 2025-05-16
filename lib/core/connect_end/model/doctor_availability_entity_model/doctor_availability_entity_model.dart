import 'availability.dart';

class DoctorAvailabilityEntityModel {
  List<Availability>? availabilities;

  DoctorAvailabilityEntityModel({this.availabilities});

  factory DoctorAvailabilityEntityModel.fromJson(Map<String, dynamic> json) {
    return DoctorAvailabilityEntityModel(
      availabilities:
          (json['availabilities'] as List<dynamic>?)
              ?.map((e) => Availability.fromJson(Map<String, dynamic>.from(e)))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
    if (availabilities != null)
      'availabilities': availabilities?.map((e) => e.toJson()).toList(),
  };
}
