import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/core/connect_end/model/add_med_entity_model/add_med_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/get_pharmacy_detail_response_model/get_pharmacy_detail_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/post_user_cloud_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/update_pharm_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/repo/pharm_repo_impl.dart';
import 'package:my_doc_lab/core/core_folder/app/app.router.dart';
import 'package:stacked/stacked.dart';
import '../../../main.dart';
import '../../../ui/app_assets/app_color.dart';
import '../../../ui/app_assets/app_utils.dart';
import '../../../ui/app_assets/app_validatiion.dart';
import '../../../ui/app_assets/image_picker.dart';
import '../../../ui/widget/text_form_widget.dart';
import '../../../ui/widget/text_widget.dart';
import '../../core_folder/app/app.logger.dart';
import '../model/get_pharm_med_response_model/get_pharm_med_response_model.dart';
import '../model/get_pharmacy_categories/get_pharmacy_categories.dart';
import '../model/post_user_verification_cloud_response/post_user_verification_cloud_response.dart';

class PharmViewModel extends BaseViewModel {
  final BuildContext? context;
  final logger = getLogger('PharmViewModel');

  final repositoryImply = PharmRepoImpl();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  PharmViewModel({this.context});

  GetPharmacyDetailResponseModel? _getPharmacyDetailResponseModel;
  GetPharmacyDetailResponseModel? get getPharmacyDetailResponseModel =>
      _getPharmacyDetailResponseModel;

  PostUserVerificationCloudResponse? _postUserVerificationCloudResponse;
  PostUserVerificationCloudResponse? get postUserVerificationCloudResponse =>
      _postUserVerificationCloudResponse;
  final _pickImage = ImagePickerHandler();
  File? image;
  String? filename;
  GetPharmacyCategoriesList? _getPharmacyCategoriesList;
  GetPharmacyCategoriesList? get getPharmacyCategoriesList =>
      _getPharmacyCategoriesList;
  GetPharmMedResponseModelList? _getPharmMedResponseModelList;
  GetPharmMedResponseModelList? get etPharmMedResponseModelList =>
      _getPharmMedResponseModelList;

  TextEditingController textController = TextEditingController();

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

