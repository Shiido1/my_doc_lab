import 'package:injectable/injectable.dart';

import '../../core_folder/app/app.locator.dart';
import '../contract/med_contract_impl.dart';
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
class LabTechRepoImpl {
  // final _session = locator<SharedPreferencesService>();
  final _contract = locator<LabTechContractsImpl>();

  Future<PostUserVerificationCloudResponse> postCloudinary(
    PostUserCloudEntityModel postCloudinary,
  ) async {
    final response = await _contract.postCloudinary(postCloudinary);
    return response;
  }

  Future<GetLabTechDetailResponseModel> getLabTechDetail() async {
    final response = await _contract.getLabTechDetail();
    return response;
  }

  Future<dynamic> updateLabTechDetail({
    String? id,
    UpdateLabTechEntityModel? update,
  }) async {
    final response = await _contract.updateLabTechDetail(
      id: id,
      update: update,
    );
    return response;
  }

  Future<GetLabTechDiaBookListModel> diagnosisBookingList() async {
    final response = await _contract.diagnosisBookingList();
    return response;
  }

  Future<LabTechWalletResponseModel> labTechWallet() async {
    final response = await _contract.labTechWallet();
    return response;
  }

  Future<dynamic> updateOrderStatus({
    UpdateStatusReasonEntityModel? update,
    String? id,
  }) async {
    final response = await _contract.updateOrderStatus(id: id, update: update);
    return response;
  }

  Future<dynamic> addReport(AddReportEntityModel report) async {
    final response = await _contract.addReport(report);
    return response;
  }

  Future<dynamic> updateReport({
    AddReportEntityModel? report,
    String? id,
  }) async {
    final response = await _contract.updateReport(report: report, id: id);
    return response;
  }

  Future<LabTechDetailResponseModel> labTechDetailReport(String id) async {
    final response = await _contract.labTechDetailReport(id);
    return response;
  }

  Future<dynamic> deleteLabTechDetailReport(String id) async {
    final response = await _contract.deleteLabTechDetailReport(id);
    return response;
  }

  Future<dynamic> deleteLabTechDiagnosis(String id) async {
    final response = await _contract.deleteLabTechDiagnosis(id);
    return response;
  }

  Future<dynamic> addLabTechDiagnosis(AddDiagnosisEntityModel? add) async {
    final response = await _contract.addLabTechDiagnosis(add);
    return response;
  }

  Future<dynamic> updateLabTechDiagnosis({
    String? id,
    AddDiagnosisEntityModel? update,
  }) async {
    final response = await _contract.updateLabTechDiagnosis(
      id: id,
      update: update,
    );
    return response;
  }

  Future<GetSingleDiaResponseModel> getDiagnosisById(String? id) async {
    final response = await _contract.getDiagnosisById(id);
    return response;
  }

  Future<GetAllDiagnosisListResponseModelList> getAllDiagnosis() async {
    final response = await _contract.getAllDiagnosis();
    return response;
  }

  Future<LabTechCategoryListResponseModelList> getAllLabTechCategory() async {
    final response = await _contract.getAllLabTechCategory();
    return response;
  }

  Future<GetCategoryByIdResponseModel> getLabTechCategoryById(String id) async {
    final response = await _contract.getLabTechCategoryById(id);
    return response;
  }

  Future<dynamic> addLabTechCategory(String nameCategory) async {
    final response = await _contract.addLabTechCategory(nameCategory);
    return response;
  }

  Future<dynamic> updateLabTechCategory({
    String? nameCategory,
    String? id,
  }) async {
    final response = await _contract.updateLabTechCategory(
      nameCategory: nameCategory,
      id: id,
    );
    return response;
  }

  Future<dynamic> deleteLabTechCategory(String? id) async {
    final response = await _contract.deleteLabTechCategory(id);
    return response;
  }

  Future<CallTokenGenerateResponseModel> generateToken(
    CallTokenGenerateEntityModel callToken,
  ) async {
    final response = await _contract.generateToken(callToken);
    return response;
  }

  Future<GetMessageIndexResponseModelList> chatIndex() async {
    final response = await _contract.chatIndex();
    return response;
  }

  Future<ReceivedMessageResponseModelList> receiveMessage(String id) async {
    final response = await _contract.receiveMessage(id);
    return response;
  }

  Future<SendMessageResponseModel> sendMessage(
    SendMessageEntityModel send,
  ) async {
    final response = await _contract.sendMessage(send);
    return response;
  }

  Future<BankSaveResponseModel> bankSaveAccount(
    BankSaveEntityModel bankEntity,
  ) async {
    final response = await _contract.bankSaveAccount(bankEntity);
    return response;
  }

  Future<dynamic> withdrawToAccount(num amount) async {
    final response = await _contract.withFundsToAccount(amount);
    return response;
  }
}
