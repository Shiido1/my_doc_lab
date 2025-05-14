class SearchDoctorEntityModel {
  String? query;

  SearchDoctorEntityModel({this.query});

  factory SearchDoctorEntityModel.fromJson(Map<String, dynamic> json) {
    return SearchDoctorEntityModel(query: json['query']?.toString());
  }

  Map<String, dynamic> toJson() => {if (query != null) 'query': query};
}
