import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../core_folder/app/app.logger.dart';
import '../model/add_diagnosis_entity_model.dart';
import '../model/add_report_entity_model.dart';
import '../model/get_all_diagnosis_list_response_model/get_all_diagnosis_list_response_model.dart';
import '../model/get_category_by_id_response_model/get_category_by_id_response_model.dart';
import '../model/get_lab_tech_detail_response_model/get_lab_tech_detail_response_model.dart';
import '../model/get_lab_tech_dia_book_list_model/get_lab_tech_dia_book_list_model.dart';
import '../model/get_single_dia_response_model/get_single_dia_response_model.dart';
import '../model/lab_tech_category_list_response_model/lab_tech_category_list_response_model.dart';
import '../model/lab_tech_detail_response_model/lab_tech_detail_response_model.dart';
import '../model/lab_tech_wallet_response_model/lab_tech_wallet_response_model.dart';
import '../model/update_lab_tech_entity_model.dart';
import '../model/update_status_reason_entity_model.dart';
import '../repo/med_repo_impl.dart';

class LabTechViewModel extends BaseViewModel {
  final BuildContext? context;
  final logger = getLogger('LabTechViewModel');

  final repositoryImply = LabTechRepoImpl();
  // final session = locator<SharedPreferencesService>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  LabTechViewModel({this.context});

  GetLabTechDetailResponseModel? _getLabTechDetailResponseModel;
  GetLabTechDetailResponseModel? get getLabTechDetailResponseModel =>
      _getLabTechDetailResponseModel;
  GetSingleDiaResponseModel? _getSingleDiaResponseModel;
  GetSingleDiaResponseModel? get getSingleDiaResponseModel =>
      _getSingleDiaResponseModel;
  GetLabTechDiaBookListModel? _getLabTechDiaBookListModel;
  GetLabTechDiaBookListModel? get getLabTechDiaBookListModel =>
      _getLabTechDiaBookListModel;
  LabTechWalletResponseModel? _labTechWalletResponseModel;
  LabTechWalletResponseModel? get labTechWalletResponseModel =>
      _labTechWalletResponseModel;
  LabTechDetailResponseModel? _labTechDetailResponseModel;
  LabTechDetailResponseModel? get labTechDetailResponseModel =>
      _labTechDetailResponseModel;
  GetAllDiagnosisListResponseModel? _getAllDiagnosisListResponseModel;
  GetAllDiagnosisListResponseModel? get getAllDiagnosisListResponseModel =>
      _getAllDiagnosisListResponseModel;
  LabTechCategoryListResponseModel? _labTechCategoryListResponseModel;
  LabTechCategoryListResponseModel? get labTechCategoryListResponseModel =>
      _labTechCategoryListResponseModel;
  GetCategoryByIdResponseModel? _getCategoryByIdResponseModel;
  GetCategoryByIdResponseModel? get getCategoryByIdResponseModel =>
      _getCategoryByIdResponseModel;

  Future<void> getLabTechDetail(context) async {
    try {
      _isLoading = true;
      _getLabTechDetailResponseModel = await runBusyFuture(
        repositoryImply.getLabTechDetail(),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      // AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> updateLabTechDetail(
    context, {
    String? id,
    UpdateLabTechEntityModel? update,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.updateLabTechDetail(id: id, update: update),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      // AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> diagnosisBookingList() async {
    try {
      _isLoading = true;
      _getLabTechDiaBookListModel = await runBusyFuture(
        repositoryImply.diagnosisBookingList(),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      // AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> labTechWallet() async {
    try {
      _isLoading = true;
      _labTechWalletResponseModel = await runBusyFuture(
        repositoryImply.labTechWallet(),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      // AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> updateOrderStatus(
    context, {
    UpdateStatusReasonEntityModel? update,
    String? id,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.updateOrderStatus(id: id, update: update),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      // AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> addReport(context, {AddReportEntityModel? report}) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.addReport(report!),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      // AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> updateReport(
    context, {
    AddReportEntityModel? report,
    String? id,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.updateReport(report: report, id: id),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      // AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> labTechDetailReport(context, {String? id}) async {
    try {
      _isLoading = true;
      _labTechDetailResponseModel = await runBusyFuture(
        repositoryImply.labTechDetailReport(id!),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      // AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> deleteLabTechDetailReport(context, {String? id}) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.deleteLabTechDetailReport(id!),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      // AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> deleteLabTechDiagnosis(context, {String? id}) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.deleteLabTechDiagnosis(id!),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      // AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> addLabTechDiagnosis(
    context, {
    AddDiagnosisEntityModel? add,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.addLabTechDiagnosis(add),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      // AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> updateLabTechDiagnosis(
    context, {
    String? id,
    AddDiagnosisEntityModel? update,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.updateLabTechDiagnosis(id: id, update: update),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      // AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getDiagnosisById(context, {String? id}) async {
    try {
      _isLoading = true;
      _getSingleDiaResponseModel = await runBusyFuture(
        repositoryImply.getDiagnosisById(id),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      // AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getAllDiagnosis(context) async {
    try {
      _isLoading = true;
      _getAllDiagnosisListResponseModel = await runBusyFuture(
        repositoryImply.getAllDiagnosis(),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      // AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getAllLabTechCategory(context) async {
    try {
      _isLoading = true;
      _labTechCategoryListResponseModel = await runBusyFuture(
        repositoryImply.getAllLabTechCategory(),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      // AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getLabTechCategoryById(context, {String? id}) async {
    try {
      _isLoading = true;
      _getCategoryByIdResponseModel = await runBusyFuture(
        repositoryImply.getLabTechCategoryById(id!),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      // AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> addLabTechCategory(context, {String? nameCategory}) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.addLabTechCategory(nameCategory!),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      // AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> deleteLabTechCategory(context, {String? id}) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.deleteLabTechCategory(id!),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      // AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> updateLabTechCategory(
    context, {
    String? nameCategory,
    String? id,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.updateLabTechCategory(
          nameCategory: nameCategory,
          id: id,
        ),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      // AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }
}
