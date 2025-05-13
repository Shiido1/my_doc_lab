import 'package:injectable/injectable.dart';
import 'package:my_doc_lab/core/connect_end/model/get_doc_detail_response_model/get_doc_detail_response_model.dart';
import '../connect_end/model/get_all_doctors_response_model/get_all_doctors_response_model.dart';
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
}
