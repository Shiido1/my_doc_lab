import 'package:injectable/injectable.dart';
import 'package:my_doc_lab/core/connect_end/model/care_giver_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/care_giver_response_model/care_giver_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/get_doc_detail_response_model/get_doc_detail_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/get_user_response_model/get_user_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/registration_entity_model.dart';

import '../../core_folder/app/app.locator.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../contract/contract_impl.dart';
import '../model/care_giver_resiter_entity_model.dart';
import '../model/forgot_password_entity_model.dart';
import '../model/get_all_consultant_response_model/get_all_consultant_response_model.dart';
import '../model/get_all_doctors_response_model/get_all_doctors_response_model.dart';
import '../model/get_all_pharmacies_response_model/get_all_pharmacies_response_model.dart';
import '../model/get_pharmacy_detail_response_model/get_pharmacy_detail_response_model.dart';
import '../model/login_entity.dart';
import '../model/login_response_model/login_response_model.dart';
import '../model/request_otp_entity_model.dart';
import '../model/reset_password_entity_model.dart';
import '../model/verify_otp_entity_model.dart';

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

  Future<GetAllConsultantResponseModelList> getAllConsultants() async {
    final response = await _contract.getAllConsultant();
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

  void _chache(data) {
    if (data != null) {
      _session.authToken = data.token!;
      _session.usersData = data.toJson();
    }
  }
}
