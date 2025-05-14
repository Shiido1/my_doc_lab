class RequestOtpEntityModel {
  String? email;

  RequestOtpEntityModel({this.email});

  factory RequestOtpEntityModel.fromJson(Map<String, dynamic> json) {
    return RequestOtpEntityModel(email: json['email']?.toString());
  }

  Map<String, dynamic> toJson() => {if (email != null) 'email': email};
}
