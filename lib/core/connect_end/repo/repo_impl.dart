import 'package:injectable/injectable.dart';
import 'package:my_doc_lab/core/connect_end/model/care_giver_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/care_giver_response_model/care_giver_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/checkout_entity_model/checkout_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/get_doc_detail_response_model/get_doc_detail_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/get_user_response_model/get_user_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/registration_entity_model.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../contract/contract_impl.dart';
import '../model/add_booking_entity_model.dart';
import '../model/call_token_generate_entity_model.dart';
import '../model/call_token_generate_response_model/call_token_generate_response_model.dart';
import '../model/care_giver_resiter_entity_model.dart';
import '../model/forgot_password_entity_model.dart';
import '../model/get_all_consultant_response_model/get_all_consultant_response_model.dart';
import '../model/get_all_doctors_response_model/get_all_doctors_response_model.dart';
import '../model/get_all_lab_tech_response_model/get_all_lab_tech_response_model.dart';
import '../model/get_all_medicine_response_model/get_all_medicine_response_model.dart';
import '../model/get_all_pharmacies_response_model/get_all_pharmacies_response_model.dart';
import '../model/get_doctors_wallet_response_model/get_doctors_wallet_response_model.dart';
import '../model/get_list_of_lab_diagnosis_model/get_list_of_lab_diagnosis_model.dart';
import '../model/get_medicine_detail_response_model/get_medicine_detail_response_model.dart';
import '../model/get_message_index_response_model/get_message_index_response_model.dart';
import '../model/get_pharmacy_detail_response_model/get_pharmacy_detail_response_model.dart';
import '../model/get_report_response_model/get_report_response_model.dart';
import '../model/get_users_appointment_model/get_users_appointment_model.dart';
import '../model/login_entity.dart';
import '../model/login_response_model/login_response_model.dart';
import '../model/pay_stack_payment_model/pay_stack_payment_model.dart';
import '../model/post_user_cloud_entity_model.dart';
import '../model/post_user_verification_cloud_response/post_user_verification_cloud_response.dart';
import '../model/received_message_response_model/received_message_response_model.dart';
import '../model/request_otp_entity_model.dart';
import '../model/reset_password_entity_model.dart';
import '../model/search_doctor_entity_model.dart';
import '../model/searched_doctor_response_model/searched_doctor_response_model.dart';
import '../model/searched_medicine_response_model/searched_medicine_response_model.dart';
import '../model/searched_pharmacy_response_model/searched_pharmacy_response_model.dart';
import '../model/send_message_entity_model.dart';
import '../model/send_message_response_model/send_message_response_model.dart';
import '../model/update_user_entity_model.dart';
import '../model/update_user_response_model/update_user_response_model.dart';
import '../model/verify_otp_entity_model.dart';
import '../model/view_doctors_prescription_model/view_doctors_prescription_model.dart';

@lazySingleton
class AuthRepoImpl {
  final _session = locator<SharedPreferencesService>();
  final _contract = locator<AuthContractsImpl>();

  Future<dynamic> register(RegistrationEntityModel registerEntity) async {
    final response = await _contract.register(registerEntity);
    return response;
  }

  Future<dynamic> registerCareGiver(
    CareGiverResiterEntityModel registerEntity,
  ) async {
    final response = await _contract.registerCareGiver(registerEntity);
    return response;
  }

  Future<LoginResponseModel> login(LoginEntityModel loginEntity) async {
    final response = await _contract.login(loginEntity);
    _chache(response.data);
    return response;
  }

  Future<dynamic> checkout(CheckoutEntityModel checkout) async {
    final response = await _contract.checkout(checkout);
    return response;
  }

  Future<UpdateUserResponseModel> updateUser(
    UpdateUserEntityModel update,
  ) async {
    final response = await _contract.updateUser(update);
    return response;
  }

  Future<CareGiverResponseModel> loginCareGiver(
    CareGiverEntityModel loginCareGiverEntity,
  ) async {
    final response = await _contract.loginCareGiver(loginCareGiverEntity);
    _chache(response.data);
    return response;
  }

