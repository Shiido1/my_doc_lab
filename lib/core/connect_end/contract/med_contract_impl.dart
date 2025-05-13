import 'package:injectable/injectable.dart';

import '../../api_folder/med_lab_api.dart';
import '../../core_folder/app/app.locator.dart';
import '../model/get_lab_tech_detail_response_model/get_lab_tech_detail_response_model.dart';

@lazySingleton
class LabTechContractsImpl {
  final _api = locator<LabTechAuthApi>();

  Future<GetLabTechDetailResponseModel> getLabTechDetail() async =>
      await _api.getLabTechDetail();
}
