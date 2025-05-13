import 'package:injectable/injectable.dart';

import '../connect_end/model/get_lab_tech_detail_response_model/get_lab_tech_detail_response_model.dart';
import '../core_folder/app/app.locator.dart';
import '../core_folder/app/app.logger.dart';
import '../core_folder/network/network_service.dart';
import '../core_folder/network/url_path.dart';

@lazySingleton
class LabTechAuthApi {
  final _service = locator<NetworkService>();
  final logger = getLogger('LabTechViewModel');

  Future<GetLabTechDetailResponseModel> getLabTechDetail() async {
    try {
      final response = await _service.call(
        UrlConfig.labt_tech,
        RequestMethod.get,
      );
      logger.d(response.data);
      return GetLabTechDetailResponseModel.fromJson(response.data);
    } catch (e) {
      logger.d("response:$e");
      rethrow;
    }
  }
}
