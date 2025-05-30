import 'package:json_annotation/json_annotation.dart';

part 'get_pharmacy_categories.g.dart';

class GetPharmacyCategoriesList {
  final List<GetPharmacyCategories>? getPharmacyCategoriesList;

  GetPharmacyCategoriesList({this.getPharmacyCategoriesList});

  factory GetPharmacyCategoriesList.fromJson(List<dynamic> parsedJson) {
    List<GetPharmacyCategories> getPharmacyCategories =
        parsedJson.map((i) => GetPharmacyCategories.fromJson(i)).toList();

    return GetPharmacyCategoriesList(
      getPharmacyCategoriesList: getPharmacyCategories,
    );
  }
}

@JsonSerializable()
class GetPharmacyCategories {
  num? id;
  String? name;
  @JsonKey(name: 'created_at')
  DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  DateTime? updatedAt;

  GetPharmacyCategories({this.id, this.name, this.createdAt, this.updatedAt});

  factory GetPharmacyCategories.fromJson(Map<String, dynamic> json) {
    return _$GetPharmacyCategoriesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetPharmacyCategoriesToJson(this);
}
