import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_doc_lab/core/connect_end/model/add_diagnosis_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/add_report_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/get_all_diagnosis_list_response_model/get_all_diagnosis_list_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/get_single_dia_response_model/get_single_dia_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/lab_tech_category_list_response_model/lab_tech_category_list_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/update_status_reason_entity_model.dart';
import '../connect_end/model/bank_save_entity_model.dart';
import '../connect_end/model/bank_save_response_model/bank_save_response_model.dart';
import '../connect_end/model/call_token_generate_entity_model.dart';
import '../connect_end/model/call_token_generate_response_model/call_token_generate_response_model.dart';
import '../connect_end/model/get_category_by_id_response_model/get_category_by_id_response_model.dart';
import '../connect_end/model/get_lab_tech_detail_response_model/get_lab_tech_detail_response_model.dart';
import '../connect_end/model/get_lab_tech_dia_book_list_model/get_lab_tech_dia_book_list_model.dart';
import '../connect_end/model/get_message_index_response_model/get_message_index_response_model.dart';
import '../connect_end/model/lab_tech_detail_response_model/lab_tech_detail_response_model.dart';
import '../connect_end/model/lab_tech_wallet_response_model/lab_tech_wallet_response_model.dart';
import '../connect_end/model/post_user_cloud_entity_model.dart';
import '../connect_end/model/post_user_verification_cloud_response/post_user_verification_cloud_response.dart';
import '../connect_end/model/received_message_response_model/received_message_response_model.dart';
import '../connect_end/model/send_message_entity_model.dart';
import '../connect_end/model/send_message_response_model/send_message_response_model.dart';
import '../connect_end/model/update_lab_tech_entity_model.dart';
import '../core_folder/app/app.locator.dart';
import '../core_folder/app/app.logger.dart';
import '../core_folder/network/cloudinary_network_service.dart';
import '../core_folder/network/network_service.dart';
import '../core_folder/network/url_path.dart';

@lazySingleton
class LabTechAuthApi {
  final _service = locator<NetworkService>();
  final _serviceCloud = locator<CloudinaryNetworkService>();
  final logger = getLogger('LabTechViewModel');

  Future<GetLabTechDetailResponseModel> getLabTechDetail() async {
    try {
      final response = await _service.call(
        UrlConfig.labt_tech,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetLabTechDetailResponseModel.fromJson(response.data);
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

  Future<dynamic> updateLabTechDetail({
    String? id,
    UpdateLabTechEntityModel? update,
  }) async {
    try {
      final response = await _service.call(
        '${UrlConfig.labt_tech}/$id',
        RequestMethod.put,
        data: update?.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetLabTechDiaBookListModel> diagnosisBookingList() async {
    try {
      final response = await _service.call(
        UrlConfig.labt_tech_diagnosis_book_list,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetLabTechDiaBookListModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<LabTechWalletResponseModel> labTechWallet() async {
    try {
      final response = await _service.call(
        UrlConfig.labt_tech_wallet,
        RequestMethod.get,
      );
      logger.d(response.data);
      return LabTechWalletResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> updateOrderStatus({
    UpdateStatusReasonEntityModel? update,
    String? id,
  }) async {
    try {
      final response = await _service.call(
        UrlConfig.labt_tech_update_order,
        RequestMethod.post,
        data: update?.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> addReport(AddReportEntityModel report) async {
    try {
      final response = await _service.call(
        UrlConfig.labt_tech_add_report,
        RequestMethod.post,
        data: report.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> updateReport({
    AddReportEntityModel? report,
    String? id,
  }) async {
    try {
      final response = await _service.call(
        '${UrlConfig.labt_tech_update_report}$id',
        RequestMethod.post,
        data: report?.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<LabTechDetailResponseModel> labTechDetailReport(String id) async {
    try {
      final response = await _service.call(
        '${UrlConfig.labt_tech_update_report}$id',
        RequestMethod.get,
      );
      logger.d(response.data);
      return LabTechDetailResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> deleteLabTechDetailReport(String id) async {
    try {
      final response = await _service.call(
        '${UrlConfig.labt_tech_update_report}$id',
        RequestMethod.delete,
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> deleteLabTechDiagnosis(String id) async {
    try {
      final response = await _service.call(
        '${UrlConfig.labt_tech_diagnosis_by_id}$id/delete',
        RequestMethod.delete,
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> updateLabTechDiagnosis({
    String? id,
    AddDiagnosisEntityModel? update,
  }) async {
    try {
      final response = await _service.call(
        '${UrlConfig.labt_tech_diagnosis_by_id}$id',
        RequestMethod.put,
        data: update?.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> addLabTechDiagnosis(AddDiagnosisEntityModel? add) async {
    try {
      final response = await _service.call(
        UrlConfig.labt_tech_diagnosis_add,
        RequestMethod.post,
        data: add?.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetSingleDiaResponseModel> getDiagnosisById(String? id) async {
    try {
      final response = await _service.call(
        '${UrlConfig.labt_tech_diagnosis_by_id}$id',
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetSingleDiaResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetAllDiagnosisListResponseModelList> getAllDiagnosis() async {
    try {
      final response = await _service.call(
        UrlConfig.labt_tech_diagnosis_list,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetAllDiagnosisListResponseModelList.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<LabTechCategoryListResponseModelList> getAllLabTechCategory() async {
    try {
      final response = await _service.call(
        UrlConfig.labt_tech_category,
        RequestMethod.get,
      );
      logger.d(response.data);
      return LabTechCategoryListResponseModelList.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetCategoryByIdResponseModel> getLabTechCategoryById(String id) async {
    try {
      final response = await _service.call(
        UrlConfig.labt_tech_category_by_id,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetCategoryByIdResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> addLabTechCategory(String nameCategory) async {
    try {
      final response = await _service.call(
        UrlConfig.labt_tech_category_add,
        RequestMethod.post,
        data: {'name': nameCategory},
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> updateLabTechCategory({
    String? nameCategory,
    String? id,
  }) async {
    try {
      final response = await _service.call(
        '${UrlConfig.labt_tech_category_by_id}$id',
        RequestMethod.put,
        data: {'name': nameCategory},
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> deleteLabTechCategory(String? id) async {
    try {
      final response = await _service.call(
        '${UrlConfig.labt_tech_category_by_id}$id/delete',
        RequestMethod.delete,
      );
      logger.d(response.data);
      return response.data;
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
