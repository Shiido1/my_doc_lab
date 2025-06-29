import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_doc_lab/core/connect_end/model/add_med_entity_model/add_med_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/get_pharm_wallet_response_model/get_pharm_wallet_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/get_pharmacy_detail_response_model/get_pharmacy_detail_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/pharm_stats_response_model/pharm_stats_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/update_pharm_entity_model.dart';
import 'package:my_doc_lab/core/core_folder/network/cloudinary_network_service.dart';
import '../connect_end/model/bank_save_entity_model.dart';
import '../connect_end/model/bank_save_response_model/bank_save_response_model.dart';
import '../connect_end/model/call_token_generate_entity_model.dart';
import '../connect_end/model/call_token_generate_response_model/call_token_generate_response_model.dart';
import '../connect_end/model/get_med_by_id_response_model/get_med_by_id_response_model.dart';
import '../connect_end/model/get_message_index_response_model/get_message_index_response_model.dart';
import '../connect_end/model/get_pharm_med_response_model/get_pharm_med_response_model.dart';
import '../connect_end/model/get_pharm_order_model/get_pharm_order_model.dart';
import '../connect_end/model/get_pharmacy_categories/get_pharmacy_categories.dart';
import '../connect_end/model/order_by_id_response_model/order_by_id_response_model.dart';
import '../connect_end/model/post_user_cloud_entity_model.dart';
import '../connect_end/model/post_user_verification_cloud_response/post_user_verification_cloud_response.dart';
import '../connect_end/model/received_message_response_model/received_message_response_model.dart';
import '../connect_end/model/send_message_entity_model.dart';
import '../connect_end/model/send_message_response_model/send_message_response_model.dart';
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

  Future<GetMedByIdResponseModel> getMedicineById(String id) async {
    try {
      final response = await _service.call(
        '${UrlConfig.update_pharm_med}/$id',
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetMedByIdResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetPharmacyCategories> getCategoryById(String id) async {
    try {
      final response = await _service.call(
        '${UrlConfig.update_pharm_category}$id',
        RequestMethod.get,
      );
      return GetPharmacyCategories.fromJson(response.data);
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

  Future<GetPharmOrderModel> pharmOrder() async {
    try {
      final response = await _service.call(
        UrlConfig.pharmacy_order,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetPharmOrderModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<OrderByIdResponseModel> pharmOrderId(String id) async {
    try {
      final response = await _service.call(
        '${UrlConfig.pharmacy_order_detail}/$id',
        RequestMethod.get,
      );
      logger.d(response.data);
      return OrderByIdResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> pharmOrderUpdate({
    String? id,
    String? reason,
    String? status,
  }) async {
    try {
      final response = await _service.call(
        '${UrlConfig.pharmacy_order}/$id',
        RequestMethod.getParams,
        data: {"reason": reason, "status": status},
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> pharmOrderUpdateItem({
    String? id,
    String? reason,
    String? status,
  }) async {
    try {
      final response = await _service.call(
        '${UrlConfig.pharmacy_order_item}/$id',
        RequestMethod.getParams,
        data: {"reason": reason, "status": status},
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetPharmWalletResponseModel> pharmWallet() async {
    try {
      final response = await _service.call(
        UrlConfig.pharmacy_wallet,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetPharmWalletResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetMessageIndexResponseModelList> chatIndex() async {
    try {
      final response = await _service.call(UrlConfig.chat, RequestMethod.get);
      logger.d(response.data);
      return GetMessageIndexResponseModelList.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<ReceivedMessageResponseModelList> receiveConversation(
    String id,
  ) async {
    try {
      final response = await _service.call(
        '${UrlConfig.chat}/$id/messages',
        RequestMethod.get,
      );
      logger.d(response.data);
      return ReceivedMessageResponseModelList.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<SendMessageResponseModel> sendMessage(
    SendMessageEntityModel send,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.send_chat,
        RequestMethod.post,
        data: send.toJson(),
      );
      logger.d(response.data);
      return SendMessageResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<CallTokenGenerateResponseModel> genCallToken(
    CallTokenGenerateEntityModel generate,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.call_generate_token,
        RequestMethod.post,
        data: generate.toJson(),
      );
      logger.d(response.data);
      return CallTokenGenerateResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<PharmStatsResponseModel> pharmStatistics() async {
    try {
      final response = await _service.call(
        UrlConfig.pharmacy_stats,
        RequestMethod.get,
      );
      logger.d(response.data);
      return PharmStatsResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<BankSaveResponseModel> bankSaveAccount(
    BankSaveEntityModel bankEntity,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.bank_save,
        RequestMethod.post,
        data: bankEntity.toJson(),
      );
      logger.d(response.data);
      return BankSaveResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> withFundToAccount(num amount) async {
    try {
      final response = await _service.call(
        UrlConfig.bank_withdraw,
        RequestMethod.post,
        data: {'amount': amount},
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }
}
