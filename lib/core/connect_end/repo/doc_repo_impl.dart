import 'package:injectable/injectable.dart';
import 'package:my_doc_lab/core/connect_end/contract/doc_contract_impl.dart';
import 'package:my_doc_lab/core/connect_end/model/doctor_availability_entity_model/doctor_availability_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/get_doc_detail_response_model/get_doc_detail_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/update_doctor_entity_model.dart';
import '../../core_folder/app/app.locator.dart';

@lazySingleton
class DocRepoImpl {
  // final _session = locator<SharedPreferencesService>();
  final _contract = locator<DocContractsImpl>();

  Future<GetDocDetailResponseModel> getDoctorDetail() async {
    final response = await _contract.getDoctorDetail();
    return response;
  }

  Future<dynamic> updateDoctor(
    String id, {
    UpdateDoctorEntityModel? updateDoctor,
  }) async {
    final response = await _contract.updateDoctorDetail(
      id,
      updateDoctor: updateDoctor,
    );
    return response;
  }

  Future<dynamic> doctorsAvailability(
    String id, {
    DoctorAvailabilityEntityModel? availability,
  }) async {
    final response = await _contract.doctorsAvailability(
      id,
      availability: availability,
    );
    return response;
  }
}
