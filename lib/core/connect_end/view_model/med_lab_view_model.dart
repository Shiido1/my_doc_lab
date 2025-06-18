import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';

import '../../../main.dart';
import '../../../ui/app_assets/app_color.dart';
import '../../../ui/app_assets/app_image.dart';
import '../../../ui/app_assets/app_utils.dart';
import '../../../ui/app_assets/app_validatiion.dart';
import '../../../ui/app_assets/image_picker.dart';
import '../../../ui/widget/text_form_widget.dart';
import '../../../ui/widget/text_widget.dart';
import '../../core_folder/app/app.logger.dart';
import '../../core_folder/app/app.router.dart';
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
import '../model/post_user_cloud_entity_model.dart';
import '../model/post_user_verification_cloud_response/post_user_verification_cloud_response.dart';
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
  bool _isLoadingDelCat = false;
  bool get isLoadingDelCat => _isLoadingDelCat;
  bool isSwitched = false;
  bool onEditCate = false;

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
        AppUtils.snackbar(
          context,
          message: 'Image uploaded to cloudinary Sucessfully.!',
        );
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
      if (v['message'] == 'Account updated successfully!') {
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
      await runBusyFuture(
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
      await runBusyFuture(
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
      await runBusyFuture(
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
      await runBusyFuture(
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

  Color trnsType(status) {
    if (status.toLowerCase() == 'debit') {
      return AppColor.red;
    }
    return AppColor.primary1;
  }
}
