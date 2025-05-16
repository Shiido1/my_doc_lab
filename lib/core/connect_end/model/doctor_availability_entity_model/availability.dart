class Availability {
  String? dayOfWeek;
  String? startTime;
  String? endTime;

  Availability({this.dayOfWeek, this.startTime, this.endTime});

  factory Availability.fromJson(Map<String, dynamic> json) => Availability(
    dayOfWeek: json['day_of_week']?.toString(),
    startTime: json['start_time']?.toString(),
    endTime: json['end_time']?.toString(),
  );

  Map<String, dynamic> toJson() => {
    if (dayOfWeek != null) 'day_of_week': dayOfWeek,
    if (startTime != null) 'start_time': startTime,
    if (endTime != null) 'end_time': endTime,
  };
}
