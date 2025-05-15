import 'package:injectable/injectable.dart';
import 'package:my_doc_lab/core/connect_end/model/care_giver_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/care_giver_response_model/care_giver_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/forgot_password_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/get_doc_detail_response_model/get_doc_detail_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/get_user_response_model/get_user_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/registration_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/request_otp_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/reset_password_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/verify_otp_entity_model.dart';
import '../connect_end/model/add_booking_entity_model.dart';
import '../connect_end/model/care_giver_resiter_entity_model.dart';
import '../connect_end/model/get_all_consultant_response_model/get_all_consultant_response_model.dart';
import '../connect_end/model/get_all_doctors_response_model/get_all_doctors_response_model.dart';
import '../connect_end/model/get_all_pharmacies_response_model/get_all_pharmacies_response_model.dart';
import '../connect_end/model/get_medicine_detail_response_model/get_medicine_detail_response_model.dart';
import '../connect_end/model/get_pharmacy_detail_response_model/get_pharmacy_detail_response_model.dart';
import '../connect_end/model/login_entity.dart';
import '../connect_end/model/login_response_model/login_response_model.dart';
import '../connect_end/model/search_doctor_entity_model.dart';
import '../connect_end/model/searched_doctor_response_model/searched_doctor_response_model.dart';
import '../connect_end/model/searched_medicine_response_model/searched_medicine_response_model.dart';
import '../connect_end/model/searched_pharmacy_response_model/searched_pharmacy_response_model.dart';
import '../core_folder/app/app.locator.dart';
import '../core_folder/app/app.logger.dart';
import '../core_folder/network/network_service.dart';
import '../core_folder/network/url_path.dart';

@lazySingleton
class AuthApi {
  final _service = locator<NetworkService>();
  final logger = getLogger('AuthViewModel');

  Future<LoginResponseModel> login(LoginEntityModel loginEntity) async {
    try {
      final response = await _service.call(
        UrlConfig.login,
        RequestMethod.post,
        data: loginEntity.toJson(),
      );
      logger.d(response.data);
      return LoginResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> register(RegistrationEntityModel registerEntity) async {
    try {
      final response = await _service.call(
        UrlConfig.register,
        RequestMethod.post,
        data: registerEntity.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> registerCareGiver(
    CareGiverResiterEntityModel registerEntity,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.registerCareGiver,
        RequestMethod.post,
        data: registerEntity.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<CareGiverResponseModel> loginCareGiver(
    CareGiverEntityModel careGiverLoginEntity,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.loginCareGiver,
        RequestMethod.post,
        data: careGiverLoginEntity.toJson(),
      );
      logger.d(response.data);
      return CareGiverResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetUserResponseModel> getUserDetail() async {
    try {
      final response = await _service.call(UrlConfig.user, RequestMethod.get);
      logger.d(response.data);
      return GetUserResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetAllDoctorsResponseModelList> getAllDoctors() async {
    try {
      final response = await _service.call(
        UrlConfig.all_doctor,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetAllDoctorsResponseModelList.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetAllPharmaciesResponseModelList> getAllPharmacies() async {
    try {
      final response = await _service.call(
        UrlConfig.all_pharmacies,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetAllPharmaciesResponseModelList.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<SearchedDoctorResponseModelList> getSearchedDoctors(
    SearchDoctorEntityModel searchDoctor,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.doctor_search,
        RequestMethod.post,
        data: searchDoctor.toJson(),
      );
      logger.d(response.data);
      return SearchedDoctorResponseModelList.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<SearchedPharmacyResponseModelList> getSearchedPharmacist(
    SearchDoctorEntityModel searchPharmacy,
  ) async {
    try {
      final response = await _service.call(
        UrlConfig.pharmacy_search,
        RequestMethod.post,
        data: searchPharmacy.toJson(),
      );
      logger.d(response.data);
      return SearchedPharmacyResponseModelList.fromJson(response.data);
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

  Future<dynamic> addBooking(AddBookingEntityModel addBooking) async {
    try {
      final response = await _service.call(
        UrlConfig.add_booking,
        RequestMethod.post,
        data: addBooking.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetAllConsultantResponseModelList> getAllConsultant() async {
    try {
      final response = await _service.call(
        UrlConfig.all_consultation,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetAllConsultantResponseModelList.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetDocDetailResponseModel> getSpecificDoctors(id) async {
    try {
      final response = await _service.call(
        '${UrlConfig.all_doctor}/$id',
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetDocDetailResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetPharmacyDetailResponseModel> getSpecificPharmacy(id) async {
    try {
      final response = await _service.call(
        '${UrlConfig.spec_pharmacist}/$id',
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetPharmacyDetailResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<GetMedicineDetailResponseModel> getSpecificMedicine(id) async {
    try {
      final response = await _service.call(
        '${UrlConfig.get_meds}/$id',
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetMedicineDetailResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> forgotPassword(ForgotPasswordEntityModel forgotEntity) async {
    try {
      final response = await _service.call(
        UrlConfig.forgot_password,
        RequestMethod.post,
        data: forgotEntity.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> updatePassword(ResetPasswordEntityModel forgotEntity) async {
    try {
      final response = await _service.call(
        UrlConfig.update_password,
        RequestMethod.post,
        data: forgotEntity.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> verifyOtp(VerifyOtpEntityModel verifyOtpEntity) async {
    try {
      final response = await _service.call(
        UrlConfig.verifyPatientOtp,
        RequestMethod.post,
        data: verifyOtpEntity.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }

  Future<dynamic> resendOtp(RequestOtpEntityModel requestEntity) async {
    try {
      final response = await _service.call(
        UrlConfig.resentPatientOtp,
        RequestMethod.post,
        data: requestEntity.toJson(),
      );
      logger.d(response.data);
      return response.data;
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }
}
