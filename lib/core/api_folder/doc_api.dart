import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:my_doc_lab/core/connect_end/model/availability_history_model/availability_history_model.dart';
import 'package:my_doc_lab/core/connect_end/model/bank_save_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/bank_save_response_model/bank_save_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/create_prescription_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/doctor_availability_entity_model/doctor_availability_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/get_doc_detail_response_model/get_doc_detail_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/get_message_index_response_model/get_message_index_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/received_message_response_model/received_message_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/reschedule_booking_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/send_message_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/update_doctor_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/update_password_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/update_status_reason_entity_model.dart';
import '../connect_end/model/call_token_generate_entity_model.dart';
import '../connect_end/model/call_token_generate_response_model/call_token_generate_response_model.dart';
import '../connect_end/model/create_add_medicine_entity_model.dart';
import '../connect_end/model/get_doctor_statistic_model/get_doctor_statistic_model.dart';
import '../connect_end/model/get_doctors_analysis_model/get_doctors_analysis_model.dart';
import '../connect_end/model/get_doctors_wallet_response_model/get_doctors_wallet_response_model.dart';
import '../connect_end/model/get_list_of_doctors_appointment_model/get_list_of_doctors_appointment_model.dart';
import '../connect_end/model/get_patient_list_for_doc_model/get_patient_list_for_doc_model.dart';
import '../connect_end/model/get_prescription_list_response_model/get_prescription_list_response_model.dart';
import '../connect_end/model/get_user_response_model/get_user_response_model.dart';
import '../connect_end/model/post_user_cloud_entity_model.dart';
import '../connect_end/model/post_user_verification_cloud_response/post_user_verification_cloud_response.dart';
import '../connect_end/model/prescription_view_response/prescription_view_response.dart';
import '../connect_end/model/recent_appointment_response_model/recent_appointment_response_model.dart';
import '../connect_end/model/search_doctor_entity_model.dart';
import '../connect_end/model/searched_medicine_response_model/searched_medicine_response_model.dart';
import '../connect_end/model/send_message_response_model/send_message_response_model.dart';
import '../connect_end/model/user_search_response_model/user_search_response_model.dart';
import '../core_folder/app/app.locator.dart';
import '../core_folder/app/app.logger.dart';
import '../core_folder/network/cloudinary_network_service.dart';
import '../core_folder/network/network_service.dart';
import '../core_folder/network/url_path.dart';

@lazySingleton
class DocAuthApi {
  final _service = locator<NetworkService>();
  final _serviceCloud = locator<CloudinaryNetworkService>();
  final logger = getLogger('DocViewModel');

