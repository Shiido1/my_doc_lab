import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/core/connect_end/model/get_pharmacy_detail_response_model/get_pharmacy_detail_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/post_user_cloud_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/update_pharm_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/repo/pharm_repo_impl.dart';
import 'package:my_doc_lab/core/core_folder/app/app.router.dart';
import 'package:stacked/stacked.dart';
import '../../../main.dart';
import '../../../ui/app_assets/app_color.dart';
import '../../../ui/app_assets/app_utils.dart';
import '../../../ui/app_assets/image_picker.dart';
import '../../../ui/widget/text_widget.dart';
import '../../core_folder/app/app.logger.dart';
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
}
