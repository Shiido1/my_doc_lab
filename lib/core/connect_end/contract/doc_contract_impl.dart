import 'package:injectable/injectable.dart';
import 'package:doc_lab_pharm/core/api_folder/doc_api.dart';
import 'package:doc_lab_pharm/core/connect_end/model/doctor_availability_entity_model/doctor_availability_entity_model.dart';
import 'package:doc_lab_pharm/core/connect_end/model/get_doc_detail_response_model/get_doc_detail_response_model.dart';
import 'package:doc_lab_pharm/core/connect_end/model/update_doctor_entity_model.dart';
import '../../core_folder/app/app.locator.dart';
import '../model/availability_history_model/availability_history_model.dart';
import '../model/bank_save_entity_model.dart';
import '../model/bank_save_response_model/bank_save_response_model.dart';
import '../model/call_entity_model.dart';
import '../model/call_token_generate_entity_model.dart';
import '../model/call_token_generate_response_model/call_token_generate_response_model.dart';
import '../model/create_add_medicine_entity_model.dart';
import '../model/create_prescription_entity_model.dart';
import '../model/get_doctor_statistic_model/get_doctor_statistic_model.dart';
import '../model/get_doctors_analysis_model/get_doctors_analysis_model.dart';
import '../model/get_doctors_wallet_response_model/get_doctors_wallet_response_model.dart';
import '../model/get_list_of_doctors_appointment_model/get_list_of_doctors_appointment_model.dart';
import '../model/get_message_index_response_model/get_message_index_response_model.dart';
import '../model/get_patient_list_for_doc_model/get_patient_list_for_doc_model.dart';
import '../model/get_prescription_list_response_model/get_prescription_list_response_model.dart';
import '../model/get_specialization_response_model/get_specialization_response_model.dart';
import '../model/get_user_response_model/get_user_response_model.dart';
import '../model/post_user_cloud_entity_model.dart';
import '../model/post_user_verification_cloud_response/post_user_verification_cloud_response.dart';
import '../model/prescription_view_response/prescription_view_response.dart';
import '../model/received_message_response_model/received_message_response_model.dart';
import '../model/recent_appointment_response_model/recent_appointment_response_model.dart';
import '../model/reschedule_booking_entity_model.dart';
import '../model/search_doctor_entity_model.dart';
import '../model/searched_medicine_response_model/searched_medicine_response_model.dart';
import '../model/send_message_entity_model.dart';
import '../model/send_message_response_model/send_message_response_model.dart';
import '../model/update_password_entity_model.dart';
import '../model/update_status_reason_entity_model.dart';
import '../model/user_search_response_model/user_search_response_model.dart';

@lazySingleton
class DocContractsImpl {
  final _api = locator<DocAuthApi>();

  Future<GetUserResponseModel> getUserDetails(String id) async =>
      await _api.getUserDetail(id);

  Future<GetDocDetailResponseModel> getDoctorDetail() async =>
      await _api.getDoctorDetail();
  Future<dynamic> updateDoctorDetail(
    String id, {
    UpdateDoctorEntityModel? updateDoctor,
  }) async => await _api.updateDoctor(id, updateDoctor: updateDoctor);
  Future<dynamic> doctorsAvailability(
    String id, {
    DoctorAvailabilityEntityModel? availability,
  }) async =>
      await _api.doctorsAvailabilty(id, doctorAvailability: availability);
  Future<PostUserVerificationCloudResponse> postCloudinary(
    PostUserCloudEntityModel postCloudinary,
  ) async => await _api.postTocloudinary(postCloudinary);
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
  Future<dynamic> acceptCall(int callId) async => await _api.acceptCall(callId);
  Future<dynamic> rejectCall(CallEntityModel call) async =>
      await _api.rejectCall(call);
  Future<dynamic> endCall(CallEntityModel call) async =>
      await _api.endCall(call);
  Future<GetListOfDoctorsAppointmentModelList> doctorsAppointment() async =>
      await _api.doctorsAppointment();
  Future<GetDoctorsWalletResponseModel> doctorsWallet() async =>
      await _api.doctorWallet();

  Future<dynamic> doctorsAppointmentReschedule({
    String? id,
    RescheduleBookingEntityModel? reschedule,
  }) async =>
      await _api.doctorsAppointmentReschedule(id: id, reschedule: reschedule);

  Future<dynamic> doctorsAppointmentUpdate({
    String? id,
    UpdateStatusReasonEntityModel? update,
  }) async => await _api.doctorsAppointmentUpdate(id: id, update: update);

  Future<DocPatientListResponseModelList> getPatientsList() async =>
      await _api.getPatientsList();

  Future<dynamic> updatePassword(UpdatePasswordEntityModel update) async =>
      await _api.updatePassword(update);

  Future<GetDoctorStatisticModel> getDoctorsStatistic() async =>
      await _api.getDoctorsStatistic();

  Future<GetPrescriptionListResponseModelList> getPrescriptionList() async =>
      await _api.getPrescriptionList();

  Future<PrescriptionViewResponse> getPrescriptionView(String id) async =>
      await _api.getPrescriptionView(id);

  Future<dynamic> createPrescrition(
    CreatePrescriptionEntityModel create,
  ) async => await _api.createPrescrition(create);

  Future<dynamic> createMedicinePrescrition({
    String? id,
    CreateAddMedicineEntityModel? create,
  }) async => await _api.createMedicinePrescrition(create: create, id: id);
  Future<RecentAppointmentResponseModelList> recentAppointment() async =>
      await _api.recentAppointment();
  Future<UserSearchResponseModelList> userSearch(String query) async =>
      await _api.userSearch(query);
  Future<SearchedMedicineResponseModelList> getSearchedMedicine(
    SearchDoctorEntityModel searchedMedicine,
  ) async => await _api.getSearchedMedicine(searchedMedicine);

  Future<BankSaveResponseModel> bankSaveAccount(
    BankSaveEntityModel bankEntity,
  ) async => await _api.bankSaveAccount(bankEntity);

  Future<dynamic> withFundsToAccount(num amount) async =>
      await _api.withFundToAccount(amount);

  Future<GetDoctorsAnalysisModel> doctorsAnalytics() async =>
      await _api.doctorsAnalytics();
  Future<AvailabilityHistoryModel> doctorsAvailabilityHistory(
    String id,
  ) async => await _api.doctorsAvailabilityHistory(id);

  Future<dynamic> readMessage(int id) async => await _api.readMessage(id);
  Future<GetSpecializationResponseModel> specializationList() async =>
      await _api.specializationList();
  Future<dynamic> logout() async => await _api.logout();
}
