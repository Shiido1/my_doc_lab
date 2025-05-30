import 'package:injectable/injectable.dart';
import 'package:my_doc_lab/core/api_folder/pharm_api.dart';
import 'package:my_doc_lab/core/connect_end/model/get_pharmacy_detail_response_model/get_pharmacy_detail_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/update_pharm_entity_model.dart';
import '../../core_folder/app/app.locator.dart';
import '../model/add_med_entity_model/add_med_entity_model.dart';
import '../model/get_pharm_med_response_model/get_pharm_med_response_model.dart';
import '../model/get_pharmacy_categories/get_pharmacy_categories.dart';
import '../model/post_user_cloud_entity_model.dart';
import '../model/post_user_verification_cloud_response/post_user_verification_cloud_response.dart';

@lazySingleton
class PharmContractImpl {
  final _api = locator<PharmAuthApi>();

  Future<GetPharmacyDetailResponseModel> getPharmacyDetail() async =>
      await _api.getPharmacistDetail();
  Future<PostUserVerificationCloudResponse> postCloudinary(
    PostUserCloudEntityModel postCloudinary,
  ) async => await _api.postTocloudinary(postCloudinary);
  Future<dynamic> updatePharmDetail(
    String id, {
    UpdatePharmEntityModel? updatePharm,
  }) async => await _api.updatePharmacy(id, updatePharm: updatePharm);

  Future<GetPharmacyCategoriesList> getPharmacyCategories() async =>
      await _api.getPharmacyCategories();
  Future<GetPharmMedResponseModelList> getAllMedsList() async =>
      await _api.getAllMedsList();
  Future<dynamic> addPharmCategories(String name) async =>
      await _api.addPharmCategories(name);
  Future<dynamic> addPharmMedicine(AddMedEntityModel add) async =>
      await _api.addPharmMedicine(add);
  Future<dynamic> updatePharmMedicine({
    String? id,
    AddMedEntityModel? add,
  }) async => await _api.updatePharmMedicine(id: id, add: add);
  Future<dynamic> updatePharmCategories({String? name, String? id}) async =>
      await _api.updatePharmCategories(id: id, name: name);
  Future<dynamic> updatePharmMedsQty({String? id, String? quantity}) async =>
      await _api.updatePharmMedsQty(id: id, quantity: quantity);
  Future<dynamic> deletePharmCategories(String id) async =>
      await _api.deletePharmCategories(id);
  Future<dynamic> deletePharmMed(String id) async =>
      await _api.deletePharmMed(id);
}
