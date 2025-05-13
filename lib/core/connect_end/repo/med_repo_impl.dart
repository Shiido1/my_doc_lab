import 'package:injectable/injectable.dart';

import '../../core_folder/app/app.locator.dart';
import '../contract/med_contract_impl.dart';
import '../model/get_lab_tech_detail_response_model/get_lab_tech_detail_response_model.dart';

@lazySingleton
class LabTechRepoImpl {
  // final _session = locator<SharedPreferencesService>();
  final _contract = locator<LabTechContractsImpl>();

  Future<GetLabTechDetailResponseModel> getLabTechDetail() async {
    final response = await _contract.getLabTechDetail();
    return response;
  }
}
