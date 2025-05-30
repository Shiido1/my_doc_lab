import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_doc_lab/core/connect_end/model/add_med_entity_model/add_med_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/get_pharmacy_detail_response_model/get_pharmacy_detail_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/update_pharm_entity_model.dart';
import 'package:my_doc_lab/core/core_folder/network/cloudinary_network_service.dart';
import '../connect_end/model/get_pharm_med_response_model/get_pharm_med_response_model.dart';
import '../connect_end/model/get_pharmacy_categories/get_pharmacy_categories.dart';
import '../connect_end/model/post_user_cloud_entity_model.dart';
import '../connect_end/model/post_user_verification_cloud_response/post_user_verification_cloud_response.dart';
import '../core_folder/app/app.locator.dart';
import '../core_folder/app/app.logger.dart';
import '../core_folder/network/network_service.dart';
import '../core_folder/network/url_path.dart';

@lazySingleton
class PharmAuthApi {
  final _service = locator<NetworkService>();
  final _serviceCloud = locator<CloudinaryNetworkService>();
  final logger = getLogger('PharmViewModel');

  Future<GetPharmacyDetailResponseModel> getPharmacistDetail() async {
    try {
      final response = await _service.call(
        UrlConfig.pharmacy,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetPharmacyDetailResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<PostUserVerificationCloudResponse> postTocloudinary(
    PostUserCloudEntityModel post,
  ) async {
    try {
      final response = await _serviceCloud.call(
        'upload',
        CloudRequestMethod.upload,
        data: FormData.fromMap(post.toJson()),
      );
      logger.d(response.data);
      return PostUserVerificationCloudResponse.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> updatePharmacy(
    String id, {
    UpdatePharmEntityModel? updatePharm,
  }) async {
    try {
      final response = await _service.call(
        '${UrlConfig.pharmacy}/$id',
        RequestMethod.put,
        data: updatePharm?.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetPharmacyCategoriesList> getPharmacyCategories() async {
    try {
      final response = await _service.call(
        UrlConfig.pharm_category,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetPharmacyCategoriesList.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetPharmMedResponseModelList> getAllMedsList() async {
    try {
      final response = await _service.call(
        UrlConfig.pharm_med_list,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetPharmMedResponseModelList.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> addPharmCategories(String name) async {
    try {
      final response = await _service.call(
        UrlConfig.add_pharm_category,
        RequestMethod.post,
        data: {'name': name},
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> addPharmMedicine(AddMedEntityModel add) async {
    try {
      final response = await _service.call(
        UrlConfig.add_pharm_med,
        RequestMethod.post,
        data: add.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> updatePharmMedicine({
    String? id,
    AddMedEntityModel? add,
  }) async {
    try {
      final response = await _service.call(
        '${UrlConfig.update_pharm_med}/$id',
        RequestMethod.put,
        data: add?.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> updatePharmCategories({String? name, String? id}) async {
    try {
      final response = await _service.call(
        '${UrlConfig.update_pharm_category}/$id',
        RequestMethod.put,
        data: {'name': name},
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> updatePharmMedsQty({String? id, String? quantity}) async {
    try {
      final response = await _service.call(
        '${UrlConfig.update_pharm_med_qty}/$id',
        RequestMethod.put,
        data: {'quantity': quantity},
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> deletePharmCategories(String id) async {
    try {
      final response = await _service.call(
        '${UrlConfig.update_pharm_category}/$id/delete',
        RequestMethod.delete,
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> deletePharmMed(String id) async {
    try {
      final response = await _service.call(
        '${UrlConfig.update_pharm_med}/$id/delete',
        RequestMethod.delete,
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }
}
