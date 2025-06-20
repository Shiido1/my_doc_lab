import 'package:injectable/injectable.dart';
import 'package:my_doc_lab/core/connect_end/contract/pharm_contract_impl.dart';
import 'package:my_doc_lab/core/connect_end/model/get_pharmacy_detail_response_model/get_pharmacy_detail_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/update_pharm_entity_model.dart';

import '../../core_folder/app/app.locator.dart';
import '../model/add_med_entity_model/add_med_entity_model.dart';
import '../model/bank_save_entity_model.dart';
import '../model/bank_save_response_model/bank_save_response_model.dart';
import '../model/call_token_generate_entity_model.dart';
import '../model/call_token_generate_response_model/call_token_generate_response_model.dart';
import '../model/get_med_by_id_response_model/get_med_by_id_response_model.dart';
import '../model/get_message_index_response_model/get_message_index_response_model.dart';
import '../model/get_pharm_med_response_model/get_pharm_med_response_model.dart';
import '../model/get_pharm_order_model/get_pharm_order_model.dart';
import '../model/get_pharm_wallet_response_model/get_pharm_wallet_response_model.dart';
import '../model/get_pharmacy_categories/get_pharmacy_categories.dart';
import '../model/order_by_id_response_model/order_by_id_response_model.dart';
import '../model/pharm_stats_response_model/pharm_stats_response_model.dart';
import '../model/post_user_cloud_entity_model.dart';
import '../model/post_user_verification_cloud_response/post_user_verification_cloud_response.dart';
import '../model/received_message_response_model/received_message_response_model.dart';
import '../model/send_message_entity_model.dart';
import '../model/send_message_response_model/send_message_response_model.dart';

@lazySingleton
class PharmRepoImpl {
  final _contract = locator<PharmContractImpl>();

  Future<GetPharmacyDetailResponseModel> getPharmacyDetails() async {
    final response = await _contract.getPharmacyDetail();
    return response;
  }

  Future<PostUserVerificationCloudResponse> postCloudinary(
    PostUserCloudEntityModel postCloudinary,
  ) async {
    final response = await _contract.postCloudinary(postCloudinary);
    return response;
  }

  Future<dynamic> updatePharmacy(
    String id, {
    UpdatePharmEntityModel? updatePharm,
  }) async {
    final response = await _contract.updatePharmDetail(
      id,
      updatePharm: updatePharm,
    );
    return response;
  }

  Future<GetPharmacyCategoriesList> getPharmacyCategories() async {
    final response = await _contract.getPharmacyCategories();
    return response;
  }

  Future<GetPharmMedResponseModelList> getAllMedsList() async {
    final response = await _contract.getAllMedsList();
    return response;
  }

  Future<GetMedByIdResponseModel> getMedicineById(String id) async {
    final response = await _contract.getMedicineById(id);
    return response;
  }

  Future<GetPharmacyCategories> getCategoryById(String id) async {
    final response = await _contract.getCategoryById(id);
    return response;
  }

  Future<dynamic> addPharmCategories(String name) async {
    final response = await _contract.addPharmCategories(name);
    return response;
  }

  Future<dynamic> addPharmMedicine(AddMedEntityModel add) async {
    final response = await _contract.addPharmMedicine(add);
    return response;
  }

  Future<dynamic> updatePharmMedicine({
    String? id,
    AddMedEntityModel? add,
  }) async {
    final response = await _contract.updatePharmMedicine(id: id, add: add);
    return response;
  }

  Future<dynamic> updatePharmCategories({String? name, String? id}) async {
    final response = await _contract.updatePharmCategories(name: name, id: id);
    return response;
  }

  Future<dynamic> updatePharmMedsQty({String? id, String? quantity}) async {
    final response = await _contract.updatePharmMedsQty(
      id: id,
      quantity: quantity,
    );
    return response;
  }

  Future<dynamic> deletePharmCategories(String id) async {
    final response = await _contract.deletePharmCategories(id);
    return response;
  }

  Future<dynamic> deletePharmMed(String id) async {
    final response = await _contract.deletePharmMed(id);
    return response;
  }

  Future<GetPharmOrderModel> pharmOrder() async {
    final response = await _contract.pharmOrder();
    return response;
  }

  Future<OrderByIdResponseModel> pharmOrderId(String id) async {
    final response = await _contract.pharmOrderId(id);
    return response;
  }

  Future<GetPharmWalletResponseModel> pharmWallet() async {
    final response = await _contract.pharmWallet();
    return response;
  }

  Future<dynamic> pharmOrderUpdate({
    String? id,
    String? reason,
    String? status,
  }) async {
    final response = await _contract.pharmOrderUpdate(
      id: id,
      reason: reason,
      status: status,
    );
    return response;
  }

  Future<dynamic> pharmOrderUpdateItem({
    String? id,
    String? reason,
    String? status,
  }) async {
    final response = await _contract.pharmOrderUpdateItem(
      id: id,
      reason: reason,
      status: status,
    );
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

  Future<PharmStatsResponseModel> pharmStatistics() async {
    final response = await _contract.pharmStatistics();
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
