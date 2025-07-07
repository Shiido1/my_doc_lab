import 'dart:io';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_doc_lab/core/connect_end/model/get_lab_tech_report_response_model/datum.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked/stacked.dart';
import "package:collection/collection.dart";
import '../../../main.dart';
import '../../../ui/app_assets/app_color.dart';
import '../../../ui/app_assets/app_image.dart';
import '../../../ui/app_assets/app_utils.dart';
import '../../../ui/app_assets/app_validatiion.dart';
import '../../../ui/app_assets/bank_codes.dart';
import '../../../ui/app_assets/constant.dart';
import '../../../ui/app_assets/image_picker.dart';
import '../../../ui/widget/text_form_widget.dart';
import '../../../ui/widget/text_widget.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/app/app.logger.dart';
import '../../core_folder/app/app.router.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../../debouncer.dart';
import '../model/add_diagnosis_entity_model.dart';
import '../model/add_report_entity_model.dart';
import '../model/bank_save_entity_model.dart';
import '../model/bank_save_response_model/bank_save_response_model.dart';
import '../model/call_token_generate_entity_model.dart';
import '../model/call_token_generate_response_model/call_token_generate_response_model.dart';
import '../model/get_all_diagnosis_list_response_model/get_all_diagnosis_list_response_model.dart';
import '../model/get_category_by_id_response_model/get_category_by_id_response_model.dart';
import '../model/get_lab_tech_detail_response_model/get_lab_tech_detail_response_model.dart';
import '../model/get_lab_tech_dia_book_list_model/get_lab_tech_dia_book_list_model.dart';
import '../model/get_lab_tech_report_response_model/get_lab_tech_report_response_model.dart';
import '../model/get_lab_tech_sta_response_model/get_lab_tech_sta_response_model.dart';
import '../model/get_lab_texh_all_patients_response_model/get_lab_texh_all_patients_response_model.dart';
import '../model/get_message_index_response_model/get_message_index_response_model.dart';
import '../model/get_pharm_order_model/get_pharm_order_model.dart';
import '../model/get_single_dia_response_model/get_single_dia_response_model.dart';
import '../model/lab_tech_category_list_response_model/lab_tech_category_list_response_model.dart';
import '../model/lab_tech_detail_response_model/lab_tech_detail_response_model.dart';
import '../model/lab_tech_recent_appointment_model/lab_tech_recent_appointment_model.dart';
import '../model/lab_tech_wallet_response_model/lab_tech_wallet_response_model.dart';
import '../model/post_user_cloud_entity_model.dart';
import '../model/post_user_verification_cloud_response/post_user_verification_cloud_response.dart';
import '../model/received_message_response_model/received_message_response_model.dart';
import '../model/send_message_entity_model.dart';
import '../model/send_message_response_model/send_message_response_model.dart';
import '../model/update_lab_tech_entity_model.dart';
import '../model/update_status_reason_entity_model.dart';
import '../repo/med_repo_impl.dart';

class LabTechViewModel extends BaseViewModel {
  final BuildContext? context;
  final logger = getLogger('LabTechViewModel');

  final repositoryImply = LabTechRepoImpl();
  final session = locator<SharedPreferencesService>();

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isLoadingDelCat = false;
  bool get isLoadingDelCat => _isLoadingDelCat;
  bool isSwitched = false;
  bool onEditCate = false;
  bool hasLoadedConversation = false;
  bool hasLoadedIndexConversation = false;

  DateTime now = DateTime.now();
  final debouncer = Debouncer();
  String query = '';
  String queryReport = '';
  String queryBank = '';
  String queryAppointment = '';

  TextEditingController accountNumberTextController = TextEditingController();
  TextEditingController bankCodeTextController = TextEditingController();
  TextEditingController amountTextController = TextEditingController();
  TextEditingController reasonController = TextEditingController();

  String? bankCode;

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
  GetAllDiagnosisListResponseModelList? _getAllDiagnosisListResponseModel;
  GetAllDiagnosisListResponseModelList? get getAllDiagnosisListResponseModel =>
      _getAllDiagnosisListResponseModel;
  LabTechCategoryListResponseModelList? _labTechCategoryListResponseModel;
  LabTechCategoryListResponseModelList? get labTechCategoryListResponseModel =>
      _labTechCategoryListResponseModel;
  GetCategoryByIdResponseModel? _getCategoryByIdResponseModel;
  GetCategoryByIdResponseModel? get getCategoryByIdResponseModel =>
      _getCategoryByIdResponseModel;

  PostUserVerificationCloudResponse? _postUserVerificationCloudResponse;
  PostUserVerificationCloudResponse? get postUserVerificationCloudResponse =>
      _postUserVerificationCloudResponse;
  final _pickImage = ImagePickerHandler();
  File? image;
  String? filename;
  LabTechCategoryListResponseModel? onEditGetLabCategories;

  GlobalKey<FormState> diaFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKeySave = GlobalKey<FormState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyWithdraw = GlobalKey<FormState>();

  TextEditingController serviceNameTextController = TextEditingController();
  TextEditingController servicePriceTextController = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController turnaround = TextEditingController();
  TextEditingController category = TextEditingController();
  TextEditingController groupController = TextEditingController();
  TextEditingController addLabCategoriesTextController =
      TextEditingController();

  LabTechCategoryListResponseModel? labTechCategory;

  List<String> listGroup = ['individual', 'group'];

  GetMessageIndexResponseModelList? _getMessageIndexResponseModelList;
  GetMessageIndexResponseModelList? get getMessageIndexResponseModelList =>
      _getMessageIndexResponseModelList;
  ReceivedMessageResponseModelList? _receivedMessageResponseModelList;
  ReceivedMessageResponseModelList? get receivedMessageResponseModelList =>
      _receivedMessageResponseModelList;

  SendMessageResponseModel? _sendMessageResponseModel;
  SendMessageResponseModel? get sendMessageResponseModel =>
      _sendMessageResponseModel;

  GetLabTexhAllPatientsResponseModelList?
  _getLabTechAllPatientsResponseModelList;
  GetLabTexhAllPatientsResponseModelList?
  get getLabTechAllPatientsResponseModelList =>
      _getLabTechAllPatientsResponseModelList;

  GetLabTechStaResponseModel? _getLabTechStaResponseModel;
  GetLabTechStaResponseModel? get getLabTechStaResponseModel =>
      _getLabTechStaResponseModel;

  GetLabTechReportResponseModel? _getLabTechReportResponseModel;
  GetLabTechReportResponseModel? get getLabTechReportResponseModel =>
      _getLabTechReportResponseModel;

  CallTokenGenerateResponseModel? _callTokenGenerateResponseModel;
  CallTokenGenerateResponseModel? get callTokenGenerateResponseModel =>
      _callTokenGenerateResponseModel;

  TextEditingController sendtextController = TextEditingController(text: '');
  BankSaveResponseModel? get bankSaveResponseModel => _bankSaveResponseModel;
  BankSaveResponseModel? _bankSaveResponseModel;
  LabTechRecentAppointmentModelList? get labTechRecentAppointmentModel =>
      _labTechRecentAppointmentModel;
  LabTechRecentAppointmentModelList? _labTechRecentAppointmentModel;
  LabTechRecentAppointmentModelList? get labTechMostRecentAppointmentModel =>
      _labTechMostRecentAppointmentModel;
  LabTechRecentAppointmentModelList? _labTechMostRecentAppointmentModel;

  List<LabTechRecentAppointmentModel> getListOfCompletedAppointmentModelList =
      [];
  List<LabTechRecentAppointmentModel> getListOfCancelledAppointmentModelList =
      [];
  List<LabTechRecentAppointmentModel> getListOfScheduledAppointmentModelList =
      [];

  RtcEngine? engine;
  bool onSwitch = false;

  dynamic remoteUidGlobal;
  dynamic remoteUidGlobalLocal;

  bool localUserJoined = false;
  List<SendMessageEntityModel> sendList = [];

  bool get isTogglePassword => _isTogglePassword;
  bool _isTogglePassword = false;

  TextEditingController statusReportController = TextEditingController();
  TextEditingController summaryReportController = TextEditingController();
  List<String> statusList = ['Normal', 'Critical', 'Abnormal'];

  bool isOnTogglePassword() {
    _isTogglePassword = !_isTogglePassword;
    notifyListeners();
    return _isTogglePassword;
  }

  ScrollController scrollController1 = ScrollController();

