import 'package:injectable/injectable.dart';
import 'package:my_doc_lab/core/connect_end/model/care_giver_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/care_giver_response_model/care_giver_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/get_doc_detail_response_model/get_doc_detail_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/get_user_response_model/get_user_response_model.dart';
import '../../api_folder/auth_api.dart';
import '../../core_folder/app/app.locator.dart';
import '../model/get_all_doctors_response_model/get_all_doctors_response_model.dart';
import '../model/login_entity.dart';
import '../model/login_response_model/login_response_model.dart';

@lazySingleton
class AuthContractsImpl {
  final _api = locator<AuthApi>();

  Future<LoginResponseModel> login(LoginEntityModel loginEntity) async =>
      await _api.login(loginEntity);

  Future<CareGiverResponseModel> loginCareGiver(
    CareGiverEntityModel careGiverEntity,
  ) async => await _api.loginCareGiver(careGiverEntity);

  Future<GetUserResponseModel> getUserDetail() async =>
      await _api.getUserDetail();

  Future<GetAllDoctorsResponseModelList> getAllDoctorDetail() async =>
      await _api.getAllDoctors();

  Future<GetDocDetailResponseModel> getSpecificDoctorDetail(id) async =>
      await _api.getSpecificDoctors(id);
}
