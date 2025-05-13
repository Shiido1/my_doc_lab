import 'package:injectable/injectable.dart';
import 'package:my_doc_lab/core/api_folder/doc_api.dart';
import 'package:my_doc_lab/core/connect_end/model/get_doc_detail_response_model/get_doc_detail_response_model.dart';

import '../../core_folder/app/app.locator.dart';
import '../model/get_all_doctors_response_model/get_all_doctors_response_model.dart';

@lazySingleton
class DocContractsImpl {
  final _api = locator<DocAuthApi>();

  Future<GetDocDetailResponseModel> getDoctorDetail() async =>
      await _api.getDoctorDetail();
  Future<GetAllDoctorsResponseModelList> getAllDoctorDetail() async =>
      await _api.getAllDoctors();
}