  loadingDialog(context) => showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: TextView(
          text: 'Please wait..',
          textAlign: TextAlign.center,
          textStyle: GoogleFonts.gabarito(
            color: AppColor.primary1,

            fontSize: 20.2.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              SpinKitPouringHourGlassRefined(
                color: AppColor.primary1,
                size: 50.sp,
              ),
              SizedBox(height: 40.h),
              TextView(
                text: 'Loading...!',
                textStyle: GoogleFonts.gabarito(
                  color: AppColor.primary1,
                  fontSize: 17.2.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );

  formartFileImage(File? imageFile) {
    if (imageFile == null) return;
    return File(imageFile.path.replaceAll('\'', '').replaceAll('File: ', ''));
  }

  void pickImage(BuildContext context) {
    try {
      _pickImage.pickImage(
        context: context,
        file: (file) {
          image = file;
          filename = image!.path.split("/").last;
          postToCloudinary(
            context,
            postCloudinary: PostUserCloudEntityModel(
              file: MultipartFile.fromBytes(
                formartFileImage(image).readAsBytesSync(),
                filename: image!.path.split("/").last,
              ),
              uploadPreset: 'profilePicture',
              apiKey: '229558523244366',
            ),
          );
          notifyListeners();
        },
      );
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> postToCloudinary(
    context, {
    PostUserCloudEntityModel? postCloudinary,
  }) async {
    try {
      loadingDialog(context);
      _postUserVerificationCloudResponse = await runBusyFuture(
        repositoryImply.postCloudinary(postCloudinary!),
        throwException: true,
      );
      if (_postUserVerificationCloudResponse != null) {
        Navigator.pop(context);
        AppUtils.snackbar(context, message: 'Image uploaded Sucessfully.!');
      }
    } catch (e) {
      Navigator.pop(context);
      AppUtils.snackbar(
        context,
        message: 'Please try again later.',
        error: true,
      );
    }
    notifyListeners();
  }

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
      loadingDialog(context);
      var v = await runBusyFuture(
        repositoryImply.updateLabTechDetail(id: id, update: update),
        throwException: true,
      );
      if (v['message'] == 'Account Updated Successfully!') {
        Navigator.pop(context);
        AppUtils.snackbar(context, message: v['message']);
        navigate.navigateTo(Routes.laboratoryDashboard);
      }
    } catch (e) {
      Navigator.pop(context);
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

  Future<void> labTechWalletReload() async {
    try {
      // _isLoading = true;
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
      if (v['success'] == true) {
        await AppUtils.snackbarTop(context, message: v['message']);
        Navigator.pop(context);
      }
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
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
      Navigator.pop(context);
      Future.delayed(Duration(seconds: 2), () {
        AppUtils.snackbar(context, message: v['message']);
      });
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      Navigator.pop(context);
      AppUtils.snackbar(context, message: e.toString(), error: true);
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
      Navigator.pop(context);
      Future.delayed(Duration(seconds: 2), () async {
        await AppUtils.snackbar(context, message: v['message']);
        getLabTechReport();
      });
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      Navigator.pop(context);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getLabTechReport() async {
    try {
      _isLoading = true;
      _getLabTechReportResponseModel = await runBusyFuture(
        repositoryImply.getLabTechReport(),
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

  Future<void> getLabTechReportReload() async {
    try {
      _getLabTechReportResponseModel = await runBusyFuture(
        repositoryImply.getLabTechReport(),
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

  Future<void> getLabTechStats() async {
    try {
      _isLoading = true;
      _getLabTechStaResponseModel = await runBusyFuture(
        repositoryImply.getLabTechStats(),
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

  Future<void> getMostRecentAppointmentList() async {
    try {
      _isLoading = true;
      _labTechMostRecentAppointmentModel = await runBusyFuture(
        repositoryImply.mostAppointmentList(),
        throwException: true,
      );

      getListOfCancelledAppointmentModelList.clear();
      getListOfCompletedAppointmentModelList.clear();
      getListOfScheduledAppointmentModelList.clear();

      List<LabTechRecentAppointmentModel>? appointmentList = [];
      for (var element
          in _labTechMostRecentAppointmentModel!
              .labTechRecentAppointmentModelList!) {
        appointmentList.add(element);
        notifyListeners();
      }

      groupBy(appointmentList, (LabTechRecentAppointmentModel o) {
        if (o.status?.toLowerCase() == 'cancelled') {
          getListOfCancelledAppointmentModelList.add(o);
        }
        if (o.status?.toLowerCase() == 'completed') {
          getListOfCompletedAppointmentModelList.add(o);
        }
        if (o.status?.toLowerCase() == 'scheduled') {
          getListOfScheduledAppointmentModelList.add(o);
        }
        if (o.status?.toLowerCase() == 'rescheduled') {
          getListOfScheduledAppointmentModelList.add(o);
        }
      });
      notifyListeners();
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      // AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getRecentAppointmentList() async {
    try {
      _isLoading = true;
      _labTechRecentAppointmentModel = await runBusyFuture(
        repositoryImply.recentAppointmentList(),
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

  Future<void> getLabTechPatients() async {
    try {
      _isLoading = true;
      _getLabTechAllPatientsResponseModelList = await runBusyFuture(
        repositoryImply.getLabTechPatients(),
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
      Future.delayed(Duration(seconds: 2), () {
        AppUtils.snackbar(context, message: v['message']);
      });
      Navigator.pop(context);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> deleteLabTechDiagnosis(context, {String? id}) async {
    try {
      _isLoading = true;
      await runBusyFuture(
        repositoryImply.deleteLabTechDiagnosis(id!),
        throwException: true,
      );
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pop(context);
      });

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
      if (v['message'] == 'Diagnosis Added successfully!') {
        _isLoading = false;
        Navigator.pop(context);
        AppUtils.snackbar(context, message: v['message']);
        navigate.navigateTo(Routes.laboratoryDashboard);
      }
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
      if (v['message'] == 'Diagnosis updated successfully!') {
        _isLoading = false;
        Navigator.pop(context);
        AppUtils.snackbar(context, message: v['message']);
        navigate.navigateTo(Routes.laboratoryDashboard);
      }
    } catch (e) {
      _isLoading = false;
      AppUtils.snackbar(context, message: e.toString(), error: true);
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
      await runBusyFuture(
        repositoryImply.addLabTechCategory(nameCategory!),
        throwException: true,
      );
      getAllLabTechCategory(context);
      addLabCategoriesTextController.clear();
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
      await runBusyFuture(
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
      await runBusyFuture(
        repositoryImply.updateLabTechCategory(
          nameCategory: nameCategory,
          id: id,
        ),
        throwException: true,
      );
      getAllLabTechCategory(context);
      addLabCategoriesTextController.clear();
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      // AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Color statusValueColor(status) {
    if (status == 'inactive') {
      return AppColor.grey2;
    }
    return AppColor.primary1;
  }

  Color statusValuePatientsColor(status) {
    if (status == 'critical') {
      return AppColor.red;
    } else if (status == 'abnormal') {
      return AppColor.brown;
    }
    return AppColor.primary1;
  }

  void modalBottomSheetLabDiagnosis(
    context, {
    bool update = false,
    String? id,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Enables full-screen dragging
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (builder) {
        final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: DraggableScrollableSheet(
                expand: false,
                initialChildSize: 0.7, // 50% of screen height
                minChildSize: 0.5, // Can be dragged to 30% of screen height
                maxChildSize: 0.9, // Can be dragged to 90% of screen height
                builder: (context, scrollController) {
                  return ViewModelBuilder<LabTechViewModel>.reactive(
                    viewModelBuilder: () => LabTechViewModel(),
                    onViewModelReady: (model) {
                      WidgetsBinding.instance.addPostFrameCallback((_) async {
                        if (update == true) {
                          await model.getDiagnosisById(context, id: id);
                          serviceNameTextController.text =
                              model.getSingleDiaResponseModel?.name ?? '';
                          servicePriceTextController.text =
                              model.getSingleDiaResponseModel?.price
                                  .toString() ??
                              '';
                          description.text =
                              model.getSingleDiaResponseModel?.details ?? '';
                          turnaround.text =
                              model.getSingleDiaResponseModel?.turnaround ?? '';
                          category.text =
                              model
                                  .getSingleDiaResponseModel
                                  ?.diagnosisCategoryId
                                  .toString() ??
                              '';
                          groupController.text =
                              model.getSingleDiaResponseModel?.groupType ?? '';
                          isSwitched =
                              model.getSingleDiaResponseModel?.status ==
                                      'active'
                                  ? true
                                  : false;
                          model.notifyListeners();
                        }
                      });
                    },
                    disposeViewModel: false,
                    onDispose: (viewModel) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        clearLabServiceController();
                      });
                    },
                    builder: (_, LabTechViewModel model, __) {
                      return SingleChildScrollView(
                        padding: EdgeInsets.only(left: 12.w, right: 14.w),
                        controller: scrollController,
                        child: Form(
                          key: diaFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 6.0.h),
                              Center(
                                child: Container(
                                  width: 30.w,
                                  height: 3.5.h,
                                  margin: EdgeInsets.only(top: 10.w),
                                  decoration: BoxDecoration(
                                    color: AppColor.grey2.withOpacity(.4),
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.0.h),
                              TextView(
                                text:
                                    id == null
                                        ? 'Add Diagnosis Service'
                                        : 'Edit Diagnosis Service',
                                textStyle: TextStyle(
                                  color: AppColor.darkindgrey,
                                  fontSize: 22.0.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 20.h),
                              TextFormWidget(
                                label: 'Service Name',
                                labelStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.primary1,
                                ),
                                border: 10,
                                isFilled: true,
                                fillColor: AppColor.white,
                                controller: serviceNameTextController,
                                validator: AppValidator.validateString(),
                              ),
                              SizedBox(height: 20.h),
                              TextFormWidget(
                                label: 'Description',
                                labelStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.primary1,
                                ),
                                border: 10,
                                isFilled: true,
                                fillColor: AppColor.white,
                                controller: description,
                                validator: AppValidator.validateString(),
                              ),
                              SizedBox(height: 20.h),
                              Row(
                                children: [
                                  Expanded(
                                    child: TextFormWidget(
                                      label: 'Price (₦)',
                                      labelStyle: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.primary1,
                                      ),
                                      border: 10,
                                      isFilled: true,
                                      keyboardType: TextInputType.number,
                                      fillColor: AppColor.white,
                                      controller: servicePriceTextController,
                                      validator: AppValidator.validateInt(),
                                    ),
                                  ),
                                  SizedBox(width: 30.w),
                                  Expanded(
                                    child: TextFormWidget(
                                      label: 'Turnaround Time',
                                      labelStyle: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w400,
                                        color: AppColor.primary1,
                                      ),
                                      border: 10,
                                      isFilled: true,
                                      keyboardType: TextInputType.number,
                                      fillColor: AppColor.white,
                                      controller: turnaround,
                                      validator: AppValidator.validateInt(),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20.h),
                              TextFormWidget(
                                label: 'Category',
                                labelStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.primary1,
                                ),
                                border: 10,
                                isFilled: true,
                                readOnly: true,
                                fillColor: AppColor.white,
                                controller: category,
                                validator: AppValidator.validateString(),
                                suffixWidget: Padding(
                                  padding: EdgeInsets.all(9.2.w),
                                  child: GestureDetector(
                                    onTap:
                                        update == true
                                            ? () {}
                                            : () =>
                                                serviceCategoryDialog(context),
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      size: 20.sp,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.h),
                              TextFormWidget(
                                label: 'Group Type',
                                labelStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.primary1,
                                ),
                                border: 10,
                                isFilled: true,
                                readOnly: true,
                                fillColor: AppColor.white,
                                controller: groupController,
                                validator: AppValidator.validateString(),
                                suffixWidget: Padding(
                                  padding: EdgeInsets.all(9.2.w),
                                  child: GestureDetector(
                                    onTap:
                                        update == true
                                            ? () {}
                                            : () => groupTypeDialog(context),
                                    child: Icon(
                                      Icons.arrow_drop_down,
                                      size: 20.sp,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.h),

                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 6.w,
                                  horizontal: 6.w,
                                ),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: AppColor.greyIt),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextView(
                                          text: 'Active Status',
                                          textStyle: GoogleFonts.gabarito(
                                            color: AppColor.darkindgrey,
                                            fontSize: 17.2.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        SizedBox(height: 2.4.h),
                                        SizedBox(
                                          width: isTablet ? 320.w : 240.w,
                                          child: TextView(
                                            text:
                                                'This service will be available for new diagnostic requests',
                                            maxLines: 2,
                                            textOverflow: TextOverflow.ellipsis,
                                            textStyle: GoogleFonts.gabarito(
                                              color: AppColor.darkindgrey,
                                              fontSize: 14.8.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Switch(
                                      value: isSwitched,
                                      onChanged: (s) {
                                        isSwitched = s;
                                        setState(() {});
                                      },
                                      activeTrackColor: AppColor.primary1,
                                      activeColor: AppColor.white,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 32.0.h),

                              GestureDetector(
                                onTap: () async {
                                  if (diaFormKey.currentState!.validate()) {
                                    if (update == true) {
                                      await model.updateLabTechDiagnosis(
                                        context,
                                        id: id,
                                        update: AddDiagnosisEntityModel(
                                          name:
                                              serviceNameTextController.text
                                                  .trim(),
                                          price: int.parse(
                                            servicePriceTextController.text
                                                .trim(),
                                          ),
                                          details: description.text.trim(),
                                          turnaround: turnaround.text.trim(),
                                          diagnosisCategoryId: int.parse(
                                            category.text.trim(),
                                          ),
                                          groupType:
                                              groupController.text.trim(),

                                          status:
                                              isSwitched == true
                                                  ? 'active'
                                                  : 'inactive',
                                        ),
                                      );

                                      getAllDiagnosis(context);
                                      notifyListeners();
                                    } else {
                                      await model.addLabTechDiagnosis(
                                        context,
                                        add: AddDiagnosisEntityModel(
                                          name:
                                              serviceNameTextController.text
                                                  .trim(),
                                          price: int.parse(
                                            servicePriceTextController.text
                                                .trim(),
                                          ),
                                          details: description.text.trim(),
                                          turnaround: turnaround.text.trim(),
                                          diagnosisCategoryId:
                                              labTechCategory?.id,
                                          groupType:
                                              groupController.text.trim(),

                                          status:
                                              isSwitched == true
                                                  ? 'active'
                                                  : 'inactive',
                                        ),
                                      );

                                      getAllDiagnosis(context);
                                      notifyListeners();
                                    }
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.center,

                                  padding:
                                      isTablet
                                          ? EdgeInsets.all(6.w)
                                          : EdgeInsets.all(12.w),

                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.primary1,
                                  ),
                                  width: double.infinity,
                                  child:
                                      model.isLoading
                                          ? SpinKitCircle(
                                            color: AppColor.white,
                                            size: 30.sp,
                                          )
                                          : TextView(
                                            text:
                                                id == null
                                                    ? 'Add New Service'
                                                    : 'Update Service',
                                            textStyle: GoogleFonts.gabarito(
                                              color: AppColor.white,
                                              fontSize: 18.0.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                ),
                              ),

                              SizedBox(height: 20.h),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          },
        );
      },
    );
  }

  void deleteProductMedDialogBox(context, {String? id}) => showDialog(
    context: context,
    builder: (_) {
      return ViewModelBuilder<LabTechViewModel>.reactive(
        viewModelBuilder: () => LabTechViewModel(),
        onViewModelReady: (model) {},
        disposeViewModel: false,
        builder: (_, LabTechViewModel model, __) {
          return AlertDialog(
            title: TextView(
              text: 'Delete Diagnosis',
              textStyle: GoogleFonts.dmSans(
                color: AppColor.fineRed,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            content: TextView(
              text:
                  'Do you want to delete this diagnosis service? Clicking OK will permanently delete it.',
              textStyle: GoogleFonts.dmSans(
                color: AppColor.black,
                fontSize: 15.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            actions:
                model.isLoading
                    ? [SpinKitCircle(color: AppColor.primary1, size: 34.sp)]
                    : [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: TextView(
                          text: 'Cancel',
                          textStyle: GoogleFonts.dmSans(
                            color: AppColor.fineRed,
                            fontSize: 16.20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          await model.deleteLabTechDiagnosis(context, id: id);

                          getAllDiagnosis(context);
                          model.notifyListeners();
                        },
                        child: TextView(
                          text: 'OK',
                          textStyle: GoogleFonts.dmSans(
                            color: AppColor.green,
                            fontSize: 16.20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
          );
        },
      );
    },
  );

  serviceCategoryDialog(context) => showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: TextView(
          text: 'All Categories',
          textAlign: TextAlign.center,
          textStyle: GoogleFonts.gabarito(
            color: const Color.fromARGB(255, 48, 74, 62),

            fontSize: 20.2.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        content: ViewModelBuilder<LabTechViewModel>.reactive(
          viewModelBuilder: () => LabTechViewModel(),
          onViewModelReady: (model) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              model.getAllLabTechCategory(context);
            });
          },
          disposeViewModel: false,
          builder: (_, LabTechViewModel model, __) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  if (model.isLoading)
                    Padding(
                      padding: EdgeInsets.only(top: 10.w),
                      child: Center(
                        child: SpinKitCircle(
                          color: AppColor.primary1,
                          size: 34.sp,
                        ),
                      ),
                    ),
                  if (model.labTechCategoryListResponseModel != null &&
                      model
                          .labTechCategoryListResponseModel!
                          .labTechCategoryListResponseModelList!
                          .isNotEmpty)
                    ...model
                        .labTechCategoryListResponseModel!
                        .labTechCategoryListResponseModelList!
                        .map(
                          (o) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  category.text = o.name ?? '';
                                  labTechCategory = o;

                                  Navigator.pop(context);
                                  notifyListeners();
                                },
                                child: Container(
                                  width: double.infinity,
                                  child: TextView(
                                    text: o.name ?? '',
                                    textStyle: GoogleFonts.gabarito(
                                      color: AppColor.black,
                                      fontSize: 16.2.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                color: const Color.fromARGB(255, 48, 74, 62),
                                thickness: 1,
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            );
          },
        ),
      );
    },
  );

  groupTypeDialog(context) => showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: TextView(
          text: 'Select Group Type',
          textAlign: TextAlign.center,
          textStyle: GoogleFonts.gabarito(
            color: const Color.fromARGB(255, 48, 74, 62),

            fontSize: 20.2.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...listGroup.map(
                (o) => Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        groupController.text = o;

                        Navigator.pop(context);
                        notifyListeners();
                      },
                      child: Container(
                        width: double.infinity,
                        child: TextView(
                          text: o,
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.black,
                            fontSize: 16.2.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      color: const Color.fromARGB(255, 48, 74, 62),
                      thickness: 1,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    },
  );

  void clearLabServiceController() {
    serviceNameTextController.clear();
    servicePriceTextController.clear();
    description.clear();
    turnaround.clear();
    category.clear();
    groupController.clear();
    notifyListeners();
  }

  void modalBottomSheetAddCategory(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Enables full-screen dragging
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (builder) {
        final isTablet = MediaQuery.of(context).size.shortestSide >= 600;

        return ViewModelBuilder<LabTechViewModel>.reactive(
          viewModelBuilder: () => LabTechViewModel(),
          onViewModelReady: (model) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              model.getAllLabTechCategory(context);
            });
          },
          builder: (_, LabTechViewModel model, __) {
            return StatefulBuilder(
              builder: (_, StateSetter setState) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: DraggableScrollableSheet(
                    expand: false,
                    initialChildSize: 0.5, // 50% of screen height
                    minChildSize: 0.3, // Can be dragged to 30% of screen height
                    maxChildSize: 0.7, // Can be dragged to 90% of screen height
                    builder: (__, scrollController) {
                      return SingleChildScrollView(
                        padding: EdgeInsets.only(left: 12.w, right: 24.w),
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 6.0.h),
                            Center(
                              child: Container(
                                width: 30.w,
                                height: 3.5.h,
                                margin: EdgeInsets.only(top: 10.w),
                                decoration: BoxDecoration(
                                  color: AppColor.grey2.withOpacity(.4),
                                  borderRadius: BorderRadius.circular(22),
                                ),
                              ),
                            ),
                            SizedBox(height: 16.0.h),
                            TextView(
                              text:
                                  !model.onEditCate
                                      ? 'Add Categories'
                                      : 'Update Category',
                              textStyle: TextStyle(
                                color: AppColor.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            TextFormWidget(
                              label: 'Category Name',
                              labelStyle: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColor.primary1,
                              ),
                              border: 10,
                              isFilled: true,
                              fillColor: AppColor.white,
                              controller: model.addLabCategoriesTextController,
                              validator: AppValidator.validateString(),
                            ),
                            SizedBox(height: 20.h),

                            if (model.labTechCategoryListResponseModel !=
                                    null &&
                                model
                                    .labTechCategoryListResponseModel!
                                    .labTechCategoryListResponseModelList!
                                    .isNotEmpty)
                              ...model
                                  .labTechCategoryListResponseModel!
                                  .labTechCategoryListResponseModelList!
                                  .map(
                                    (i) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 250.w,
                                              child: TextView(
                                                text: i.name ?? '',
                                                maxLines: 1,
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                textStyle: TextStyle(
                                                  color: AppColor.black,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    model.onEditCate = true;
                                                    onEditGetLabCategories = i;
                                                    model
                                                            .addLabCategoriesTextController
                                                            .text =
                                                        onEditGetLabCategories!
                                                            .name!;
                                                    model.notifyListeners();
                                                  },
                                                  child: SvgPicture.asset(
                                                    AppImage.edit,
                                                    width: 20.w,
                                                    height: 20.h,
                                                    color: AppColor.black,
                                                  ),
                                                ),
                                                SizedBox(width: 10.w),
                                                IconButton(
                                                  onPressed: () {
                                                    model
                                                        .deleteServiceCategoryDialogBox(
                                                          context,
                                                          serviceId:
                                                              i.id.toString(),
                                                        );
                                                    model.notifyListeners();
                                                  },
                                                  icon: Icon(
                                                    Icons
                                                        .remove_circle_outline_outlined,
                                                    color: AppColor.fineRed,
                                                    size: 22.sp,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Divider(
                                          color: AppColor.greyIt.withOpacity(
                                            .2,
                                          ),
                                        ),
                                        SizedBox(height: 2.h),
                                      ],
                                    ),
                                  ),

                            SizedBox(height: 35.0.h),
                            !model.isLoading
                                ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () => Navigator.pop(context),
                                      child: Container(
                                        padding:
                                            isTablet
                                                ? EdgeInsets.all(12.0.w)
                                                : EdgeInsets.all(20.0.w),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          color: const Color.fromARGB(
                                            255,
                                            208,
                                            234,
                                            222,
                                          ),
                                        ),
                                        width: 140.w,
                                        alignment: Alignment.center,
                                        child: TextView(
                                          text: 'Cancel',
                                          textStyle: GoogleFonts.gabarito(
                                            color: AppColor.primary1,
                                            fontSize: 18.0.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        !model.onEditCate
                                            ? model.addLabTechCategory(
                                              context,
                                              nameCategory:
                                                  model
                                                      .addLabCategoriesTextController
                                                      .text
                                                      .trim(),
                                            )
                                            : model.updateLabTechCategory(
                                              context,
                                              nameCategory:
                                                  model
                                                      .addLabCategoriesTextController
                                                      .text
                                                      .trim(),
                                              id:
                                                  onEditGetLabCategories?.id
                                                      .toString(),
                                            );

                                        model.notifyListeners();
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding:
                                            isTablet
                                                ? EdgeInsets.all(10.w)
                                                : EdgeInsets.all(20.w),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          color: AppColor.primary1,
                                        ),
                                        child: TextView(
                                          text:
                                              !model.onEditCate
                                                  ? 'Add Category'
                                                  : 'Update Category',
                                          textStyle: GoogleFonts.gabarito(
                                            color: AppColor.white,
                                            fontSize: 18.0.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                                : SpinKitCircle(
                                  color: AppColor.primary1,
                                  size: 34.sp,
                                ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  void cancelAppointmentDialogBox(context, {String? id}) => showDialog(
    context: context,
    builder: (context) {
      return ViewModelBuilder<LabTechViewModel>.reactive(
        viewModelBuilder: () => LabTechViewModel(),
        onViewModelReady: (model) {},
        disposeViewModel: false,
        onDispose: (viewModel) {
          reasonController.clear();
        },
        builder: (_, LabTechViewModel model, __) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            insetPadding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ), // Adjust margin here
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9, // 90% of screen
              padding: EdgeInsets.all(16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Cancel Appointment',
                    textStyle: GoogleFonts.dmSans(
                      color: AppColor.fineRed,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  SizedBox(
                    height: 200.h,
                    child: Form(
                      key: formKey,
                      child: TextFormWidget(
                        label: 'Reason for cancelling appointment',
                        border: 10,
                        isFilled: true,
                        maxline: 4,
                        alignLabelWithHint: true,
                        fillColor: AppColor.transparent,

                        controller: reasonController,
                        validator: AppValidator.validateString(),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.h),
                  model.isLoading
                      ? SpinKitCircle(color: AppColor.grey1, size: 30.sp)
                      : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              reasonController.clear();
                              Navigator.of(context).pop();
                            },
                            child: TextView(
                              text: 'Cancel',
                              textStyle: GoogleFonts.dmSans(
                                color: AppColor.fineRed,
                                fontSize: 16.20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                model.updateOrderStatus(
                                  context,
                                  id: id,
                                  update: UpdateStatusReasonEntityModel(
                                    reason: reasonController.text,
                                    status: 'cancelled',
                                  ),
                                );
                                model.notifyListeners();
                              }
                            },
                            child: TextView(
                              text: 'OK',
                              textStyle: GoogleFonts.dmSans(
                                color: AppColor.green,
                                fontSize: 16.20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                ],
              ),
            ),
          );
        },
      );
    },
  );

  void completeAppointmentDialogBox(context, {String? id}) => showDialog(
    context: context,
    builder: (context) {
      return ViewModelBuilder<LabTechViewModel>.reactive(
        viewModelBuilder: () => LabTechViewModel(),
        onViewModelReady: (model) {},
        disposeViewModel: false,
        onDispose: (viewModel) {},
        builder: (_, LabTechViewModel model, __) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            insetPadding: EdgeInsets.symmetric(
              horizontal: 20.w,
            ), // Adjust margin here
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9, // 90% of screen
              padding: EdgeInsets.all(16.w),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Complete Appointment',
                    textStyle: GoogleFonts.dmSans(
                      color: AppColor.primary,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 16.h),
                  model.isLoading
                      ? SpinKitCircle(color: AppColor.grey1, size: 30.sp)
                      : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {
                              reasonController.clear();
                              Navigator.of(context).pop();
                            },
                            child: TextView(
                              text: 'Cancel',
                              textStyle: GoogleFonts.dmSans(
                                color: AppColor.fineRed,
                                fontSize: 16.20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              model.updateOrderStatus(
                                context,
                                id: id,
                                update: UpdateStatusReasonEntityModel(
                                  reason: 'Completed this appointment',
                                  status: 'completed',
                                ),
                              );
                              model.notifyListeners();
                            },
                            child: TextView(
                              text: 'OK',
                              textStyle: GoogleFonts.dmSans(
                                color: AppColor.green,
                                fontSize: 16.20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                ],
              ),
            ),
          );
        },
      );
    },
  );

  void modalBottomSheetReport(
    context, {
    GetLabTexhAllPatientsResponseModel? report,
    bool onEdit = false,
    Datum? dtReport,
    String? reportId,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Enables full-screen dragging
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (builder) {
        final isTablet = MediaQuery.of(context).size.shortestSide >= 600;

        return ViewModelBuilder<LabTechViewModel>.reactive(
          viewModelBuilder: () => LabTechViewModel(),
          onViewModelReady: (model) {
            if (onEdit == true) {
              statusReportController.text = dtReport?.status ?? '';
              summaryReportController.text = dtReport?.summary ?? '';
            }
          },
          onDispose: (viewModel) {
            statusReportController.clear();
            viewModel.image == null;
            summaryReportController.clear();
          },
          builder: (_, LabTechViewModel model, __) {
            return StatefulBuilder(
              builder: (_, StateSetter setState) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: DraggableScrollableSheet(
                    expand: false,
                    initialChildSize: 0.5, // 50% of screen height
                    minChildSize: 0.3, // Can be dragged to 30% of screen height
                    maxChildSize: 0.7, // Can be dragged to 90% of screen height
                    builder: (__, scrollController) {
                      return SingleChildScrollView(
                        padding: EdgeInsets.only(left: 12.w, right: 24.w),
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 6.0.h),
                            Center(
                              child: Container(
                                width: 30.w,
                                height: 3.5.h,
                                margin: EdgeInsets.only(top: 10.w),
                                decoration: BoxDecoration(
                                  color: AppColor.grey2.withOpacity(.4),
                                  borderRadius: BorderRadius.circular(22),
                                ),
                              ),
                            ),
                            SizedBox(height: 16.0.h),
                            TextView(
                              text: onEdit ? 'Edit Report' : 'Add Report',
                              textStyle: TextStyle(
                                color: AppColor.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            TextFormWidget(
                              label: 'Status',
                              labelStyle: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColor.primary1,
                              ),
                              border: 10,
                              isFilled: true,
                              readOnly: true,
                              fillColor: AppColor.white,
                              controller: statusReportController,
                              validator: AppValidator.validateString(),
                              suffixWidget: PopupMenuButton<String>(
                                onSelected: (String item) {
                                  // Handle the selected menu item
                                },
                                itemBuilder: (BuildContext context) {
                                  return [
                                    ...statusList.map(
                                      (s) => PopupMenuItem<String>(
                                        value: s,
                                        child: TextView(
                                          text: s,
                                          textStyle: GoogleFonts.gabarito(
                                            color: AppColor.darkindgrey,
                                            fontSize: 15.40.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        onTap: () {
                                          statusReportController.text =
                                              s.toLowerCase();
                                          model.notifyListeners();
                                        },
                                      ),
                                    ),
                                  ];
                                },
                                child: Icon(
                                  Icons.arrow_drop_down_sharp,
                                  size: 20.sp,
                                  color: AppColor.darkindgrey,
                                ), // Optional: Customize the button's icon
                              ),
                            ),

                            SizedBox(height: 20.h),
                            model.image != null
                                ? ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    model.image!,
                                    width: double.infinity,
                                    height: 130,
                                    fit: BoxFit.cover,
                                  ),
                                )
                                : dtReport!.imageUrl!.contains(
                                  'https://res.cloudinary.com',
                                )
                                ? GestureDetector(
                                  onTap: () => model.pickImage(context),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      dtReport.imageUrl!,
                                      width: double.infinity,
                                      height: 130,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                                : TextFormWidget(
                                  label: 'Select Image',
                                  labelStyle: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.primary1,
                                  ),
                                  border: 10,
                                  isFilled: true,
                                  readOnly: true,
                                  fillColor: AppColor.white,
                                  suffixWidget: IconButton(
                                    onPressed: () => model.pickImage(context),
                                    icon: Icon(
                                      Icons.arrow_drop_down_sharp,
                                      size: 20.sp,
                                      color: AppColor.darkindgrey,
                                    ),
                                  ),
                                ),

                            SizedBox(height: 20.h),
                            TextFormWidget(
                              label: 'Summary',
                              labelStyle: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColor.primary1,
                              ),
                              border: 10,
                              isFilled: true,
                              keyboardType: TextInputType.multiline,
                              alignLabelWithHint: true,
                              maxline: 4,
                              fillColor: AppColor.white,
                              controller: summaryReportController,
                              validator: AppValidator.validateString(),
                            ),
                            SizedBox(height: 35.0.h),
                            !model.isLoading
                                ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () => Navigator.pop(context),
                                      child: Container(
                                        padding:
                                            isTablet
                                                ? EdgeInsets.all(12.0.w)
                                                : EdgeInsets.all(20.0.w),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          color: const Color.fromARGB(
                                            255,
                                            208,
                                            234,
                                            222,
                                          ),
                                        ),
                                        width: 140.w,
                                        alignment: Alignment.center,
                                        child: TextView(
                                          text: 'Cancel',
                                          textStyle: GoogleFonts.gabarito(
                                            color: AppColor.primary1,
                                            fontSize: 18.0.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        onEdit
                                            ? model.updateReport(
                                              context,
                                              id: reportId,
                                              report: AddReportEntityModel(
                                                userId: dtReport!.userId,
                                                diagnosisId:
                                                    dtReport.diagnosisId,
                                                bookingId: dtReport.bookingId,
                                                status:
                                                    statusReportController.text
                                                        .trim(),
                                                imageUrl:
                                                    model
                                                        .postUserVerificationCloudResponse
                                                        ?.secureUrl ??
                                                    dtReport.imageUrl,
                                                summary:
                                                    summaryReportController.text
                                                        .trim(),
                                              ),
                                            )
                                            : model.addReport(
                                              context,
                                              report: AddReportEntityModel(
                                                userId: report!.userId,
                                                diagnosisId: report.diagnosisId,
                                                bookingId: report.bookingId,
                                                status:
                                                    statusReportController.text
                                                        .trim(),
                                                imageUrl:
                                                    model
                                                        .postUserVerificationCloudResponse
                                                        ?.secureUrl,
                                                summary:
                                                    summaryReportController.text
                                                        .trim(),
                                              ),
                                            );

                                        model.notifyListeners();
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding:
                                            isTablet
                                                ? EdgeInsets.all(10.w)
                                                : EdgeInsets.all(20.w),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          color: AppColor.primary1,
                                        ),
                                        child: TextView(
                                          text:
                                              onEdit
                                                  ? 'Update Report'
                                                  : 'Add Report',
                                          textStyle: GoogleFonts.gabarito(
                                            color: AppColor.white,
                                            fontSize: 18.0.sp,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                                : SpinKitCircle(
                                  color: AppColor.primary1,
                                  size: 34.sp,
                                ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  void deleteReportDialogBox(context, {String? reportId}) => showDialog(
    context: context,
    builder: (_) {
      return ViewModelBuilder<LabTechViewModel>.reactive(
        viewModelBuilder: () => LabTechViewModel(),
        onViewModelReady: (model) {},
        disposeViewModel: false,
        builder: (_, LabTechViewModel model, __) {
          return AlertDialog(
            title: TextView(
              text: 'Delete Report',
              textStyle: GoogleFonts.dmSans(
                color: AppColor.fineRed,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            content: TextView(
              text:
                  'Do you want to delete this report? Clicking OK will permanently delete it.',
              textStyle: GoogleFonts.dmSans(
                color: AppColor.black,
                fontSize: 15.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            actions:
                model.isLoading
                    ? [SpinKitCircle(color: AppColor.primary1, size: 34.sp)]
                    : [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: TextView(
                          text: 'Cancel',
                          textStyle: GoogleFonts.dmSans(
                            color: AppColor.fineRed,
                            fontSize: 16.20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          await model.deleteLabTechDetailReport(
                            context,
                            id: reportId!,
                          );
                          model.notifyListeners();
                        },
                        child: TextView(
                          text: 'OK',
                          textStyle: GoogleFonts.dmSans(
                            color: AppColor.green,
                            fontSize: 16.20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
          );
        },
      );
    },
  );

  void deleteServiceCategoryDialogBox(
    context, {
    String? serviceId,
  }) => showDialog(
    context: context,
    builder: (_) {
      return ViewModelBuilder<LabTechViewModel>.reactive(
        viewModelBuilder: () => LabTechViewModel(),
        onViewModelReady: (model) {},
        disposeViewModel: false,
        builder: (_, LabTechViewModel model, __) {
          return AlertDialog(
            title: TextView(
              text: 'Delete Service Category',
              textStyle: GoogleFonts.dmSans(
                color: AppColor.fineRed,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            content: TextView(
              text:
                  'Do you want to delete this service category? Clicking OK will permanently delete it.',
              textStyle: GoogleFonts.dmSans(
                color: AppColor.black,
                fontSize: 15.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            actions:
                model.isLoadingDelCat
                    ? [SpinKitCircle(color: AppColor.primary1, size: 34.sp)]
                    : [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: TextView(
                          text: 'Cancel',
                          textStyle: GoogleFonts.dmSans(
                            color: AppColor.fineRed,
                            fontSize: 16.20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          await model.deleteLabTechCategory(
                            context,
                            id: serviceId!,
                          );
                          await getAllLabTechCategory(context);
                          model.notifyListeners();
                        },
                        child: TextView(
                          text: 'OK',
                          textStyle: GoogleFonts.dmSans(
                            color: AppColor.green,
                            fontSize: 16.20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
          );
        },
      );
    },
  );

  void showPatientDialogBox(
    context, {
    GetLabTexhAllPatientsResponseModel? patients,
  }) => showDialog(
    context: context,
    builder: (_) {
      return ViewModelBuilder<LabTechViewModel>.reactive(
        viewModelBuilder: () => LabTechViewModel(),
        onViewModelReady: (model) {},
        disposeViewModel: false,
        builder: (_, LabTechViewModel model, __) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Patient\'s Details',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.darkindgrey,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                patients?.user?.profileImage != null
                    ? ClipOval(
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(28),
                        child: Image.network(
                          patients!.user!.profileImage!.contains('https')
                              ? '${patients.user?.profileImage}'
                              : 'https://res.cloudinary.com/dnv6yelbr/image/upload/v1747827538/${patients.user?.profileImage}',
                          fit: BoxFit.cover,
                          errorBuilder:
                              (context, error, stackTrace) =>
                                  shimmerViewPharm(),
                        ),
                      ),
                    )
                    : Container(
                      padding: EdgeInsets.all(28.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.oneKindgrey,
                      ),
                    ),
              ],
            ),
            insetPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.w),
            content: SizedBox(
              width: double.maxFinite,
              height: 260.h,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text:
                              '${patients?.user?.firstName?.capitalize()} ${patients?.user?.lastName?.capitalize()}',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.darkindgrey,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4.w),
                        TextView(
                          text:
                              'Gender: ${patients?.user?.gender?.capitalize() ?? ''}',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.greyIt,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        SizedBox(height: 4.w),
                        TextView(
                          text:
                              'Age: ${calculateAge(patients?.user?.dob ?? '')}',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.greyIt,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 4.w),
                        TextView(
                          text: 'Email Address: ${patients?.user?.email ?? ''}',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.grey,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 4.w),
                        TextView(
                          text:
                              'Home Address: ${patients?.user?.address ?? ''} ${patients?.user?.city ?? ''}, ${patients?.user?.state ?? ''}',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.darkindgrey,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 4.w),
                        TextView(
                          text: 'Phone Number: ${patients?.user?.phone ?? ''}',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.darkindgrey,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 4.w),
                        TextView(
                          text: 'Summary: ${patients?.summary ?? ''}',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.black,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 10.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 2.w,
                            horizontal: 6.w,
                          ),
                          decoration: BoxDecoration(
                            color: model
                                .statusValuePatientsColor(patients?.status)
                                .withOpacity(.2),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: TextView(
                            text: '${patients?.status?.capitalize()}',
                            textStyle: GoogleFonts.gabarito(
                              color: model.statusValuePatientsColor(
                                patients?.status,
                              ),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            patients?.imageUrl ?? '',
                            height: 140.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) =>
                                    shimmerViewLabPatient(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                },
                child: TextView(
                  text: 'OK',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.green,
                    fontSize: 16.20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          );
        },
      );
    },
  );

  void showPatientReportDialogBox(context, {Datum? patients}) => showDialog(
    context: context,
    builder: (_) {
      return ViewModelBuilder<LabTechViewModel>.reactive(
        viewModelBuilder: () => LabTechViewModel(),
        onViewModelReady: (model) {},
        disposeViewModel: false,
        builder: (_, LabTechViewModel model, __) {
          return AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Patient\'s Report Details',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.darkindgrey,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            insetPadding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.w),
            content: SizedBox(
              width: double.maxFinite,
              height: 260.h,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text:
                              '${patients?.user?.firstName?.capitalize()} ${patients?.user?.lastName?.capitalize()}',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.darkindgrey,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4.w),
                        TextView(
                          text: 'Age: ${patients?.user?.age ?? ''}',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.greyIt,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 4.w),
                        TextView(
                          text: 'Diagnosis: ${patients?.diagnosis?.name ?? ''}',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.grey,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        SizedBox(height: 4.w),
                        TextView(
                          text: 'Summary: ${patients?.summary ?? ''}',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.black,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 10.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 2.w,
                            horizontal: 6.w,
                          ),
                          decoration: BoxDecoration(
                            color: model
                                .statusValuePatientsColor(patients?.status)
                                .withOpacity(.2),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: TextView(
                            text: '${patients?.status?.capitalize()}',
                            textStyle: GoogleFonts.gabarito(
                              color: model.statusValuePatientsColor(
                                patients?.status,
                              ),
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            patients?.imageUrl ?? '',
                            height: 140.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) =>
                                    shimmerViewLabPatient(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                },
                child: TextView(
                  text: 'OK',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.green,
                    fontSize: 16.20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          );
        },
      );
    },
  );

  int calculateAge(String dobString) {
    DateTime dob = DateTime.parse(dobString);
    DateTime today = DateTime.now();
    int age = today.year - dob.year;
    if (today.month < dob.month ||
        (today.month == dob.month && today.day < dob.day)) {
      age--;
    }

    return age;
  }

  Color trnsType(status) {
    if (status.toLowerCase() == 'debit') {
      return AppColor.red;
    }
    return AppColor.primary1;
  }

  Future<void> saveBankAccount(
    context, {
    BankSaveEntityModel? bankEntity,
  }) async {
    try {
      _isLoading = true;
      _bankSaveResponseModel = await runBusyFuture(
        repositoryImply.bankSaveAccount(bankEntity!),
        throwException: true,
      );
      _isLoading = false;

      AppUtils.snackbar(context, message: _bankSaveResponseModel?.message);
    } catch (e) {
      _isLoading = false;
      if (e.toString().contains('The bank account name') ||
          e.toString().contains(
            'doesn\'t appear to match your profile name.',
          )) {
        AppUtils.snackbar(
          context,
          message:
              "The bank account name doesn't appear to match your profile name.",
          error: true,
        );
      } else {
        AppUtils.snackbar(context, message: e.toString(), error: true);
      }
      logger.d(e);
    }
    notifyListeners();
  }

  Future<void> withdrawFundsToAccount(context, {num? amount}) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.withdrawToAccount(amount!),
        throwException: true,
      );
      _isLoading = false;

      AppUtils.snackbar(context, message: v['message']);
    } catch (e) {
      _isLoading = false;

      AppUtils.snackbar(context, message: e.toString(), error: true);
      logger.d(e);
    }
    notifyListeners();
  }
  // chat stuffs

  Future<void> getChatIndex() async {
    try {
      _isLoading = true;
      _getMessageIndexResponseModelList = await runBusyFuture(
        repositoryImply.chatIndex(),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
    }
    notifyListeners();
  }

  Future<void> getChatIndexReload() async {
    try {
      _getMessageIndexResponseModelList = await runBusyFuture(
        repositoryImply.chatIndex(),
        throwException: true,
      );
      Future.delayed(Duration(seconds: 2), () {
        if (hasLoadedIndexConversation) getChatIndexReload();
      });
    } catch (e) {
      _isLoading = false;
      logger.d(e);
    }
    notifyListeners();
  }

  Future<void> receiveConversation(String id) async {
    try {
      _receivedMessageResponseModelList = await runBusyFuture(
        repositoryImply.receiveMessage(id),
        throwException: true,
      );
      _isLoading = false;
      Future.delayed(Duration(seconds: 2), () {
        if (hasLoadedConversation) receiveConversation(id);
        Future.delayed(Duration(seconds: 1), () {
          session.chatsData = {'chat': []};
          // sendList.clear();
        });
      });
    } catch (e) {
      _isLoading = false;
      logger.d(e);
    }
    notifyListeners();
  }

  void receiveConversationOnce(String id) {
    if (hasLoadedConversation == false) {
      return;
    } else {
      hasLoadedConversation = true;
      receiveConversation(id);
      scrollToBottom(); // existing method
    }
    notifyListeners();
  }

  void receiveIndexConversationOnce() {
    if (hasLoadedIndexConversation == false) {
      return;
    } else {
      hasLoadedIndexConversation = true;
      getChatIndexReload();
    }
    notifyListeners();
  }

  Future<void> sendMessage(SendMessageEntityModel send) async {
    try {
      sendList.add(send);
      session.chatsData = {'chat': sendList};
      if (session.chatsData.isEmpty) {
        return;
      } else {
        for (var element in session.chatsData['chat']) {
          SendMessageEntityModel sendMessageEntityModel =
              SendMessageEntityModel.fromJson(element);
          _sendMessageResponseModel = await runBusyFuture(
            repositoryImply.sendMessage(sendMessageEntityModel),
            throwException: true,
          );
          if (_sendMessageResponseModel?.success == true) {
            Future.delayed(Duration(seconds: 1), () {
              session.chatsData = {'chat': []};
              sendList.clear();
            });
          }
        }
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
    }
    notifyListeners();
  }

  boxMessage(ReceivedMessageResponseModel message) => Column(
    children: [
      message.senderType == "MydocLab\\Models\\User"
          ? Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(left: 20.w, right: 100.w, bottom: 20.w),

              padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(10),
                ),
                color: AppColor.primary1.withOpacity(.1),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: message.message ?? '',
                    textStyle: GoogleFonts.dmSans(
                      fontSize: 15.2.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.darkindgrey,
                    ),
                  ),
                  TextView(
                    text: DateFormat('hh:mma').format(
                      DateTime.parse(message.updatedAt.toString()).toLocal(),
                    ),
                    textStyle: GoogleFonts.dmSans(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColor.darkindgrey,
                    ),
                  ),
                ],
              ),
            ),
          )
          : Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.only(right: 20.w, left: 100.w, bottom: 20.w),
              padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(0),
                ),
                color: AppColor.primary1,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  TextView(
                    text: message.message ?? '',
                    textStyle: GoogleFonts.dmSans(
                      fontSize: 15.2.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColor.white,
                    ),
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextView(
                        text: DateFormat('hh:mma').format(
                          DateTime.parse(
                            message.updatedAt.toString(),
                          ).toLocal(),
                        ),
                        textStyle: GoogleFonts.dmSans(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColor.white,
                        ),
                      ),

                      SizedBox(width: 4.w),
                      Icon(Icons.check, color: AppColor.white, size: 14.sp),
                    ],
                  ),
                ],
              ),
            ),
          ),
    ],
  );

  void scrollToBottom() {
    if (scrollController1.hasClients) {
      scrollController1.animateTo(
        scrollController1.position.minScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  onSwitched() {
    onSwitch = !onSwitch;
    notifyListeners();
  }

  void generateToken(context, {CallTokenGenerateEntityModel? calltoken}) async {
    try {
      _callTokenGenerateResponseModel = await runBusyFuture(
        repositoryImply.generateToken(calltoken!),
        throwException: true,
      );
      initializeAgoraVoiceSDK();
    } catch (e) {
      logger.d(e);
    }
    notifyListeners();
  }

  // Set up the Agora RTC engine instance
  Future<void> initializeAgoraVoiceSDK() async {
    await [Permission.microphone, Permission.camera].request();
    engine = createAgoraRtcEngine();
    await engine!.initialize(
      const RtcEngineContext(
        appId: "e18babecb1eb4a889feefcbbf60e5a5a",
        channelProfile: ChannelProfileType.channelProfileCommunication,
      ),
    );
    _setupLocalVideo();
    _setupEventHandlers();
    _joinChannel();
  }

  Future<void> _setupLocalVideo() async {
    // The video module and preview are disabled by default.
    await engine?.enableVideo();
    await engine?.startPreview();
  }

  // If a remote user has joined, render their video, else display a waiting message
  Widget remoteVideo() {
    if (remoteUidGlobal != null) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: engine!, // Uses the Agora engine instance
          canvas: VideoCanvas(
            uid: int.parse(remoteUidGlobal.toString()),
            // renderMode: RenderModeType.renderModeFit,
          ), // Binds the remote user's video
          connection: RtcConnection(
            channelId: _callTokenGenerateResponseModel?.channelName,
          ), // Specifies the channel
        ),
      );
    } else {
      return const Text(
        'Waiting for remote user to join...',
        textAlign: TextAlign.center,
      );
    }
  }

  // Displays the local user's video view using the Agora engine.
  Widget localVideo() {
    return AgoraVideoView(
      controller: VideoViewController(
        rtcEngine: engine!, // Uses the Agora engine instance
        canvas: VideoCanvas(
          uid: 0, // Specifies the local user
          // renderMode:
          //     RenderModeType.renderModeHidden, // Sets the video rendering mode
        ),
      ),
    );
  }

  // Register an event handler for Agora RTC
  void _setupEventHandlers() {
    engine!.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          debugPrint("Local user ${connection.localUid} joined");
          localUserJoined = true;
          remoteUidGlobalLocal = connection.localUid;
          notifyListeners();
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          debugPrint("Remote doctor $remoteUid joined");
          remoteUidGlobal = remoteUid;
          notifyListeners();
        },
        onUserOffline: (
          RtcConnection connection,
          int remoteUid,
          UserOfflineReasonType reason,
        ) {
          debugPrint("Remote user $remoteUid left");
          remoteUidGlobal = null;
          notifyListeners();
        },
      ),
    );
    notifyListeners();
  }

  // Join a channel as a broadcasted
  Future<void> _joinChannel() async {
    await engine?.joinChannel(
      token: _callTokenGenerateResponseModel?.token ?? "",
      channelId: _callTokenGenerateResponseModel?.channelName ?? "",
      options: ChannelMediaOptions(
        autoSubscribeVideo:
            true, // Automatically subscribe to all video streams
        autoSubscribeAudio:
            true, // Automatically subscribe to all audio streams
        publishCameraTrack: true, // Publish camera-captured video
        publishMicrophoneTrack: true, // Publish microphone-captured audio
        // Use clientRoleBroadcaster to act as a host or clientRoleAudience for audience
        clientRoleType: ClientRoleType.clientRoleBroadcaster,
      ),
      uid: 0,
    );
  }

  // Leaves the channel and releases resources
  Future<void> cleanupAgoraEngine() async {
    await engine?.leaveChannel();
    await engine?.release();
  }

  sendMessageAction({
    Orders? app,
    GetMessageIndexResponseModel? messageModel,
  }) async {
    if (sendtextController.text != '') {
      String msg = sendtextController.text;
      Future.delayed(Duration(seconds: 0), () {
        sendtextController.clear();
      });
      if (app == null) {
        await sendMessage(
          SendMessageEntityModel(
            conversationId: int.parse(messageModel!.conversationId.toString()),
            receiverId: int.parse(messageModel.contactId.toString()),
            receiverType: "MydocLab\\Models\\User",
            message: msg,
          ),
        );
      } else {
        await sendMessage(
          SendMessageEntityModel(
            conversationId: 0,
            receiverId: int.parse(app.userId.toString()),
            receiverType: "MydocLab\\Models\\User",
            message: msg,
          ),
        );
      }
    } else {}
  }

  void modalBottomSheetSaveAccount(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Enables full-screen dragging
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (builder) {
        final isTablet = MediaQuery.of(context).size.shortestSide >= 600;

        return ViewModelBuilder<LabTechViewModel>.reactive(
          viewModelBuilder: () => LabTechViewModel(),
          onViewModelReady: (model) {},
          onDispose: (viewModel) {
            accountNumberTextController.clear();
            bankCodeTextController.clear();
          },
          builder: (_, LabTechViewModel model, __) {
            return StatefulBuilder(
              builder: (_, StateSetter setState) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: DraggableScrollableSheet(
                    expand: false,
                    initialChildSize: 0.5, // 50% of screen height
                    minChildSize: 0.3, // Can be dragged to 30% of screen height
                    maxChildSize: 0.7, // Can be dragged to 90% of screen height
                    builder: (__, scrollController) {
                      return SingleChildScrollView(
                        padding: EdgeInsets.only(left: 12.w, right: 24.w),
                        controller: scrollController,
                        child: Form(
                          key: formKeySave,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 6.0.h),
                              Center(
                                child: Container(
                                  width: 30.w,
                                  height: 3.5.h,
                                  margin: EdgeInsets.only(top: 10.w),
                                  decoration: BoxDecoration(
                                    color: AppColor.grey2.withOpacity(.4),
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.0.h),
                              TextView(
                                text: 'Save Bank Account',
                                textStyle: TextStyle(
                                  color: AppColor.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 20.h),
                              TextFormWidget(
                                label: 'Account Number',
                                labelStyle: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.primary1,
                                ),
                                border: 10,
                                keyboardType: TextInputType.number,
                                isFilled: true,
                                fillColor: AppColor.white,
                                controller: accountNumberTextController,
                                validator: AppValidator.validateInt(),
                              ),
                              SizedBox(height: 20.h),
                              TextFormWidget(
                                label: 'Bank Name',
                                labelStyle: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.primary1,
                                ),
                                border: 10,
                                keyboardType: TextInputType.number,
                                isFilled: true,
                                fillColor: AppColor.white,
                                controller: bankCodeTextController,
                                validator: AppValidator.validateString(),
                                suffixWidget: Padding(
                                  padding: EdgeInsets.all(9.2.w),
                                  child: GestureDetector(
                                    onTap: model.isOnTogglePassword,
                                    child: Icon(
                                      !model.isTogglePassword
                                          ? Icons.arrow_drop_down_sharp
                                          : Icons.arrow_drop_up_sharp,
                                      size: 30.sp,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20.h),
                              if (model.isTogglePassword)
                                Container(
                                  height: 300.h,
                                  decoration: BoxDecoration(
                                    color: AppColor.friendlyPrimary,
                                    borderRadius: BorderRadius.circular(10.r),
                                  ),
                                  child: SingleChildScrollView(
                                    physics: AlwaysScrollableScrollPhysics(),
                                    padding: EdgeInsets.only(
                                      left: 14.w,
                                      top: 12.w,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(right: 12.w),
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: TextFormWidget(
                                              label: 'Search Bank',
                                              labelStyle: TextStyle(
                                                fontSize: 20.sp,
                                                fontWeight: FontWeight.w500,
                                                color: AppColor.primary1,
                                              ),
                                              border: 10,
                                              keyboardType:
                                                  TextInputType.number,
                                              isFilled: true,
                                              fillColor: AppColor.white,
                                              prefixIcon: Icons.search,
                                              prefixIconColor: AppColor.grey1,
                                              onChange: (p0) {
                                                model.queryBank = p0;
                                                model.notifyListeners();
                                              },
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 20.h),
                                        if (model.queryBank != '')
                                          ...BankCodes().bank_code["data"]!
                                              .where(
                                                (w) => w['name']!
                                                    .toLowerCase()
                                                    .contains(
                                                      model.queryBank
                                                          .toLowerCase(),
                                                    ),
                                              )
                                              .map(
                                                (i) => Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        bankCode = i['code'];
                                                        bankCodeTextController
                                                            .text = i['name']!;
                                                        model
                                                            .isOnTogglePassword();
                                                        model.notifyListeners();
                                                      },
                                                      child: Container(
                                                        width: 250.w,
                                                        child: TextView(
                                                          text: i['name'] ?? '',
                                                          maxLines: 1,
                                                          textOverflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                          textStyle: TextStyle(
                                                            color:
                                                                AppColor.black,
                                                            fontSize: 16.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Divider(
                                                      color: AppColor.greyIt
                                                          .withOpacity(.2),
                                                    ),
                                                  ],
                                                ),
                                              )
                                        else
                                          ...BankCodes().bank_code["data"]!.map(
                                            (i) => Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    bankCode = i['code'];
                                                    bankCodeTextController
                                                        .text = i['name']!;
                                                    model.isOnTogglePassword();
                                                    model.notifyListeners();
                                                  },
                                                  child: SizedBox(
                                                    width: 250.w,
                                                    child: TextView(
                                                      text: i['name'] ?? '',
                                                      maxLines: 1,
                                                      textOverflow:
                                                          TextOverflow.ellipsis,
                                                      textStyle: TextStyle(
                                                        color: AppColor.black,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Divider(
                                                  color: AppColor.greyIt
                                                      .withOpacity(.2),
                                                ),
                                              ],
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                )
                              else
                                SizedBox.shrink(),

                              SizedBox(height: 35.0.h),
                              !model.isLoading
                                  ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () => Navigator.pop(context),
                                        child: Container(
                                          padding:
                                              isTablet
                                                  ? EdgeInsets.all(12.0.w)
                                                  : EdgeInsets.all(20.0.w),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            color: const Color.fromARGB(
                                              255,
                                              208,
                                              234,
                                              222,
                                            ),
                                          ),
                                          width: 140.w,
                                          alignment: Alignment.center,
                                          child: TextView(
                                            text: 'Cancel',
                                            textStyle: GoogleFonts.gabarito(
                                              color: AppColor.primary1,
                                              fontSize: 18.0.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (formKeySave.currentState!
                                              .validate()) {
                                            model.saveBankAccount(
                                              context,
                                              bankEntity: BankSaveEntityModel(
                                                accountNumber:
                                                    accountNumberTextController
                                                        .text
                                                        .trim(),
                                                bankCode: bankCode,
                                              ),
                                            );
                                          }
                                          model.notifyListeners();
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding:
                                              isTablet
                                                  ? EdgeInsets.all(10.w)
                                                  : EdgeInsets.all(20.w),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            color: AppColor.primary1,
                                          ),
                                          child: TextView(
                                            text: 'Save Account',
                                            textStyle: GoogleFonts.gabarito(
                                              color: AppColor.white,
                                              fontSize: 18.0.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                  : SpinKitCircle(
                                    color: AppColor.primary1,
                                    size: 34.sp,
                                  ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  void modalBottomSheetWithdrawFunds(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Enables full-screen dragging
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (builder) {
        final isTablet = MediaQuery.of(context).size.shortestSide >= 600;

        return ViewModelBuilder<LabTechViewModel>.reactive(
          viewModelBuilder: () => LabTechViewModel(),
          onViewModelReady: (model) {},
          onDispose: (viewModel) {
            amountTextController.clear();
          },
          builder: (_, LabTechViewModel model, __) {
            return StatefulBuilder(
              builder: (_, StateSetter setState) {
                return Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: DraggableScrollableSheet(
                    expand: false,
                    initialChildSize: 0.35, // 50% of screen height
                    minChildSize: 0.3, // Can be dragged to 30% of screen height
                    maxChildSize:
                        0.45, // Can be dragged to 90% of screen height
                    builder: (__, scrollController) {
                      return SingleChildScrollView(
                        padding: EdgeInsets.only(left: 12.w, right: 24.w),
                        controller: scrollController,
                        child: Form(
                          key: formKeyWithdraw,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 6.0.h),
                              Center(
                                child: Container(
                                  width: 30.w,
                                  height: 3.5.h,
                                  margin: EdgeInsets.only(top: 10.w),
                                  decoration: BoxDecoration(
                                    color: AppColor.grey2.withOpacity(.4),
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16.0.h),
                              TextView(
                                text: 'Withdraw Funds To Account',
                                textStyle: TextStyle(
                                  color: AppColor.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 20.h),
                              TextFormWidget(
                                label: 'Amount',
                                labelStyle: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.primary1,
                                ),
                                border: 10,
                                keyboardType: TextInputType.number,
                                isFilled: true,
                                fillColor: AppColor.white,
                                controller: amountTextController,
                                validator: AppValidator.validateInt(),
                              ),

                              SizedBox(height: 35.0.h),
                              !model.isLoading
                                  ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () => Navigator.pop(context),
                                        child: Container(
                                          padding:
                                              isTablet
                                                  ? EdgeInsets.all(12.0.w)
                                                  : EdgeInsets.all(20.0.w),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            color: const Color.fromARGB(
                                              255,
                                              208,
                                              234,
                                              222,
                                            ),
                                          ),
                                          width: 140.w,
                                          alignment: Alignment.center,
                                          child: TextView(
                                            text: 'Cancel',
                                            textStyle: GoogleFonts.gabarito(
                                              color: AppColor.primary1,
                                              fontSize: 18.0.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          if (formKeyWithdraw.currentState!
                                              .validate()) {
                                            model.withdrawFundsToAccount(
                                              amountTextController.text.trim(),
                                            );
                                          }
                                          model.notifyListeners();
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding:
                                              isTablet
                                                  ? EdgeInsets.all(10.w)
                                                  : EdgeInsets.all(20.w),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            color: AppColor.primary1,
                                          ),
                                          child: TextView(
                                            text: 'Withdraw Funds',
                                            textStyle: GoogleFonts.gabarito(
                                              color: AppColor.white,
                                              fontSize: 18.0.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                  : SpinKitCircle(
                                    color: AppColor.primary1,
                                    size: 34.sp,
                                  ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
        );
      },
    );
  }

  String statusValue(status) {
    if (status == 'cancelled') {
      return 'Failed';
    }
    if (status == 'scheduled') {
      return 'Pending';
    }
    return 'Completed';
  }

  Color statusAppColor(status) {
    if (status == 'cancelled') {
      return AppColor.fineRed;
    }
    if (status == 'scheduled') {
      return AppColor.yellow;
    }
    return AppColor.white;
  }
}
