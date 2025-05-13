import 'package:injectable/injectable.dart';
import 'package:my_doc_lab/core/connect_end/model/care_giver_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/care_giver_response_model/care_giver_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/get_doc_detail_response_model/get_doc_detail_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/get_user_response_model/get_user_response_model.dart';

import '../../core_folder/app/app.locator.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../contract/contract_impl.dart';
import '../model/get_all_doctors_response_model/get_all_doctors_response_model.dart';
import '../model/login_entity.dart';
import '../model/login_response_model/login_response_model.dart';

@lazySingleton
class AuthRepoImpl {
  final _session = locator<SharedPreferencesService>();
  final _contract = locator<AuthContractsImpl>();

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

  Future<GetDocDetailResponseModel> getSpecificDoctorDetail(id) async {
    final response = await _contract.getSpecificDoctorDetail(id);
    return response;
  }

  void _chache(data) {
    if (data != null) {
      _session.authToken = data.token!;
      _session.usersData = data.toJson();
    }
  }
}
