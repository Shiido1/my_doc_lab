import 'package:injectable/injectable.dart';
import 'package:my_doc_lab/core/connect_end/model/care_giver_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/care_giver_resiter_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/care_giver_response_model/care_giver_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/get_doc_detail_response_model/get_doc_detail_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/get_user_response_model/get_user_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/registration_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/search_doctor_entity_model.dart';
import '../../api_folder/auth_api.dart';
import '../../core_folder/app/app.locator.dart';
import '../model/add_booking_entity_model.dart';
import '../model/forgot_password_entity_model.dart';
import '../model/get_all_consultant_response_model/get_all_consultant_response_model.dart';
import '../model/get_all_doctors_response_model/get_all_doctors_response_model.dart';
import '../model/get_all_pharmacies_response_model/get_all_pharmacies_response_model.dart';
import '../model/get_medicine_detail_response_model/get_medicine_detail_response_model.dart';
import '../model/get_pharmacy_detail_response_model/get_pharmacy_detail_response_model.dart';
import '../model/login_entity.dart';
import '../model/login_response_model/login_response_model.dart';
import '../model/request_otp_entity_model.dart';
import '../model/reset_password_entity_model.dart';
import '../model/searched_doctor_response_model/searched_doctor_response_model.dart';
import '../model/searched_medicine_response_model/searched_medicine_response_model.dart';
import '../model/searched_pharmacy_response_model/searched_pharmacy_response_model.dart';
import '../model/verify_otp_entity_model.dart';

@lazySingleton
class AuthContractsImpl {
  final _api = locator<AuthApi>();

  Future<dynamic> register(RegistrationEntityModel registerEntity) async =>
      await _api.register(registerEntity);

  Future<dynamic> registerCareGiver(
    CareGiverResiterEntityModel registerEntity,
  ) async => await _api.registerCareGiver(registerEntity);

  Future<LoginResponseModel> login(LoginEntityModel loginEntity) async =>
      await _api.login(loginEntity);

  Future<CareGiverResponseModel> loginCareGiver(
    CareGiverEntityModel careGiverEntity,
  ) async => await _api.loginCareGiver(careGiverEntity);

  Future<GetUserResponseModel> getUserDetail() async =>
      await _api.getUserDetail();

  Future<GetAllDoctorsResponseModelList> getAllDoctorDetail() async =>
      await _api.getAllDoctors();

  Future<GetAllPharmaciesResponseModelList> getAllPharmacistsDetail() async =>
      await _api.getAllPharmacies();

  Future<GetAllConsultantResponseModelList> getAllConsultant() async =>
      await _api.getAllConsultant();

  Future<SearchedDoctorResponseModelList> getSearchedDoctors(
    SearchDoctorEntityModel searchDoctor,
  ) async => await _api.getSearchedDoctors(searchDoctor);

  Future<SearchedPharmacyResponseModelList> getSearchedPharmacists(
    SearchDoctorEntityModel searchPharmacist,
  ) async => await _api.getSearchedPharmacist(searchPharmacist);

  Future<SearchedMedicineResponseModelList> getSearchedMedicine(
    SearchDoctorEntityModel searchedMedicine,
  ) async => await _api.getSearchedMedicine(searchedMedicine);

  Future<dynamic> addBooking(AddBookingEntityModel addBooking) async =>
      await _api.addBooking(addBooking);

  Future<GetDocDetailResponseModel> getSpecificDoctorDetail(id) async =>
      await _api.getSpecificDoctors(id);

  Future<GetPharmacyDetailResponseModel> getSpecificPharmacyDetail(id) async =>
      await _api.getSpecificPharmacy(id);

  Future<GetMedicineDetailResponseModel> getSpecificMedicineDetail(id) async =>
      await _api.getSpecificMedicine(id);

  Future<dynamic> forgotPassword(
    ForgotPasswordEntityModel forgotPassword,
  ) async => await _api.forgotPassword(forgotPassword);

  Future<dynamic> updatePassword(
    ResetPasswordEntityModel updatePassword,
  ) async => await _api.updatePassword(updatePassword);

  Future<dynamic> verifyOtp(VerifyOtpEntityModel verifyOtp) async =>
      await _api.verifyOtp(verifyOtp);

  Future<dynamic> resendOtp(RequestOtpEntityModel requestPassword) async =>
      await _api.resendOtp(requestPassword);
}
