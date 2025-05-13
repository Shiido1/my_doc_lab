import 'package:flutter/material.dart';
import 'package:my_doc_lab/core/connect_end/model/get_all_doctors_response_model/get_all_doctors_response_model.dart';
import 'package:my_doc_lab/core/connect_end/repo/doc_repo_impl.dart';
import 'package:stacked/stacked.dart';

// import '../../../ui/app_assets/app_utils.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/app/app.logger.dart';
import '../../core_folder/manager/shared_preference.dart';

class DocViewModel extends BaseViewModel {
  final BuildContext? context;
  final logger = getLogger('DocViewModel');

  final repositoryImply = DocRepoImpl();
  final session = locator<SharedPreferencesService>();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  GetAllDoctorsResponseModelList? _getAllDoctorsResponseModelList;
  GetAllDoctorsResponseModelList? get getAllDoctorsResponseModelList =>
      _getAllDoctorsResponseModelList;

  DocViewModel({this.context});

  // void getAllDoctors(context) async {
  //   try {
  //     _isLoading = true;
  //     _getAllDoctorsResponseModelList = await runBusyFuture(
  //       repositoryImply.getAllDoctorDetail(),
  //       throwException: true,
  //     );

  //     _isLoading = false;
  //   } catch (e) {
  //     _isLoading = false;
  //     logger.d(e);
  //     AppUtils.snackbar(context, message: e.toString(), error: true);
  //   }
  //   notifyListeners();
  // }
}