  Future<GetUserResponseModel> getUserDetail(String id) async {
    try {
      final response = await _service.call(
        '${UrlConfig.user_detail}/$id',
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetUserResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetDocDetailResponseModel> getDoctorDetail() async {
    try {
      final response = await _service.call(UrlConfig.doctor, RequestMethod.get);
      logger.d(response.data);
      return GetDocDetailResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> updateDoctor(
    String id, {
    UpdateDoctorEntityModel? updateDoctor,
  }) async {
    try {
      final response = await _service.call(
        '${UrlConfig.doctor}/$id',
        RequestMethod.put,
        data: updateDoctor?.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> doctorsAvailabilty(
    String id, {
    DoctorAvailabilityEntityModel? doctorAvailability,
  }) async {
    try {
      final response = await _service.call(
        '${UrlConfig.doctors_availabilty}/$id',
        RequestMethod.post,
        data: doctorAvailability?.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetDoctorsWalletResponseModel> doctorWallet() async {
    try {
      final response = await _service.call(
        UrlConfig.doctor_wallet,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetDoctorsWalletResponseModel.fromJson(response.data);
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

  Future<dynamic> acceptCall(int callId) async {
    try {
      final response = await _service.call(
        UrlConfig.accept_call,
        RequestMethod.post,
        data: {"call_id": callId},
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> rejectCall(int callId) async {
    try {
      final response = await _service.call(
        UrlConfig.reject_call,
        RequestMethod.post,
        data: {"call_id": callId},
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> endCall(int callId) async {
    try {
      final response = await _service.call(
        UrlConfig.end_call,
        RequestMethod.post,
        data: {"call_id": callId},
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetListOfDoctorsAppointmentModelList> doctorsAppointment() async {
    try {
      final response = await _service.call(
        UrlConfig.doctors_appointment,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetListOfDoctorsAppointmentModelList.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> doctorsAppointmentReschedule({
    String? id,
    RescheduleBookingEntityModel? reschedule,
  }) async {
    try {
      final response = await _service.call(
        '${UrlConfig.doctor_app_reschedule}$id',
        RequestMethod.post,
        data: reschedule?.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> doctorsAppointmentUpdate({
    String? id,
    UpdateStatusReasonEntityModel? update,
  }) async {
    try {
      final response = await _service.call(
        '${UrlConfig.doctor_app_update}$id',
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

  Future<DocPatientListResponseModelList> getPatientsList() async {
    try {
      final response = await _service.call(
        UrlConfig.doctor_patients,
        RequestMethod.get,
      );
      logger.d(response.data);
      return DocPatientListResponseModelList.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> updatePassword(UpdatePasswordEntityModel update) async {
    try {
      final response = await _service.call(
        UrlConfig.doctor_password,
        RequestMethod.post,
        data: update.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetDoctorStatisticModel> getDoctorsStatistic() async {
    try {
      final response = await _service.call(
        UrlConfig.doctor_stats,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetDoctorStatisticModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetPrescriptionListResponseModelList> getPrescriptionList() async {
    try {
      final response = await _service.call(
        UrlConfig.doctor_prescription,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetPrescriptionListResponseModelList.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<PrescriptionViewResponse> getPrescriptionView(String id) async {
    try {
      final response = await _service.call(
        '${UrlConfig.doctor_prescription}/$id',
        RequestMethod.get,
      );
      logger.d(response.data);
      return PrescriptionViewResponse.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> createPrescrition(
    CreatePrescriptionEntityModel create,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.doctor_prescription_create,
        RequestMethod.post,
        data: create.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> createMedicinePrescrition({
    String? id,
    CreateAddMedicineEntityModel? create,
  }) async {
    try {
      final response = await _service.call(
        '${UrlConfig.doctor_prescription_medicine}/$id',
        RequestMethod.post,
        data: create?.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<RecentAppointmentResponseModelList> recentAppointment() async {
    try {
      final response = await _service.call(
        UrlConfig.doctor_recent_appointment,
        RequestMethod.get,
      );
      logger.d(response.data);
      return RecentAppointmentResponseModelList.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<UserSearchResponseModelList> userSearch(String query) async {
    try {
      final response = await _service.call(
        UrlConfig.user_search,
        RequestMethod.post,
        data: {'query': query},
      );
      logger.d(response.data);
      return UserSearchResponseModelList.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<SearchedMedicineResponseModelList> getSearchedMedicine(
    SearchDoctorEntityModel searchedMedicine,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.meds_search,
        RequestMethod.post,
        data: searchedMedicine.toJson(),
      );
      logger.d(response.data);
      return SearchedMedicineResponseModelList.fromJson(response.data);
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

  Future<GetDoctorsAnalysisModel> doctorsAnalytics() async {
    try {
      final response = await _service.call(
        UrlConfig.doctor_analytics,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetDoctorsAnalysisModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<AvailabilityHistoryModel> doctorsAvailabilityHistory(String id) async {
    try {
      final response = await _service.call(
        '${UrlConfig.doctor_availability_history}/$id',
        RequestMethod.get,
      );
      logger.d(response.data);
      return AvailabilityHistoryModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> readMessage(int id) async {
    try {
      final response = await _service.call(
        UrlConfig.read_chat,
        RequestMethod.post,
        data: {"conversation_id": id},
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> logout() async {
    try {
      final response = await _service.call(
        UrlConfig.logout,
        RequestMethod.post,
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }
}