  Future<GetUserResponseModel> getUserDetails() async {
    final response = await _contract.getUserDetail();
    return response;
  }

  Future<GetAllDoctorsResponseModelList> getAllDoctorDetail() async {
    final response = await _contract.getAllDoctorDetail();
    return response;
  }

  Future<GetAllPharmaciesResponseModelList> getAllPharmacistsDetail() async {
    final response = await _contract.getAllPharmacistsDetail();
    return response;
  }

  Future<GetAllMedicineResponseModelList> getAllMedicineDetail() async {
    final response = await _contract.getAllMedicineDetail();
    return response;
  }

  Future<GetAllConsultantResponseModelList> getAllConsultants() async {
    final response = await _contract.getAllConsultant();
    return response;
  }

  Future<SearchedDoctorResponseModelList> getSearchDoctor(
    SearchDoctorEntityModel searchEntity,
  ) async {
    final response = await _contract.getSearchedDoctors(searchEntity);
    return response;
  }

  Future<SearchedPharmacyResponseModelList> getSearchedPharmacists(
    SearchDoctorEntityModel searchEntity,
  ) async {
    final response = await _contract.getSearchedPharmacists(searchEntity);
    return response;
  }

  Future<SearchedMedicineResponseModelList> getSearchedMedicine(
    SearchDoctorEntityModel searchEntity,
  ) async {
    final response = await _contract.getSearchedMedicine(searchEntity);
    return response;
  }

  Future<dynamic> addBooking(AddBookingEntityModel addBooking) async {
    final response = await _contract.addBooking(addBooking);
    return response;
  }

  Future<GetDocDetailResponseModel> getSpecificDoctorDetail(id) async {
    final response = await _contract.getSpecificDoctorDetail(id);
    return response;
  }

  Future<GetPharmacyDetailResponseModel> getSpecificPharmacyDetail(id) async {
    final response = await _contract.getSpecificPharmacyDetail(id);
    return response;
  }

  Future<GetMedicineDetailResponseModel> getSpecificMedicineDetail(id) async {
    final response = await _contract.getSpecificMedicineDetail(id);
    return response;
  }

  Future<dynamic> forgotPassword(ForgotPasswordEntityModel forgotEntity) async {
    final response = await _contract.forgotPassword(forgotEntity);
    return response;
  }

  Future<dynamic> updatePassword(ResetPasswordEntityModel forgotEntity) async {
    final response = await _contract.updatePassword(forgotEntity);
    return response;
  }

  Future<dynamic> verifyOtp(VerifyOtpEntityModel verifyEntity) async {
    final response = await _contract.verifyOtp(verifyEntity);
    return response;
  }

  Future<dynamic> resendOtp(RequestOtpEntityModel requestEntity) async {
    final response = await _contract.resendOtp(requestEntity);
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

  Future<CallTokenGenerateResponseModel> generateToken(
    CallTokenGenerateEntityModel callToken,
  ) async {
    final response = await _contract.generateToken(callToken);
    return response;
  }

  Future<ViewDoctorsPrescriptionModelList> viewDocPrescription() async {
    final response = await _contract.viewDocPrescription();
    return response;
  }

  Future<GetDoctorsWalletResponseModel> userWallet() async {
    final response = await _contract.userWallet();
    return response;
  }

  Future<PayStackPaymentModel> paymentTopUp(String amount) async {
    final response = await _contract.paymentTopUp(amount);
    return response;
  }

  Future<GetUsersAppointmentModelList> getUserAppointment() async {
    final response = await _contract.getUsersAppointment();
    return response;
  }

  Future<GetAllLabTechResponseModelList> getAllLabTech() async {
    final response = await _contract.getAllLabTech();
    return response;
  }

  Future<GetListOfLabDiagnosisModelList> getDiagnosisList(String id) async {
    final response = await _contract.getDiagnosisList(id);
    return response;
  }

  Future<GetReportResponseModel> getReport() async {
    final response = await _contract.getReport();
    return response;
  }

  void _chache(data) {
    if (data != null) {
      _session.authToken = data.token!;
      _session.usersData = data.toJson();
    }
  }
}
