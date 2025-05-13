import 'package:injectable/injectable.dart';
import 'package:my_doc_lab/core/connect_end/contract/doc_contract_impl.dart';
import 'package:my_doc_lab/core/connect_end/model/get_doc_detail_response_model/get_doc_detail_response_model.dart';

import '../../core_folder/app/app.locator.dart';
import '../model/get_all_doctors_response_model/get_all_doctors_response_model.dart';

@lazySingleton
class DocRepoImpl {
  // final _session = locator<SharedPreferencesService>();
  final _contract = locator<DocContractsImpl>();

  Future<GetDocDetailResponseModel> getDoctorDetail() async {
    final response = await _contract.getDoctorDetail();
    return response;
  }

  Future<GetAllDoctorsResponseModelList> getAllDoctorDetail() async {
    final response = await _contract.getAllDoctorDetail();
    return response;
  }
}