  medCategoryDialog(context) => showDialog(
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
        content: ViewModelBuilder<PharmViewModel>.reactive(
          viewModelBuilder: () => PharmViewModel(),
          onViewModelReady: (model) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              model.getPharmCategories();
            });
          },
          disposeViewModel: false,
          builder: (_, PharmViewModel model, __) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  if (model.getPharmacyCategoriesList != null &&
                      model
                          .getPharmacyCategoriesList!
                          .getPharmacyCategoriesList!
                          .isNotEmpty)
                    ...model
                        .getPharmacyCategoriesList!
                        .getPharmacyCategoriesList!
                        .map(
                          (o) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
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

  Future<void> getPharmacistDetail(context) async {
    try {
      _isLoading = true;
      _getPharmacyDetailResponseModel = await runBusyFuture(
        repositoryImply.getPharmacyDetails(),
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

  void updatePharmDetail(
    context, {
    UpdatePharmEntityModel? update,
    String? id,
  }) async {
    try {
      loadingDialog(context);
      var v = await runBusyFuture(
        repositoryImply.updatePharmacy(id!, updatePharm: update),
        throwException: true,
      );
      if (v['message'] == 'Account updated successfully!') {
        Navigator.pop(context);
        AppUtils.snackbar(context, message: v['message']);
        navigate.navigateTo(Routes.pharmacyDashboard);
      }
    } catch (e) {
      Navigator.pop(context);
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void getPharmCategories() async {
    try {
      _getPharmacyCategoriesList = await runBusyFuture(
        repositoryImply.getPharmacyCategories(),
        throwException: true,
      );
    } catch (e) {
      logger.d(e);
    }
    notifyListeners();
  }

  void getPharmMedicine() async {
    try {
      _getPharmMedResponseModelList = await runBusyFuture(
        repositoryImply.getAllMedsList(),
        throwException: true,
      );
    } catch (e) {
      logger.d(e);
    }
    notifyListeners();
  }

  void addPharmCategories(String name) async {
    try {
      await runBusyFuture(
        repositoryImply.addPharmCategories(name),
        throwException: true,
      );
    } catch (e) {
      logger.d(e);
    }
    notifyListeners();
  }

  void addPharmMedicine(AddMedEntityModel add) async {
    try {
      await runBusyFuture(
        repositoryImply.addPharmMedicine(add),
        throwException: true,
      );
    } catch (e) {
      logger.d(e);
    }
    notifyListeners();
  }

  void updatePharmMedicine({String? id, AddMedEntityModel? add}) async {
    try {
      await runBusyFuture(
        repositoryImply.updatePharmMedicine(id: id, add: add),
        throwException: true,
      );
    } catch (e) {
      logger.d(e);
    }
    notifyListeners();
  }

  void updatePharmCategories({String? name, String? id}) async {
    try {
      await runBusyFuture(
        repositoryImply.updatePharmCategories(name: name, id: id),
        throwException: true,
      );
    } catch (e) {
      logger.d(e);
    }
    notifyListeners();
  }

  void updatePharmMedsQty({String? quabtity, String? id}) async {
    try {
      await runBusyFuture(
        repositoryImply.updatePharmMedsQty(quantity: quabtity, id: id),
        throwException: true,
      );
    } catch (e) {
      logger.d(e);
    }
    notifyListeners();
  }

  void deletePharmCategories(String id) async {
    try {
      await runBusyFuture(
        repositoryImply.deletePharmCategories(id),
        throwException: true,
      );
    } catch (e) {
      logger.d(e);
    }
    notifyListeners();
  }

  void deletePharmMed(String id) async {
    try {
      await runBusyFuture(
        repositoryImply.deletePharmMed(id),
        throwException: true,
      );
    } catch (e) {
      logger.d(e);
    }
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
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: DraggableScrollableSheet(
                expand: false,
                initialChildSize: 0.5, // 50% of screen height
                minChildSize: 0.3, // Can be dragged to 30% of screen height
                maxChildSize: 0.7, // Can be dragged to 90% of screen height
                builder: (context, scrollController) {
                  return ViewModelBuilder<PharmViewModel>.reactive(
                    viewModelBuilder: () => PharmViewModel(),
                    onViewModelReady: (model) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        model.getPharmCategories();
                      });
                    },
                    disposeViewModel: false,
                    builder: (_, PharmViewModel model, __) {
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
                              text: 'Add Categories',
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
                              controller: textController,
                              validator: AppValidator.validateString(),
                            ),
                            SizedBox(height: 20.h),
                            if (model.getPharmacyCategoriesList != null &&
                                model
                                    .getPharmacyCategoriesList!
                                    .getPharmacyCategoriesList!
                                    .isNotEmpty)
                              ...model
                                  .getPharmacyCategoriesList!
                                  .getPharmacyCategoriesList!
                                  .map(
                                    (i) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextView(
                                          text: i.name ?? '',
                                          textStyle: TextStyle(
                                            color: AppColor.black,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
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

                            SizedBox(height: 25.0.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  child: Container(
                                    padding:
                                        isTablet
                                            ? EdgeInsets.all(12.0.w)
                                            : EdgeInsets.all(20.0.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),

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
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding:
                                        isTablet
                                            ? EdgeInsets.all(10.w)
                                            : EdgeInsets.all(20.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColor.primary1,
                                    ),
                                    width: 170.w,
                                    child: TextView(
                                      text: 'Add Category',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.white,
                                        fontSize: 18.0.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
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

  void modalBottomSheetAddMedicine(context, {bool update = false}) {
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
                  return ViewModelBuilder<PharmViewModel>.reactive(
                    viewModelBuilder: () => PharmViewModel(),
                    onViewModelReady: (model) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        model.getPharmCategories();
                      });
                    },
                    disposeViewModel: false,
                    builder: (_, PharmViewModel model, __) {
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
                              text: 'Add New Product',
                              textStyle: TextStyle(
                                color: AppColor.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            TextFormWidget(
                              label: 'Product Name',
                              labelStyle: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColor.primary1,
                              ),
                              border: 10,
                              isFilled: true,
                              fillColor: AppColor.white,
                              controller: textController,
                              validator: AppValidator.validateString(),
                            ),
                            SizedBox(height: 20.h),
                            TextFormWidget(
                              label: 'Price (₦)',
                              labelStyle: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColor.primary1,
                              ),
                              border: 10,
                              isFilled: true,
                              fillColor: AppColor.white,
                              controller: textController,
                              validator: AppValidator.validateString(),
                            ),
                            SizedBox(height: 20.h),
                            TextFormWidget(
                              label: 'Volume',
                              labelStyle: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColor.primary1,
                              ),
                              border: 10,
                              isFilled: true,
                              fillColor: AppColor.white,
                              controller: textController,
                              validator: AppValidator.validateString(),
                            ),
                            SizedBox(height: 20.h),
                            TextFormWidget(
                              label: 'Quantity',
                              labelStyle: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColor.primary1,
                              ),
                              border: 10,
                              isFilled: true,
                              fillColor: AppColor.white,
                              controller: textController,
                              validator: AppValidator.validateString(),
                            ),
                            SizedBox(height: 20.h),
                            TextFormWidget(
                              label: 'Expiration Date',
                              labelStyle: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColor.primary1,
                              ),
                              border: 10,
                              isFilled: true,
                              fillColor: AppColor.white,
                              controller: textController,
                              validator: AppValidator.validateString(),
                            ),
                            SizedBox(height: 20.h),
                            TextFormWidget(
                              label: 'Medicine Category',
                              labelStyle: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColor.primary1,
                              ),
                              border: 10,
                              isFilled: true,
                              readOnly: true,
                              fillColor: AppColor.white,
                              controller: textController,
                              validator: AppValidator.validateString(),
                              suffixWidget: Padding(
                                padding: EdgeInsets.all(9.2.w),
                                child: GestureDetector(
                                  onTap: () => medCategoryDialog(context),
                                  child: Icon(
                                    Icons.arrow_drop_down,
                                    size: 20.sp,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  child: Container(
                                    padding:
                                        isTablet
                                            ? EdgeInsets.all(12.0.w)
                                            : EdgeInsets.all(20.0.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),

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
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding:
                                        isTablet
                                            ? EdgeInsets.all(10.w)
                                            : EdgeInsets.all(20.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColor.primary1,
                                    ),
                                    width: 170.w,
                                    child: TextView(
                                      text: 'Add Product',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.white,
                                        fontSize: 18.0.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
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
}
