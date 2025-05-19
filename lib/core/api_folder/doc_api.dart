import 'package:injectable/injectable.dart';
import 'package:my_doc_lab/core/connect_end/model/doctor_availability_entity_model/doctor_availability_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/get_doc_detail_response_model/get_doc_detail_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/update_doctor_entity_model.dart';
import '../core_folder/app/app.locator.dart';
import '../core_folder/app/app.logger.dart';
import '../core_folder/network/network_service.dart';
import '../core_folder/network/url_path.dart';

@lazySingleton
class DocAuthApi {
  final _service = locator<NetworkService>();
  final logger = getLogger('DocViewModel');

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
}
