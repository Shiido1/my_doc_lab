// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:my_doc_lab/core/connect_end/model/care_giver_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/care_giver_resiter_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/care_giver_response_model/care_giver_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/get_all_consultant_response_model/get_all_consultant_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/get_doc_detail_response_model/get_doc_detail_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/get_user_response_model/get_user_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/login_entity.dart';
import 'package:my_doc_lab/core/connect_end/model/login_response_model/login_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/registration_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/searched_doctor_response_model/searched_doctor_response_model.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_image.dart';
import 'package:my_doc_lab/ui/widget/text_widget.dart';
import 'package:stacked/stacked.dart';

import '../../../main.dart';
import '../../../ui/app_assets/app_utils.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/app/app.logger.dart';
import '../../core_folder/app/app.router.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../../debouncer.dart';
import '../model/add_booking_entity_model.dart';
import '../model/checkoutentitymodel.dart';
import '../model/get_all_doctors_response_model/get_all_doctors_response_model.dart';
import '../model/get_all_medicine_response_model/get_all_medicine_response_model.dart';
import '../model/get_all_pharmacies_response_model/get_all_pharmacies_response_model.dart';
import '../model/get_medicine_detail_response_model/get_medicine_detail_response_model.dart';
import '../model/get_pharmacy_detail_response_model/get_pharmacy_detail_response_model.dart';
import '../model/search_doctor_entity_model.dart';
import '../model/searched_medicine_response_model/searched_medicine_response_model.dart';
import '../model/searched_pharmacy_response_model/searched_pharmacy_response_model.dart';
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
  GetUserResponseModel? _getUserResponseModel;
  GetUserResponseModel? get getUserResponseModel => _getUserResponseModel;

  bool get isTogglePassword => _isTogglePassword;
  bool _isTogglePassword = false;

  bool get isTogglePasswordConfirm => _isTogglePasswordConfirm;
  bool _isTogglePasswordConfirm = false;

  GetAllDoctorsResponseModelList? _getAllDoctorsResponseModelList;
  GetAllDoctorsResponseModelList? get getAllDoctorsResponseModelList =>
      _getAllDoctorsResponseModelList;
  GetAllPharmaciesResponseModelList? _getAllPharmaciesResponseModelList;
  GetAllPharmaciesResponseModelList? get getAllPharmaciesResponseModelList =>
      _getAllPharmaciesResponseModelList;
  GetAllConsultantResponseModelList? _getAllConsultantResponseModelList;
  GetAllConsultantResponseModelList? get getAllConsultantResponseModelList =>
      _getAllConsultantResponseModelList;
  GetDocDetailResponseModel? _getDocDetailResponseModel;
  GetDocDetailResponseModel? get getDocDetailResponseModel =>
      _getDocDetailResponseModel;
  GetPharmacyDetailResponseModel? get getPharmacyDetailResponseModel =>
      _getPharmacyDetailResponseModel;
  GetPharmacyDetailResponseModel? _getPharmacyDetailResponseModel;
  GetMedicineDetailResponseModel? get getMedDetailResponseModel =>
      _getMedDetailResponseModel;
  GetMedicineDetailResponseModel? _getMedDetailResponseModel;
  GetAllMedicineResponseModelList? _getAllMedicineResponseModelList;
  GetAllMedicineResponseModelList? get getAllMedicineResponseModelList =>
      _getAllMedicineResponseModelList;

  SearchedDoctorResponseModelList? _searchedDoctorResponseModelList;
  SearchedDoctorResponseModelList? get searchedDoctorResponseModelList =>
      _searchedDoctorResponseModelList;

  SearchedPharmacyResponseModelList? _searchedPharmResponseModelList;
  SearchedPharmacyResponseModelList? get searchedPharmResponseModelList =>
      _searchedPharmResponseModelList;

  SearchedMedicineResponseModelList? _searchedMedResponseModelList;
  SearchedMedicineResponseModelList? get searchedMedResponseModelList =>
      _searchedMedResponseModelList;

  final debouncer = Debouncer();

  String selectedRole = '';

  AuthViewModel({this.context});

  String query = '';
  String queryPharm = '';
  String queryMed = '';

  double _total = 0.0;
  double get total => _total;
  Box<CheckoutEntityModel>? _box;

  Box<CheckoutEntityModel> getModelBox(box) {
    _box = box;
    notifyListeners();
    return _box!;
  }

  // void calculateTotal(Box<CheckoutEntityModel> box) {
  //   _total = 0.0;
  //   for (var i = 0; i < box.length; i++) {
  //     _total += double.tryParse(box.getAt(i)!.amount) ?? 0.0;
  //   }
  //   print('calculate::$_total');
  //   notifyListeners();
  // }

  void deleteCartItem(Box<CheckoutEntityModel> box, int index) {
    box.deleteAt(index);
    getCartTotal();
    // calculateTotal(box);
  }

  double getCartTotal() {
    double sum = 0.0;
    for (var i = 0; i < box.length; i++) {
      sum += double.tryParse(box.getAt(i).amount) ?? 0.0;
    }
    return sum;
  }

  bool isOnTogglePassword() {
    _isTogglePassword = !_isTogglePassword;
    notifyListeners();
    return _isTogglePassword;
  }

  bool isOnTogglePasswordConfirm() {
    _isTogglePasswordConfirm = !_isTogglePasswordConfirm;
    notifyListeners();
    return _isTogglePasswordConfirm;
  }

  void registerUser(context, {RegistrationEntityModel? registerEntity}) async {
    try {
      loadingDialog(context);
      await runBusyFuture(
        repositoryImply.register(registerEntity!),
        throwException: true,
      );
      Navigator.pop(context);
      navigate.navigateTo(
        Routes.loginScreen,
        arguments: LoginScreenArguments(userType: 'patients'),
      );
    } catch (e) {
      logger.d(e);
      Navigator.pop(context);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void careRegisterUser(
    context, {
    CareGiverResiterEntityModel? registerEntity,
  }) async {
    try {
      loadingDialog(context);
      await runBusyFuture(
        repositoryImply.registerCareGiver(registerEntity!),
        throwException: true,
      );
      Navigator.pop(context);
      navigate.navigateTo(
        Routes.loginScreen,
        arguments: LoginScreenArguments(userType: 'care-giver'),
      );
      // }
    } catch (e) {
      logger.d(e);
      Navigator.pop(context);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
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

  void getPatientDetail(context) async {
    try {
      _isLoading = true;
      _getUserResponseModel = await runBusyFuture(
        repositoryImply.getUserDetails(),
        throwException: true,
      );
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void getAllDoctors(context) async {
    try {
      _isLoading = true;
      _getAllDoctorsResponseModelList = await runBusyFuture(
        repositoryImply.getAllDoctorDetail(),
        throwException: true,
      );

      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void getAllPharmacies(context) async {
    try {
      _isLoading = true;
      _getAllPharmaciesResponseModelList = await runBusyFuture(
        repositoryImply.getAllPharmacistsDetail(),
        throwException: true,
      );

      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void getAllMedicine(context) async {
    try {
      _isLoading = true;
      _getAllMedicineResponseModelList = await runBusyFuture(
        repositoryImply.getAllMedicineDetail(),
        throwException: true,
      );

      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void getSearchedDoctor(
    context, {
    SearchDoctorEntityModel? searchEntity,
  }) async {
    try {
      // _isLoading = true;
      _searchedDoctorResponseModelList = await runBusyFuture(
        repositoryImply.getSearchDoctor(searchEntity!),
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

  void getSearchedPharm(
    context, {
    SearchDoctorEntityModel? searchEntity,
  }) async {
    try {
      // _isLoading = true;
      _searchedPharmResponseModelList = await runBusyFuture(
        repositoryImply.getSearchedPharmacists(searchEntity!),
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

  void getSearchedMed(context, {SearchDoctorEntityModel? searchEntity}) async {
    try {
      _isLoading = true;
      _searchedMedResponseModelList = await runBusyFuture(
        repositoryImply.getSearchedMedicine(searchEntity!),
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

  void addBooking(context, {AddBookingEntityModel? addBooking}) async {
    try {
      loadingDialog(context);
      var v = await runBusyFuture(
        repositoryImply.addBooking(addBooking!),
        throwException: true,
      );
      Navigator.pop(context);
      AppUtils.snackbar(context, message: v['message']);
    } catch (e) {
      Navigator.pop(context);
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void getAllConsultants(context) async {
    try {
      _isLoading = true;
      _getAllConsultantResponseModelList = await runBusyFuture(
        repositoryImply.getAllConsultants(),
        throwException: true,
      );
      logger.d(
        _getAllConsultantResponseModelList!.getAllConsultantResponseModelList,
      );
      logger.d(AppImage.aid_box);

      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void getSpecificDoctor(context, id) async {
    try {
      _isLoading = true;
      _getDocDetailResponseModel = await runBusyFuture(
        repositoryImply.getSpecificDoctorDetail(id),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void getSpecificPharmacist(context, id) async {
    try {
      _isLoading = true;
      _getPharmacyDetailResponseModel = await runBusyFuture(
        repositoryImply.getSpecificPharmacyDetail(id),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void getSpecificMeds(context, id) async {
    try {
      _isLoading = true;
      _getMedDetailResponseModel = await runBusyFuture(
        repositoryImply.getSpecificMedicineDetail(id),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
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

  getDoctorsGridCount(List<GetAllDoctorsResponseModel>? length1) {
    if (_searchedDoctorResponseModelList == null) {
      return length1!.length;
    } else if (_searchedDoctorResponseModelList != null &&
        _searchedDoctorResponseModelList!
            .searchedDoctorResponseModelList
            .isNotEmpty) {
      return _searchedDoctorResponseModelList
          ?.searchedDoctorResponseModelList
          .length;
    }
    notifyListeners();
    return 0;
  }

  doubleTapDeleteCartSnack(context) {
    AppUtils.snackbarTop(
      context,
      message: 'Kindly double tap item to delete items from cart',
    );
  }
}
