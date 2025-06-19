import 'package:injectable/injectable.dart';

import '../../api_folder/med_lab_api.dart';
import '../../core_folder/app/app.locator.dart';
import '../model/add_diagnosis_entity_model.dart';
import '../model/add_report_entity_model.dart';
import '../model/bank_save_entity_model.dart';
import '../model/bank_save_response_model/bank_save_response_model.dart';
import '../model/call_token_generate_entity_model.dart';
import '../model/call_token_generate_response_model/call_token_generate_response_model.dart';
import '../model/get_all_diagnosis_list_response_model/get_all_diagnosis_list_response_model.dart';
import '../model/get_category_by_id_response_model/get_category_by_id_response_model.dart';
import '../model/get_lab_tech_detail_response_model/get_lab_tech_detail_response_model.dart';
import '../model/get_lab_tech_dia_book_list_model/get_lab_tech_dia_book_list_model.dart';
import '../model/get_message_index_response_model/get_message_index_response_model.dart';
import '../model/get_single_dia_response_model/get_single_dia_response_model.dart';
import '../model/lab_tech_category_list_response_model/lab_tech_category_list_response_model.dart';
import '../model/lab_tech_detail_response_model/lab_tech_detail_response_model.dart';
import '../model/lab_tech_wallet_response_model/lab_tech_wallet_response_model.dart';
import '../model/post_user_cloud_entity_model.dart';
import '../model/post_user_verification_cloud_response/post_user_verification_cloud_response.dart';
import '../model/received_message_response_model/received_message_response_model.dart';
import '../model/send_message_entity_model.dart';
import '../model/send_message_response_model/send_message_response_model.dart';
import '../model/update_lab_tech_entity_model.dart';
import '../model/update_status_reason_entity_model.dart';

@lazySingleton
class LabTechContractsImpl {
  final _api = locator<LabTechAuthApi>();

  Future<GetLabTechDetailResponseModel> getLabTechDetail() async =>
      await _api.getLabTechDetail();

  Future<PostUserVerificationCloudResponse> postCloudinary(
    PostUserCloudEntityModel postCloudinary,
  ) async => await _api.postTocloudinary(postCloudinary);

  Future<dynamic> updateLabTechDetail({
    String? id,
    UpdateLabTechEntityModel? update,
  }) async => await _api.updateLabTechDetail(update: update, id: id);

  Future<GetLabTechDiaBookListModel> diagnosisBookingList() async =>
      await _api.diagnosisBookingList();

  Future<LabTechWalletResponseModel> labTechWallet() async =>
      await _api.labTechWallet();

  Future<dynamic> updateOrderStatus({
    UpdateStatusReasonEntityModel? update,
    String? id,
  }) async => await _api.updateOrderStatus(update: update, id: id);

  Future<dynamic> addReport(AddReportEntityModel report) async =>
      await _api.addReport(report);

  Future<dynamic> updateReport({
    AddReportEntityModel? report,
    String? id,
  }) async => await _api.updateReport(report: report, id: id);

  Future<LabTechDetailResponseModel> labTechDetailReport(String id) async =>
      await _api.labTechDetailReport(id);

  Future<dynamic> deleteLabTechDetailReport(String id) async =>
      await _api.deleteLabTechDetailReport(id);

  Future<dynamic> deleteLabTechDiagnosis(String id) async =>
      await _api.deleteLabTechDiagnosis(id);

  Future<dynamic> updateLabTechDiagnosis({
    String? id,
    AddDiagnosisEntityModel? update,
  }) async => await _api.updateLabTechDiagnosis(id: id, update: update);

  Future<dynamic> addLabTechDiagnosis(AddDiagnosisEntityModel? add) async =>
      await _api.addLabTechDiagnosis(add);

  Future<GetSingleDiaResponseModel> getDiagnosisById(String? id) async =>
      await _api.getDiagnosisById(id);

  Future<GetAllDiagnosisListResponseModelList> getAllDiagnosis() async =>
      await _api.getAllDiagnosis();

  Future<LabTechCategoryListResponseModelList> getAllLabTechCategory() async =>
      await _api.getAllLabTechCategory();

  Future<GetCategoryByIdResponseModel> getLabTechCategoryById(
    String id,
  ) async => await _api.getLabTechCategoryById(id);

  Future<dynamic> addLabTechCategory(String nameCategory) async =>
      await _api.addLabTechCategory(nameCategory);

  Future<dynamic> updateLabTechCategory({
    String? nameCategory,
    String? id,
  }) async =>
      await _api.updateLabTechCategory(nameCategory: nameCategory, id: id);

  Future<dynamic> deleteLabTechCategory(String? id) async =>
      await _api.deleteLabTechCategory(id);
  Future<GetMessageIndexResponseModelList> chatIndex() async =>
      await _api.chatIndex();
  Future<ReceivedMessageResponseModelList> receiveMessage(String id) async =>
      await _api.receiveConversation(id);
  Future<SendMessageResponseModel> sendMessage(
    SendMessageEntityModel send,
  ) async => await _api.sendMessage(send);
  Future<CallTokenGenerateResponseModel> generateToken(
    CallTokenGenerateEntityModel callToken,
  ) async => await _api.genCallToken(callToken);
  Future<BankSaveResponseModel> bankSaveAccount(
    BankSaveEntityModel bankEntity,
  ) async => await _api.bankSaveAccount(bankEntity);

  Future<dynamic> withFundsToAccount(num amount) async =>
      await _api.withFundToAccount(amount);
}
