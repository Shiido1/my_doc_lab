import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/core/connect_end/model/care_giver_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/care_giver_response_model/care_giver_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/login_entity.dart';
import 'package:my_doc_lab/core/connect_end/model/login_response_model/login_response_model.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/widget/text_widget.dart';
import 'package:stacked/stacked.dart';

import '../../../main.dart';
import '../../../ui/app_assets/app_utils.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/app/app.logger.dart';
import '../../core_folder/app/app.router.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../repo/repo_impl.dart';

class AuthViewModel extends BaseViewModel {
  final BuildContext? context;
  final logger = getLogger('AuthViewModel');

  final repositoryImply = AuthRepoImpl();
  final session = locator<SharedPreferencesService>();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  LoginResponseModel? _loginResponseModel;
  LoginResponseModel? get loginResponseModel => _loginResponseModel;
  CareGiverResponseModel? _careGiverResponseModel;
  CareGiverResponseModel? get careGiverResponseModel => _careGiverResponseModel;

  bool get isTogglePassword => _isTogglePassword;
  bool _isTogglePassword = false;

  String selectedRole = '';

  AuthViewModel({this.context});

  bool isOnTogglePassword() {
    _isTogglePassword = !_isTogglePassword;
    notifyListeners();
    return _isTogglePassword;
  }

  void loginUser(context, {LoginEntityModel? loginEntity}) async {
    try {
      loadingDialog(context);
      _loginResponseModel = await runBusyFuture(
        repositoryImply.login(loginEntity!),
        throwException: true,
      );
      if (_loginResponseModel?.status == 'success') {
        Navigator.pop(context);
        AppUtils.snackbar(
          context,
          message: _loginResponseModel?.message!,
          error: true,
        );
        navigate.navigateTo(Routes.dashboard);
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      Navigator.pop(context);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void loginCareGiver(context, {CareGiverEntityModel? careGiverEntity}) async {
    try {
      loadingDialog(context);
      _careGiverResponseModel = await runBusyFuture(
        repositoryImply.loginCareGiver(careGiverEntity!),
        throwException: true,
      );
      if (_careGiverResponseModel?.status == 'success') {
        Navigator.pop(context);
        AppUtils.snackbar(
          context,
          message: _careGiverResponseModel?.message!,
          error: true,
        );
        if (_careGiverResponseModel!.data!.userType == 'doctor') {
          navigate.navigateTo(Routes.docDashboard);
        } else if (_careGiverResponseModel!.data!.userType == 'pharmacy') {
          navigate.navigateTo(Routes.pharmacyDashboard);
        } else if (_careGiverResponseModel!.data!.userType ==
            'lab_technician') {
          navigate.navigateTo(Routes.laboratoryDashboard);
        }
      }
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      Navigator.pop(context);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

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

  selectSpecDialog(context) => showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: TextView(
          text: 'Select Role',
          textStyle: GoogleFonts.gabarito(
            color: AppColor.primary1,
            fontSize: 23.2.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 12.20.h),
              GestureDetector(
                onTap: () {
                  selectedRole = 'doctor';

                  Navigator.pop(context);
                  notifyListeners();
                },
                child: Container(
                  width: double.infinity,
                  child: TextView(
                    text: 'Doctor',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Divider(color: AppColor.primary1),
              GestureDetector(
                onTap: () {
                  selectedRole = 'pharmacy';

                  Navigator.pop(context);
                  notifyListeners();
                },
                child: Container(
                  width: double.infinity,
                  child: TextView(
                    text: 'Pharmacy',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              Divider(color: AppColor.primary1),
              GestureDetector(
                onTap: () {
                  selectedRole = 'lab_technician';
                  Navigator.pop(context);
                  notifyListeners();
                },
                child: Container(
                  width: double.infinity,
                  child: TextView(
                    text: 'Lab Technician',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w400,
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
}
