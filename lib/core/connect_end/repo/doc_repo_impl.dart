import 'package:injectable/injectable.dart';
import 'package:my_doc_lab/core/connect_end/contract/doc_contract_impl.dart';
import 'package:my_doc_lab/core/connect_end/model/bank_save_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/bank_save_response_model/bank_save_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/doctor_availability_entity_model/doctor_availability_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/get_doc_detail_response_model/get_doc_detail_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/send_message_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/update_doctor_entity_model.dart';
import '../../core_folder/app/app.locator.dart';
import '../model/call_token_generate_entity_model.dart';
import '../model/call_token_generate_response_model/call_token_generate_response_model.dart';
import '../model/create_add_medicine_entity_model.dart';
import '../model/create_prescription_entity_model.dart';
import '../model/get_doctor_statistic_model/get_doctor_statistic_model.dart';
import '../model/get_doctors_wallet_response_model/get_doctors_wallet_response_model.dart';
import '../model/get_list_of_doctors_appointment_model/get_list_of_doctors_appointment_model.dart';
import '../model/get_message_index_response_model/get_message_index_response_model.dart';
import '../model/get_patient_list_for_doc_model/get_patient_list_for_doc_model.dart';
import '../model/get_prescription_list_response_model/get_prescription_list_response_model.dart';
import '../model/get_user_response_model/get_user_response_model.dart';
import '../model/post_user_cloud_entity_model.dart';
import '../model/post_user_verification_cloud_response/post_user_verification_cloud_response.dart';
import '../model/prescription_view_response/prescription_view_response.dart';
import '../model/received_message_response_model/received_message_response_model.dart';
import '../model/recent_appointment_response_model/recent_appointment_response_model.dart';
import '../model/reschedule_booking_entity_model.dart';
import '../model/search_doctor_entity_model.dart';
import '../model/searched_medicine_response_model/searched_medicine_response_model.dart';
import '../model/send_message_response_model/send_message_response_model.dart';
import '../model/update_password_entity_model.dart';
import '../model/update_status_reason_entity_model.dart';
import '../model/user_search_response_model/user_search_response_model.dart';

@lazySingleton
class DocRepoImpl {
  final _contract = locator<DocContractsImpl>();

  Future<GetUserResponseModel> getUserDetail(String id) async {
    final response = await _contract.getUserDetails(id);
    return response;
  }

  Future<GetDocDetailResponseModel> getDoctorDetail() async {
    final response = await _contract.getDoctorDetail();
    return response;
  }

  Future<dynamic> updateDoctor(
    String id, {
    UpdateDoctorEntityModel? updateDoctor,
  }) async {
    final response = await _contract.updateDoctorDetail(
      id,
      updateDoctor: updateDoctor,
    );
    return response;
  }

  Future<dynamic> doctorsAvailability(
    String id, {
    DoctorAvailabilityEntityModel? availability,
  }) async {
    final response = await _contract.doctorsAvailability(
      id,
      availability: availability,
    );
    return response;
  }

  Future<PostUserVerificationCloudResponse> postCloudinary(
    PostUserCloudEntityModel postCloudinary,
  ) async {
    final response = await _contract.postCloudinary(postCloudinary);
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

  Future<GetListOfDoctorsAppointmentModelList> doctorsAppointment() async {
    final response = await _contract.doctorsAppointment();
    return response;
  }

  Future<CallTokenGenerateResponseModel> generateToken(
    CallTokenGenerateEntityModel callToken,
  ) async {
    final response = await _contract.generateToken(callToken);
    return response;
  }

  Future<GetDoctorsWalletResponseModel> doctorsWallet() async {
    final response = await _contract.doctorsWallet();
    return response;
  }

  Future<dynamic> doctorsAppointmentReschedule({
    String? id,
    RescheduleBookingEntityModel? reschedule,
  }) async {
    final response = await _contract.doctorsAppointmentReschedule(
      id: id,
      reschedule: reschedule,
    );
    return response;
  }

  Future<dynamic> doctorsAppointmentUpdate({
    String? id,
    UpdateStatusReasonEntityModel? update,
  }) async {
    final response = await _contract.doctorsAppointmentUpdate(
      id: id,
      update: update,
    );
    return response;
  }

  Future<DocPatientListResponseModelList> getPatientsList() async {
    final response = await _contract.getPatientsList();
    return response;
  }

  Future<dynamic> updatePassword(UpdatePasswordEntityModel update) async {
    final response = await _contract.updatePassword(update);
    return response;
  }

  Future<GetDoctorStatisticModel> getDoctorsStatistic() async {
    final response = await _contract.getDoctorsStatistic();
    return response;
  }

  Future<GetPrescriptionListResponseModelList> getPrescriptionList() async {
    final response = await _contract.getPrescriptionList();
    return response;
  }

  Future<PrescriptionViewResponse> getPrescriptionView(String id) async {
    final response = await _contract.getPrescriptionView(id);
    return response;
  }

  Future<dynamic> createPrescrition(
    CreatePrescriptionEntityModel create,
  ) async {
    final response = await _contract.createPrescrition(create);
    return response;
  }

  Future<dynamic> createMedicinePrescrition({
    String? id,
    CreateAddMedicineEntityModel? create,
  }) async {
    final response = await _contract.createMedicinePrescrition(
      create: create,
      id: id,
    );
    return response;
  }

  Future<RecentAppointmentResponseModelList> recentAppointment() async {
    final response = await _contract.recentAppointment();
    return response;
  }

  Future<UserSearchResponseModelList> userSearch(String query) async {
    final response = await _contract.userSearch(query);
    return response;
  }

  Future<SearchedMedicineResponseModelList> getSearchedMedicine(
    SearchDoctorEntityModel searchEntity,
  ) async {
    final response = await _contract.getSearchedMedicine(searchEntity);
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
