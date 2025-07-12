// ignore_for_file: avoid_print, deprecated_member_use

import 'dart:io';

import "package:collection/collection.dart";
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_doc_lab/core/connect_end/model/bank_save_response_model/bank_save_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/get_doc_detail_response_model/get_doc_detail_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/received_message_response_model/received_message_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/send_message_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/update_doctor_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/update_status_reason_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/repo/doc_repo_impl.dart';
import 'package:my_doc_lab/ui/app_assets/bank_codes.dart';
import 'package:my_doc_lab/ui/app_assets/constant.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked/stacked.dart';
import '../../../main.dart';
import '../../../ui/app_assets/app_color.dart';
import '../../../ui/app_assets/app_image.dart';
import '../../../ui/app_assets/app_utils.dart';
import '../../../ui/app_assets/app_validatiion.dart';
import '../../../ui/app_assets/image_picker.dart';
import '../../../ui/screens/dashboard/chat/video_chat_agora/doc_vid_call_look_screen.dart';
import '../../../ui/widget/text_form_widget.dart';
import '../../../ui/widget/text_widget.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/app/app.logger.dart';
import '../../core_folder/app/app.router.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../../debouncer.dart';
import '../model/bank_save_entity_model.dart';
import '../model/call_token_generate_entity_model.dart';
import '../model/call_token_generate_response_model/call_token_generate_response_model.dart';
import '../model/create_add_medicine_entity_model.dart';
import '../model/create_prescription_entity_model.dart';
import '../model/doctor_availability_entity_model/availability.dart';
import '../model/doctor_availability_entity_model/doctor_availability_entity_model.dart';
import '../model/get_doctor_statistic_model/get_doctor_statistic_model.dart';
import '../model/get_doctors_analysis_model/get_doctors_analysis_model.dart';
import '../model/get_doctors_wallet_response_model/get_doctors_wallet_response_model.dart';
import '../model/get_list_of_doctors_appointment_model/get_list_of_doctors_appointment_model.dart';
import '../model/get_message_index_response_model/get_message_index_response_model.dart';
import '../model/get_patient_list_for_doc_model/get_patient_list_for_doc_model.dart';
import '../model/get_prescription_list_response_model/get_prescription_list_response_model.dart';
import '../model/get_user_response_model/get_user_response_model.dart';
import '../model/post_user_cloud_entity_model.dart';
import '../model/post_user_verification_cloud_response/post_user_verification_cloud_response.dart';
import '../model/prescription_view_response/prescription_view_response.dart';
import '../model/recent_appointment_response_model/recent_appointment_response_model.dart';
import '../model/reschedule_booking_entity_model.dart';
import '../model/search_doctor_entity_model.dart';
import '../model/searched_medicine_response_model/searched_medicine_response_model.dart';
import '../model/send_message_response_model/send_message_response_model.dart';
import '../model/update_password_entity_model.dart';
import '../model/user_search_response_model/user_search_response_model.dart';

class DocViewModel extends BaseViewModel {
  final BuildContext? context;
  final logger = getLogger('DocViewModel');

  final repositoryImply = DocRepoImpl();
  final session = locator<SharedPreferencesService>();
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  bool _isLoadingMessageIndex = false;
  bool get isLoadingMessageIndex => _isLoadingMessageIndex;
  bool _isLoadingUserSearch = false;
  bool get isLoadingUserSearch => _isLoadingUserSearch;
  bool _isLoadingMedSearch = false;
  bool get isLoadingMedSearch => _isLoadingMedSearch;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyReschedule = GlobalKey<FormState>();
  GlobalKey<FormState> presFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> presMedsFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKeySave = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyWithdraw = GlobalKey<FormState>();

  GetDocDetailResponseModel? _getDocDetailResponseModel;
  GetDocDetailResponseModel? get getDocDetailResponseModel =>
      _getDocDetailResponseModel;

  PostUserVerificationCloudResponse? _postUserVerificationCloudResponse;
  PostUserVerificationCloudResponse? get postUserVerificationCloudResponse =>
      _postUserVerificationCloudResponse;
  final _pickImage = ImagePickerHandler();
  File? image;
  String? filename;
  List<Availability> availabilities = [];

  GetMessageIndexResponseModelList? _getMessageIndexResponseModelList;
  GetMessageIndexResponseModelList? get getMessageIndexResponseModelList =>
      _getMessageIndexResponseModelList;
  ReceivedMessageResponseModelList? _receivedMessageResponseModelList;
  ReceivedMessageResponseModelList? get receivedMessageResponseModelList =>
      _receivedMessageResponseModelList;

  SendMessageResponseModel? _sendMessageResponseModel;
  SendMessageResponseModel? get sendMessageResponseModel =>
      _sendMessageResponseModel;
  GetPrescriptionListResponseModelList? _getPrescriptionListResponseModelList;
  GetPrescriptionListResponseModelList?
  get getPrescriptionListResponseModelList =>
      _getPrescriptionListResponseModelList;

  CallTokenGenerateResponseModel? _callTokenGenerateResponseModel;
  CallTokenGenerateResponseModel? get callTokenGenerateResponseModel =>
      _callTokenGenerateResponseModel;
  GetDoctorsWalletResponseModel? _getDoctorsWalletResponseModel;
  GetDoctorsWalletResponseModel? get getDoctorsWalletResponseModel =>
      _getDoctorsWalletResponseModel;
  DocPatientListResponseModelList? _docPatientListResponseModelList;
  DocPatientListResponseModelList? get docPatientListResponseModelList =>
      _docPatientListResponseModelList;
  PrescriptionViewResponse? _prescriptionViewResponse;
  PrescriptionViewResponse? get prescriptionViewResponse =>
      _prescriptionViewResponse;
  BankSaveResponseModel? get bankSaveResponseModel => _bankSaveResponseModel;
  BankSaveResponseModel? _bankSaveResponseModel;

  RtcEngine? engine;

  dynamic remoteUidGlobal;
  dynamic remoteUidGlobalLocal;

  bool localUserJoined = false;

  bool onSwitch = false;
  bool onToggleMic = false;
  List<GetListOfDoctorsAppointmentModel>?
  getListOfCompletedAppointmentModelList = [];
  List<GetListOfDoctorsAppointmentModel>?
  getListOfCancelledAppointmentModelList = [];
  List<GetListOfDoctorsAppointmentModel>?
  getListOfScheduledAppointmentModelList = [];

  GetListOfDoctorsAppointmentModelList? _getListOfDoctorsAppointmentModelList;
  GetListOfDoctorsAppointmentModelList?
  get getListOfDoctorsAppointmentModelList =>
      _getListOfDoctorsAppointmentModelList;
  GetDoctorStatisticModel? _getDoctorStatisticModel;
  GetDoctorStatisticModel? get getDoctorStatisticModel =>
      _getDoctorStatisticModel;
  GetUserResponseModel? _getUserResponseModel;
  GetUserResponseModel? get getUserResponseModel => _getUserResponseModel;
  final debouncer = Debouncer();
  RecentAppointmentResponseModelList? _recentAppointmentResponseModelList;
  RecentAppointmentResponseModelList? get recentAppointmentResponseModelList =>
      _recentAppointmentResponseModelList;
  UserSearchResponseModelList? _userSearchResponseModelList;
  UserSearchResponseModelList? get userSearchResponseModelList =>
      _userSearchResponseModelList;
  SearchedMedicineResponseModelList? _searchedMedResponseModelList;
  SearchedMedicineResponseModelList? get searchedMedResponseModelList =>
      _searchedMedResponseModelList;
  GetDoctorsAnalysisModel? _getDoctorsAnalysisModel;
  GetDoctorsAnalysisModel? get getDoctorsAnalysisModel =>
      _getDoctorsAnalysisModel;

  String query = '';
  String queryPatient = '';
  String queryBank = '';

  DocViewModel({this.context});

  String? availabilityDate;

  TimeOfDay _timeStart = TimeOfDay(hour: 00, minute: 00);
  TimeOfDay get timeStart => _timeStart;
  TimeOfDay _timeEnd = TimeOfDay(hour: 00, minute: 00);
  TimeOfDay get timeEnd => _timeEnd;

  TimeOfDay? selectedTime;
  TextEditingController sendtextController = TextEditingController(text: '');
  TextEditingController amountTextController = TextEditingController();

  bool hasLoadedConversation = false;
  bool hasLoadedIndexConversation = false;

  List<SendMessageEntityModel> sendList = [];

  ScrollController scrollController1 = ScrollController();

  DateTime now = DateTime.now();

  TextEditingController patientNameTextController = TextEditingController();
  TextEditingController patientConditionTextController =
      TextEditingController();
  TextEditingController reasonController = TextEditingController();

  TextEditingController medicationTextController = TextEditingController();
  TextEditingController dosageTextController = TextEditingController();
  TextEditingController frequencyTextController = TextEditingController();
  TextEditingController noteTextController = TextEditingController();
  TextEditingController accountNumberTextController = TextEditingController();
  TextEditingController bankCodeTextController = TextEditingController();
  UserSearchResponseModel? _searchedUser;
  SearchedMedicineResponseModel? _searchedMeds;
  String presFrequency = '';
  String? bankCode;

  bool get isTogglePassword => _isTogglePassword;
  bool _isTogglePassword = false;
  AvailableSlots? _slot;

  returnMonthText(text) {
    switch (text) {
      case 'January':
        return 'Jan';
      case 'February':
        return 'Feb';
      case 'March':
        return 'Mar';
      case 'April':
        return 'Apr';
      case 'May':
        return 'May';
      case 'June':
        return 'Jun';
      case 'July':
        return 'Jul';
      case 'August':
        return 'Aug';
      case 'September':
        return 'Sep';
      case 'October':
        return 'Oct';
      case 'November':
        return 'Nov';
      case 'December':
        return 'Dec';
      default:
        return text; // or throw an error if you prefer
    }
  }

  bool isOnTogglePassword() {
    _isTogglePassword = !_isTogglePassword;
    notifyListeners();
    return _isTogglePassword;
  }

  onToggleMicrophone() {
    if (onToggleMic == false) {
      onToggleMic = true;
      engine?.muteLocalAudioStream(false);
    } else {
      onToggleMic = false;
      engine?.muteLocalAudioStream(true);
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

  Map<String, String> formatTimeOfDay12(TimeOfDay time) {
    final now = DateTime.now();
    final dateTime = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );

    return {
      '24Hour': DateFormat.jm().format(dateTime), // e.g. "8:45 AM"
    };
  }

  Map<String, String> formatTimeOfDay24(TimeOfDay time) {
    final now = DateTime.now();
    final dateTime = DateTime(
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
    );

    return {
      '24Hour': DateFormat.Hm().format(dateTime), // e.g. "08:45"
    };
  }

  String convertTo12Hour(String time24) {
    // Parse "17:00" into DateTime
    final DateFormat inputFormat = DateFormat.Hm(); // "HH:mm"
    final DateTime dateTime = inputFormat.parse(time24);

    // Format to 12-hour time with AM/PM
    final DateFormat outputFormat = DateFormat.jm(); // "h:mm a"
    return outputFormat.format(dateTime); // e.g., "5:00 PM"
  }

  void _selectTimeStart(context) async {
    TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _timeStart,
    );
    if (newTime != null) {
      _timeStart = newTime;
    }
    notifyListeners();
  }

  void _selectTimeEnd(context) async {
    TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _timeEnd,
    );
    if (newTime != null) {
      _timeEnd = newTime;
    }
    notifyListeners();
  }

  void openCalendarDialog(BuildContext context, {VoidCallback? add}) {
    showDialog(
      context: context,
      builder: (context) {
        DateTime selectedDate = DateTime.now();

        return ViewModelBuilder<DocViewModel>.reactive(
          viewModelBuilder: () => locator<DocViewModel>(),
          onViewModelReady: (model) {},
          disposeViewModel: false,
          builder: (_, DocViewModel model, __) {
            return AlertDialog(
              title: Text("Select a Date"),
              content: SizedBox(
                height: 600,
                width: double.maxFinite,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Card(
                        elevation: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CalendarDatePicker(
                            initialDate: selectedDate,
                            firstDate: selectedDate,
                            lastDate: DateTime(2100),
                            onDateChanged: (DateTime date) {
                              availabilityDate = DateFormat(
                                'yyyy-MM-dd',
                              ).format(date);
                              notifyListeners();
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _selectTimeStart(context);
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 4.w,
                                horizontal: 10.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: AppColor.darkindgrey),
                              ),

                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    text: 'Select Start Time',
                                    textStyle: GoogleFonts.gabarito(
                                      color: AppColor.darkindgrey,
                                      fontSize: 14.20.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: AppColor.darkindgrey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          TextView(
                            text: _timeStart.format(context),
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.black,
                              fontSize: 16.20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _selectTimeEnd(context);
                              notifyListeners();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 4.w,
                                horizontal: 10.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: AppColor.darkindgrey),
                              ),

                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    text: 'Select End Time',
                                    textStyle: GoogleFonts.gabarito(
                                      color: AppColor.darkindgrey,
                                      fontSize: 14.20.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: AppColor.darkindgrey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          TextView(
                            text: _timeEnd.format(context),
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.black,
                              fontSize: 16.20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h),
                      Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                          onTap: add,
                          child: Container(
                            width: 100,
                            padding: EdgeInsets.symmetric(
                              vertical: 6.w,
                              horizontal: 10.w,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: AppColor.darkindgrey,
                              border: Border.all(color: AppColor.white),
                            ),

                            child: TextView(
                              text: 'Apply',
                              textAlign: TextAlign.center,
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.white,
                                fontSize: 18.20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Future<void> getUserDetail(context, {String? id}) async {
    try {
      _isLoading = true;
      _getUserResponseModel = await runBusyFuture(
        repositoryImply.getUserDetail(id!),
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

  Future<void> getDoctorsDetail(context) async {
    try {
      _isLoading = true;
      _getDocDetailResponseModel = await runBusyFuture(
        repositoryImply.getDoctorDetail(),
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

  Future<void> getDoctorsAnalysis(context) async {
    try {
      _isLoading = true;
      _getDoctorsAnalysisModel = await runBusyFuture(
        repositoryImply.doctorsAnalytics(),
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

  void updateDoctorsDetail(
    context, {
    UpdateDoctorEntityModel? update,
    String? id,
  }) async {
    try {
      loadingDialog(context);
      var v = await runBusyFuture(
        repositoryImply.updateDoctor(id!, updateDoctor: update),
        throwException: true,
      );
      if (v['message'] == 'Account Updated Successfully!') {
        Navigator.pop(context);
        await AppUtils.snackbar(context, message: v['message']);
        navigate.navigateTo(Routes.docDashboard);
      }
    } catch (e) {
      Navigator.pop(context);
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  void setDoctorsAvailabilty(
    context, {
    DoctorAvailabilityEntityModel? availability,
    String? id,
  }) async {
    try {
      loadingDialog(context);
      var v = await runBusyFuture(
        repositoryImply.doctorsAvailability(id!, availability: availability),
        throwException: true,
      );
      if (v['message'] == 'Availability updated successfully.') {
        Navigator.pop(context);
        Future.delayed(Duration(seconds: 2), () {
          navigate.navigateTo(Routes.docDashboard);
          AppUtils.snackbar(context, message: v['message']);
          availabilities.clear();
        });
      }
    } catch (e) {
      Navigator.pop(context);
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

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

  Future<void> getDoctorsAppointment() async {
    try {
      _isLoading = true;
      _getListOfDoctorsAppointmentModelList = await runBusyFuture(
        repositoryImply.doctorsAppointment(),
        throwException: true,
      );
      getListOfCancelledAppointmentModelList?.clear();
      getListOfCompletedAppointmentModelList?.clear();
      getListOfScheduledAppointmentModelList?.clear();

      List<GetListOfDoctorsAppointmentModel>? appointmentList = [];
      for (var element
          in _getListOfDoctorsAppointmentModelList!
              .getListOfDoctorsAppointments!) {
        appointmentList.add(element);
        notifyListeners();
      }

      groupBy(appointmentList, (GetListOfDoctorsAppointmentModel o) {
        if (o.status?.toLowerCase() == 'cancelled') {
          getListOfCancelledAppointmentModelList!.add(o);
        }
        if (o.status?.toLowerCase() == 'completed') {
          getListOfCompletedAppointmentModelList!.add(o);
        }
        if (o.status?.toLowerCase() == 'scheduled') {
          getListOfScheduledAppointmentModelList!.add(o);
        }
        if (o.status?.toLowerCase() == 'rescheduled') {
          getListOfScheduledAppointmentModelList!.add(o);
        }
      });
      notifyListeners();
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
    }
    notifyListeners();
  }

  Future<void> getDoctorsAppointmentReload() async {
    try {
      _getListOfDoctorsAppointmentModelList = await runBusyFuture(
        repositoryImply.doctorsAppointment(),
        throwException: true,
      );
      getListOfCancelledAppointmentModelList?.clear();
      getListOfCompletedAppointmentModelList?.clear();
      getListOfScheduledAppointmentModelList?.clear();

      List<GetListOfDoctorsAppointmentModel>? appointmentList = [];
      for (var element
          in _getListOfDoctorsAppointmentModelList!
              .getListOfDoctorsAppointments!) {
        appointmentList.add(element);
        notifyListeners();
      }

      groupBy(appointmentList, (GetListOfDoctorsAppointmentModel o) {
        if (o.status?.toLowerCase() == 'cancelled') {
          getListOfCancelledAppointmentModelList!.add(o);
        }
        if (o.status?.toLowerCase() == 'completed') {
          getListOfCompletedAppointmentModelList!.add(o);
        }
        if (o.status?.toLowerCase() == 'scheduled') {
          getListOfScheduledAppointmentModelList!.add(o);
        }
        if (o.status?.toLowerCase() == 'rescheduled') {
          getListOfScheduledAppointmentModelList!.add(o);
        }
      });
      notifyListeners();
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
    }
    notifyListeners();
  }

  Future<void> getChatIndex() async {
    try {
      _isLoadingMessageIndex = true;
      _getMessageIndexResponseModelList = await runBusyFuture(
        repositoryImply.chatIndex(),
        throwException: true,
      );
      _isLoadingMessageIndex = false;
    } catch (e) {
      _isLoadingMessageIndex = false;
      logger.d(e);
    }
    notifyListeners();
  }

  Future<void> userSearch(String query) async {
    try {
      _isLoadingUserSearch = true;
      _userSearchResponseModelList = await runBusyFuture(
        repositoryImply.userSearch(query),
        throwException: true,
      );
      _isLoadingUserSearch = false;
    } catch (e) {
      _isLoadingUserSearch = false;
      logger.d(e);
    }
    notifyListeners();
  }

  Future<void> doctorWallet() async {
    try {
      _isLoading = true;
      _getDoctorsWalletResponseModel = await runBusyFuture(
        repositoryImply.doctorsWallet(),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
    }
    notifyListeners();
  }

  Future<void> doctorWalletReload() async {
    try {
      _getDoctorsWalletResponseModel = await runBusyFuture(
        repositoryImply.doctorsWallet(),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
    }
    notifyListeners();
  }

  Future<void> doctorsAppointmentReschedule(
    context, {
    String? id,
    RescheduleBookingEntityModel? reschedule,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.doctorsAppointmentReschedule(
          id: id,
          reschedule: reschedule,
        ),
        throwException: true,
      );
      _isLoading = false;
      reasonController.clear();
      await AppUtils.snackbar(context, message: '${v['message']}');
      await getDoctorsAppointment();
      Navigator.of(context).pop();
    } catch (e) {
      _isLoading = false;
      await AppUtils.snackbar(context, message: e.toString(), error: true);
      Navigator.of(context).pop();
    }
    notifyListeners();
  }

  Future<void> doctorsAppointmentUpdate(
    context, {
    String? id,
    UpdateStatusReasonEntityModel? update,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.doctorsAppointmentUpdate(id: id, update: update),
        throwException: true,
      );
      _isLoading = false;
      reasonController.clear();
      await AppUtils.snackbar(context, message: '${v['message']}');
      getDoctorsAppointment();
      Navigator.of(context).pop();
    } catch (e) {
      _isLoading = false;
      await AppUtils.snackbar(context, message: e.toString(), error: true);
      Navigator.of(context).pop();
    }
    notifyListeners();
  }

  Future<void> doctorsAppointmentCompleteUpdate(
    context, {
    String? id,
    UpdateStatusReasonEntityModel? update,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.doctorsAppointmentUpdate(id: id, update: update),
        throwException: true,
      );
      _isLoading = false;
      await AppUtils.snackbar(context, message: '${v['message']}');
      getDoctorsAppointment();
    } catch (e) {
      _isLoading = false;
      await AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }

  Future<void> getPatientsList() async {
    try {
      _isLoading = true;
      _docPatientListResponseModelList = await runBusyFuture(
        repositoryImply.getPatientsList(),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
    }
    notifyListeners();
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

  Future<void> updatePassword(UpdatePasswordEntityModel update) async {
    try {
      _isLoading = true;
      await runBusyFuture(
        repositoryImply.updatePassword(update),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
    }
    notifyListeners();
  }

  Future<void> getDoctorsStatistic() async {
    try {
      _isLoading = true;
      _getDoctorStatisticModel = await runBusyFuture(
        repositoryImply.getDoctorsStatistic(),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
    }
    notifyListeners();
  }

  Future<void> getRecentAppointment() async {
    try {
      _isLoading = true;
      _recentAppointmentResponseModelList = await runBusyFuture(
        repositoryImply.recentAppointment(),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
    }
    notifyListeners();
  }

  Future<void> getPrescriptionList() async {
    try {
      _isLoading = true;
      _getPrescriptionListResponseModelList = await runBusyFuture(
        repositoryImply.getPrescriptionList(),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
    }
    notifyListeners();
  }

  Future<void> getPrescriptionListReload() async {
    try {
      // _isLoading = true;
      _getPrescriptionListResponseModelList = await runBusyFuture(
        repositoryImply.getPrescriptionList(),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
    }
    notifyListeners();
  }

  Future<void> getPrescriptionView(String id) async {
    try {
      _isLoading = true;
      _prescriptionViewResponse = await runBusyFuture(
        repositoryImply.getPrescriptionView(id),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
    }
    notifyListeners();
  }

  Future<void> createPrescrition(
    context, {
    CreatePrescriptionEntityModel? create,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.createPrescrition(create!),
        throwException: true,
      );
      _isLoading = false;
      await AppUtils.snackbar(context, message: v['message']);
      Navigator.pop(context);
    } catch (e) {
      _isLoading = false;
      await AppUtils.snackbar(context, message: e.toString(), error: true);
      Navigator.pop(context);
      logger.d(e);
    }
    notifyListeners();
  }

  Future<dynamic> createMedicinePrescrition(
    context, {
    String? id,
    CreateAddMedicineEntityModel? create,
  }) async {
    try {
      _isLoading = true;
      var v = await runBusyFuture(
        repositoryImply.createMedicinePrescrition(create: create, id: id),
        throwException: true,
      );

      _isLoading = false;
      await AppUtils.snackbar(context, message: v['message']);
      Navigator.pop(context);
    } catch (e) {
      _isLoading = false;
      await AppUtils.snackbar(context, message: e.toString(), error: true);
      Navigator.pop(context);
      logger.d(e);
    }
    notifyListeners();
  }

  void getSearchedMed(context, {SearchDoctorEntityModel? searchEntity}) async {
    try {
      _isLoadingMedSearch = true;
      _searchedMedResponseModelList = await runBusyFuture(
        repositoryImply.getSearchedMedicine(searchEntity!),
        throwException: true,
      );

      _isLoadingMedSearch = false;
    } catch (e) {
      _isLoadingMedSearch = false;
      AppUtils.snackbarTop(
        context,
        message: "medication searched is not found on our system..!",
        error: true,
      );
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

  void logout() async {
    try {
      await runBusyFuture(repositoryImply.logout(), throwException: true);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
    }
    notifyListeners();
  }

  Future<void> receiveConversation(
    context, {
    String? id,
    GetMessageIndexResponseModel? messageModel,
    dynamic sender,
  }) async {
    try {
      _receivedMessageResponseModelList = await runBusyFuture(
        repositoryImply.receiveMessage(id!),
        throwException: true,
      );
      _isLoading = false;
      Future.delayed(Duration(seconds: 0), () async {
        if (hasLoadedConversation) {
          receiveConversation(
            context,
            id: id,
            messageModel: messageModel,
            sender: sender,
          );
        }
        await runBusyFuture(
          repositoryImply.readMessage(int.parse(id)),
          throwException: true,
        );

        Future.delayed(Duration(seconds: 3), () {
          session.chatsData = {'chat': []};
          sendList.clear();
        });
        if (_receivedMessageResponseModelList
                    ?.receivedMessageResponseModelList
                    ?.last
                    .message ==
                'video-call-agora' &&
            _receivedMessageResponseModelList
                    ?.receivedMessageResponseModelList
                    ?.last
                    .senderType ==
                "MydocLab\\Models\\User") {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder:
                  (context) => DocVidCallLookScreen(
                    conversationId: id,
                    messageModel: messageModel,
                    sender: sender,
                    image:
                        _receivedMessageResponseModelList
                            ?.receivedMessageResponseModelList
                            ?.last
                            .sender
                            ?.profileImage,
                    callId: _callTokenGenerateResponseModel?.callId.toString(),
                  ),
            ),
          );
          hasLoadedConversation = false;
        }
      });
    } catch (e) {
      _isLoading = false;
      logger.d(e);
    }
    notifyListeners();
  }

  void receiveConversationOnce(
    context, {
    String? id,
    GetMessageIndexResponseModel? messageModel,
    dynamic sender,
  }) async {
    if (hasLoadedConversation == false) {
      return;
    } else {
      hasLoadedConversation = true;
      await receiveConversation(
        context,
        id: id,
        messageModel: messageModel,
        sender: sender,
      );

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

  setMessage(message) {
    if (message == 'video-call-agora') {
      return 'Video Call';
    }
    if (message == 'accept-call-agora') {
      return 'Video Call';
    }
    if (message == 'reject-call-agora') {
      return 'Ignored Call';
    }
    return message;
  }

  boxMessage(context, {ReceivedMessageResponseModel? message}) => Column(
    children: [
      message?.senderType == "MydocLab\\Models\\User"
          ? Align(
            alignment: Alignment.topLeft,
            child:
                message?.message == 'video-call-agora'
                    ? Container(
                      width: 160.w,
                      margin: EdgeInsets.only(
                        left: 20.w,
                        right: 100.w,
                        bottom: 20.w,
                      ),

                      padding: EdgeInsets.symmetric(
                        vertical: 4.w,
                        horizontal: 4.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(10),
                        ),
                        color: AppColor.primary1.withOpacity(.1),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(1.w),
                        padding: EdgeInsets.all(3.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.primary.withOpacity(.2),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 2.w),
                              padding: EdgeInsets.all(6.0.w),
                              decoration: BoxDecoration(
                                color: AppColor.darkindgrey.withOpacity(.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.video_call_outlined,
                                size: 16.20.sp,
                                color: AppColor.darkindgrey,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'Video call',
                                  textStyle: GoogleFonts.dmSans(
                                    fontSize: 14.2.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.darkindgrey,
                                  ),
                                ),
                                TextView(
                                  text: DateFormat('hh:mma').format(
                                    DateTime.parse(
                                      message!.updatedAt.toString(),
                                    ).toLocal(),
                                  ),
                                  textStyle: GoogleFonts.dmSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.darkindgrey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                    : message?.message == 'accept-call-agora'
                    ? Container(
                      width: 160.w,
                      margin: EdgeInsets.only(
                        left: 20.w,
                        right: 100.w,
                        bottom: 20.w,
                      ),

                      padding: EdgeInsets.symmetric(
                        vertical: 4.w,
                        horizontal: 4.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(10),
                        ),
                        color: AppColor.primary1.withOpacity(.1),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(1.w),
                        padding: EdgeInsets.all(3.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.primary.withOpacity(.2),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 2.w),
                              padding: EdgeInsets.all(6.0.w),
                              decoration: BoxDecoration(
                                color: AppColor.darkindgrey.withOpacity(.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.video_call_outlined,
                                size: 16.20.sp,
                                color: AppColor.darkindgrey,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'Call ended',
                                  textStyle: GoogleFonts.dmSans(
                                    fontSize: 14.2.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.darkindgrey,
                                  ),
                                ),
                                TextView(
                                  text: DateFormat('hh:mma').format(
                                    DateTime.parse(
                                      message!.updatedAt.toString(),
                                    ).toLocal(),
                                  ),
                                  textStyle: GoogleFonts.dmSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.darkindgrey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                    : message?.message == 'reject-call-agora'
                    ? Container(
                      width: 160.w,
                      margin: EdgeInsets.only(
                        left: 20.w,
                        right: 100.w,
                        bottom: 20.w,
                      ),

                      padding: EdgeInsets.symmetric(
                        vertical: 4.w,
                        horizontal: 4.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(10),
                        ),
                        color: AppColor.primary1.withOpacity(.1),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(1.w),
                        padding: EdgeInsets.all(3.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.primary.withOpacity(.2),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 2.w),
                              padding: EdgeInsets.all(6.0.w),
                              decoration: BoxDecoration(
                                color: AppColor.darkindgrey.withOpacity(.1),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.video_call_outlined,
                                size: 16.20.sp,
                                color: AppColor.darkindgrey,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'Ignored call',
                                  textStyle: GoogleFonts.dmSans(
                                    fontSize: 14.2.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.darkindgrey,
                                  ),
                                ),
                                TextView(
                                  text: DateFormat('hh:mma').format(
                                    DateTime.parse(
                                      message!.updatedAt.toString(),
                                    ).toLocal(),
                                  ),
                                  textStyle: GoogleFonts.dmSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.darkindgrey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                    : Container(
                      margin: EdgeInsets.only(
                        left: 20.w,
                        right: 100.w,
                        bottom: 20.w,
                      ),

                      padding: EdgeInsets.symmetric(
                        vertical: 4.w,
                        horizontal: 10.w,
                      ),
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
                            text: message?.message ?? '',
                            textStyle: GoogleFonts.dmSans(
                              fontSize: 15.2.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColor.darkindgrey,
                            ),
                          ),
                          TextView(
                            text: DateFormat('hh:mma').format(
                              DateTime.parse(
                                message!.updatedAt.toString(),
                              ).toLocal(),
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
            child:
                message?.message == 'video-call-agora'
                    ? Container(
                      width: 160.w,
                      margin: EdgeInsets.only(
                        right: 20.w,
                        left: 100.w,
                        bottom: 20.w,
                      ),

                      padding: EdgeInsets.symmetric(
                        vertical: 4.w,
                        horizontal: 4.0.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(0),
                        ),
                        color: AppColor.primary1,
                      ),
                      child: Container(
                        margin: EdgeInsets.all(1.w),
                        padding: EdgeInsets.all(3.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.white.withOpacity(.2),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 2.w),
                              padding: EdgeInsets.all(6.0.w),
                              decoration: BoxDecoration(
                                color: AppColor.white.withOpacity(.3),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.video_call_outlined,
                                size: 16.20.sp,
                                color: AppColor.white,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'Video call',
                                  textStyle: GoogleFonts.dmSans(
                                    fontSize: 14.2.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.white,
                                  ),
                                ),
                                TextView(
                                  text: DateFormat('hh:mma').format(
                                    DateTime.parse(
                                      message!.updatedAt.toString(),
                                    ).toLocal(),
                                  ),
                                  textStyle: GoogleFonts.dmSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                    : message?.message == 'accept-call-agora'
                    ? Container(
                      width: 160.w,
                      margin: EdgeInsets.only(
                        right: 20.w,
                        left: 100.w,
                        bottom: 20.w,
                      ),

                      padding: EdgeInsets.symmetric(
                        vertical: 4.w,
                        horizontal: 4.0.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(0),
                        ),
                        color: AppColor.primary1,
                      ),
                      child: Container(
                        margin: EdgeInsets.all(1.w),
                        padding: EdgeInsets.all(3.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.white.withOpacity(.2),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 2.w),
                              padding: EdgeInsets.all(6.0.w),
                              decoration: BoxDecoration(
                                color: AppColor.white.withOpacity(.3),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.video_call_outlined,
                                size: 16.20.sp,
                                color: AppColor.white,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'Call ended',
                                  textStyle: GoogleFonts.dmSans(
                                    fontSize: 14.2.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.white,
                                  ),
                                ),
                                TextView(
                                  text: DateFormat('hh:mma').format(
                                    DateTime.parse(
                                      message!.updatedAt.toString(),
                                    ).toLocal(),
                                  ),
                                  textStyle: GoogleFonts.dmSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                    : message?.message == 'reject-call-agora'
                    ? Container(
                      width: 160.w,
                      margin: EdgeInsets.only(
                        right: 20.w,
                        left: 100.w,
                        bottom: 20.w,
                      ),

                      padding: EdgeInsets.symmetric(
                        vertical: 4.w,
                        horizontal: 4.0.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(0),
                        ),
                        color: AppColor.primary1,
                      ),
                      child: Container(
                        margin: EdgeInsets.all(1.w),
                        padding: EdgeInsets.all(3.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.white.withOpacity(.2),
                        ),
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 2.w),
                              padding: EdgeInsets.all(6.0.w),
                              decoration: BoxDecoration(
                                color: AppColor.white.withOpacity(.3),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.video_call_outlined,
                                size: 16.20.sp,
                                color: AppColor.white,
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'Ignored call',
                                  textStyle: GoogleFonts.dmSans(
                                    fontSize: 14.2.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.white,
                                  ),
                                ),
                                TextView(
                                  text: DateFormat('hh:mma').format(
                                    DateTime.parse(
                                      message!.updatedAt.toString(),
                                    ).toLocal(),
                                  ),
                                  textStyle: GoogleFonts.dmSans(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColor.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                    : Container(
                      margin: EdgeInsets.only(
                        right: 20.w,
                        left: 100.w,
                        bottom: 20.w,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 4.w,
                        horizontal: 10.w,
                      ),
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
                            text: message?.message ?? '',
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
                                    message!.updatedAt.toString(),
                                  ).toLocal(),
                                ),
                                textStyle: GoogleFonts.dmSans(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.white,
                                ),
                              ),
                              SizedBox(width: 4.w),
                              Icon(
                                Icons.check,
                                color: AppColor.white,
                                size: 14.sp,
                              ),
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

  Future<void> generateToken(
    context, {
    CallTokenGenerateEntityModel? calltoken,
  }) async {
    try {
      _callTokenGenerateResponseModel = await runBusyFuture(
        repositoryImply.generateToken(calltoken!),
        throwException: true,
      );
      logger.d("message::${_callTokenGenerateResponseModel?.toJson()}");
      initializeAgoraVoiceSDK();

      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
    }
    notifyListeners();
  }

  Future<void> acceptCall(int id) async {
    try {
      await runBusyFuture(repositoryImply.acceptCall(id), throwException: true);
    } catch (e) {
      logger.d(e);
    }
    notifyListeners();
  }

  Future<void> rejectCall(int id) async {
    try {
      await runBusyFuture(repositoryImply.rejectCall(id), throwException: true);
    } catch (e) {
      logger.d(e);
    }
    notifyListeners();
  }

  Future<void> endCall(int id) async {
    try {
      await runBusyFuture(repositoryImply.endCall(id), throwException: true);
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
          print('uuuuuuu0Doctor:${remoteUidGlobal.toString()}');
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
    GetListOfDoctorsAppointmentModel? app,
    GetMessageIndexResponseModel? messageModel,
    dynamic sender,
  }) async {
    if (sendtextController.text != '') {
      String msg = sendtextController.text;
      Future.delayed(Duration(seconds: 0), () {
        sendtextController.clear();
      });
      if (app == null) {
        await sendMessage(
          SendMessageEntityModel(
            conversationId: int.parse(
              '${messageModel!.conversationId ?? sender['conversation_id']}',
            ),
            receiverId: int.parse(
              '${messageModel.contactId ?? sender['sender_id']}',
            ),
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

  Color getAppColor(String app) {
    if (app == 'scheduled') {
      return AppColor.grey;
    } else if (app == 'canceled') {
      return AppColor.red;
    }
    return AppColor.darkindgrey;
  }

  String getAppStatusText(String app) {
    if (app == 'scheduled') {
      return 'Upcoming';
    } else if (app == 'canceled') {
      return 'Canceled';
    }
    return 'Completed';
  }

  void modalBottomSheetCreatePrescription(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Enables full-screen dragging
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (builder) {
        // final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: DraggableScrollableSheet(
                expand: false,
                initialChildSize: 0.49, // 50% of screen height
                minChildSize: 0.3, // Can be dragged to 30% of screen height
                maxChildSize: 0.7, // Can be dragged to 90% of screen height
                builder: (context, scrollController) {
                  return ViewModelBuilder<DocViewModel>.reactive(
                    viewModelBuilder: () => DocViewModel(),
                    onViewModelReady: (model) {},
                    disposeViewModel: false,
                    onDispose: (viewModel) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        patientNameTextController.clear();
                        patientConditionTextController.clear();
                      });
                    },
                    builder: (_, DocViewModel model, __) {
                      return SingleChildScrollView(
                        padding: EdgeInsets.only(left: 12.w, right: 24.w),
                        controller: scrollController,
                        child: Form(
                          key: presFormKey,
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
                                text: 'Create New Prescription',
                                textStyle: TextStyle(
                                  color: AppColor.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 20.h),
                              TextFormWidget(
                                label: 'Patient Name',
                                labelStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.primary1,
                                ),
                                border: 10,
                                isFilled: true,
                                fillColor: AppColor.white,
                                controller: patientNameTextController,
                                prefixWidget:
                                    model.isLoadingUserSearch
                                        ? SizedBox(
                                          width: 10.w,
                                          height: 10.h,
                                          child: SpinKitDualRing(
                                            color: AppColor.darkindgrey,
                                            size: 10.sp,
                                          ),
                                        )
                                        : Padding(
                                          padding: EdgeInsets.all(14.w),
                                          child: SvgPicture.asset(
                                            AppImage.search,
                                            height: 20.h,
                                            width: 20.w,
                                          ),
                                        ),
                                onChange: (p0) {
                                  model.debouncer.run(() {
                                    model.query = p0;
                                    model.userSearch(p0);
                                  });
                                  model.notifyListeners();
                                },
                                validator: AppValidator.validateString(),
                              ),
                              SizedBox(
                                height:
                                    model.userSearchResponseModelList != null &&
                                            model.query != ''
                                        ? 10.h
                                        : 0.h,
                              ),
                              if (model.userSearchResponseModelList != null &&
                                  model
                                      .userSearchResponseModelList!
                                      .userSearchResponseModelList!
                                      .isNotEmpty &&
                                  model.query != '')
                                ConstrainedBox(
                                  constraints: BoxConstraints(maxHeight: 300),
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 15.20.w,
                                      horizontal: 20.w,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColor.primary1.withOpacity(.14),
                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ...model.userSearchResponseModelList!.userSearchResponseModelList!.map(
                                            (o) => Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    _searchedUser = o;
                                                    patientNameTextController
                                                            .text =
                                                        '${o.firstName?.capitalize()} ${o.lastName?.capitalize()}';
                                                    model
                                                        .userSearchResponseModelList!
                                                        .userSearchResponseModelList!
                                                        .clear();
                                                    model.notifyListeners();
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.all(
                                                      6.w,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            6.r,
                                                          ),
                                                      color: AppColor.white
                                                          .withOpacity(.5),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                          width: 160.w,
                                                          child: TextView(
                                                            text:
                                                                '${o.firstName?.capitalize()} ${o.lastName?.capitalize()}',
                                                            maxLines: 1,
                                                            textOverflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textStyle: TextStyle(
                                                              color:
                                                                  AppColor
                                                                      .darkindgrey,
                                                              fontSize:
                                                                  16.20.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ),
                                                        TextView(
                                                          text:
                                                              o.accountId ?? '',
                                                          maxLines: 1,
                                                          textOverflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                          textStyle: TextStyle(
                                                            color:
                                                                AppColor
                                                                    .darkindgrey,
                                                            fontSize: 14.20.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Divider(
                                                  color: AppColor.darkindgrey,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              SizedBox(height: 20.h),
                              TextFormWidget(
                                label: 'Patient\'s Condition',
                                labelStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.primary1,
                                ),
                                border: 10,
                                isFilled: true,
                                keyboardType: TextInputType.multiline,
                                alignLabelWithHint: true,
                                maxline: 4,
                                fillColor: AppColor.white,
                                controller: patientConditionTextController,
                                validator: AppValidator.validateString(),
                              ),
                              SizedBox(height: 20.h),

                              model.isLoading
                                  ? SpinKitCircle(
                                    color: AppColor.primary1,
                                    size: 34.sp,
                                  )
                                  : Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () => Navigator.pop(context),
                                        child: Container(
                                          padding: EdgeInsets.all(10.w),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            border: Border.all(
                                              color: AppColor.primary1,
                                            ),

                                            color: AppColor.white,
                                          ),
                                          width: 100.w,
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
                                      SizedBox(width: 20.w),
                                      GestureDetector(
                                        onTap: () {
                                          if (presFormKey.currentState!
                                              .validate()) {
                                            model.createPrescrition(
                                              context,
                                              create: CreatePrescriptionEntityModel(
                                                notes:
                                                    patientConditionTextController
                                                        .text
                                                        .trim(),
                                                userId:
                                                    _searchedUser!.accountId,
                                              ),
                                            );
                                          }
                                          model.notifyListeners();
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(10.w),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            color: AppColor.primary1,
                                          ),
                                          width: 80.w,
                                          child: TextView(
                                            text: 'Save',
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
                              SizedBox(height: 10.h),
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

  void modalBottomSheetAddMedsPrescription(context, {String? id}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Enables full-screen dragging
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (builder) {
        // final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: DraggableScrollableSheet(
                expand: false,
                initialChildSize: 0.5, // 50% of screen height
                minChildSize: 0.4, // Can be dragged to 30% of screen height
                maxChildSize: 0.7, // Can be dragged to 90% of screen height
                builder: (context, scrollController) {
                  return ViewModelBuilder<DocViewModel>.reactive(
                    viewModelBuilder: () => DocViewModel(),
                    onViewModelReady: (model) {},
                    disposeViewModel: false,
                    onDispose: (viewModel) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        medicationTextController.clear();
                        dosageTextController.clear();
                        frequencyTextController.clear();
                        noteTextController.clear();
                      });
                    },
                    builder: (_, DocViewModel model, __) {
                      return SingleChildScrollView(
                        padding: EdgeInsets.only(left: 12.w, right: 24.w),
                        controller: scrollController,
                        child: Form(
                          key: presMedsFormKey,
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
                                text: 'Add Prescription',
                                textStyle: TextStyle(
                                  color: AppColor.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 20.h),
                              TextFormWidget(
                                label: 'Search for Medication',
                                labelStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.primary1,
                                ),
                                border: 10,
                                isFilled: true,
                                fillColor: AppColor.white,
                                controller: medicationTextController,
                                prefixWidget:
                                    model.isLoadingMedSearch
                                        ? SizedBox(
                                          width: 10.w,
                                          height: 10.h,
                                          child: SpinKitDualRing(
                                            color: AppColor.darkindgrey,
                                            size: 10.sp,
                                          ),
                                        )
                                        : Padding(
                                          padding: EdgeInsets.all(14.w),
                                          child: SvgPicture.asset(
                                            AppImage.search,
                                            height: 20.h,
                                            width: 20.w,
                                          ),
                                        ),
                                onChange: (p0) {
                                  model.debouncer.run(() {
                                    model.query = p0;
                                    model.getSearchedMed(
                                      context,
                                      searchEntity: SearchDoctorEntityModel(
                                        query: p0,
                                      ),
                                    );
                                  });
                                  model.notifyListeners();
                                },
                                validator: AppValidator.validateString(),
                              ),
                              SizedBox(
                                height:
                                    model.searchedMedResponseModelList !=
                                                null &&
                                            model.query != ''
                                        ? 10.h
                                        : 0.h,
                              ),
                              if (model.searchedMedResponseModelList != null &&
                                  model
                                      .searchedMedResponseModelList!
                                      .searchedMedicineResponseModelList!
                                      .isNotEmpty &&
                                  model.query != '')
                                ConstrainedBox(
                                  constraints: BoxConstraints(maxHeight: 300),
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 15.20.w,
                                      horizontal: 20.w,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColor.primary1.withOpacity(.14),
                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (model.searchedMedResponseModelList !=
                                                  null &&
                                              model
                                                  .searchedMedResponseModelList!
                                                  .searchedMedicineResponseModelList!
                                                  .isEmpty)
                                            TextView(
                                              text: 'Drug not Available',
                                              maxLines: 1,
                                              textOverflow:
                                                  TextOverflow.ellipsis,
                                              textStyle: TextStyle(
                                                color: AppColor.darkindgrey,
                                                fontSize: 16.20.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ...model.searchedMedResponseModelList!.searchedMedicineResponseModelList!.map(
                                            (o) => Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    _searchedMeds = o;
                                                    medicationTextController
                                                            .text =
                                                        '${o.name?.capitalize()}';
                                                    model
                                                        .searchedMedResponseModelList!
                                                        .searchedMedicineResponseModelList!
                                                        .clear();
                                                    model.notifyListeners();
                                                  },
                                                  child: Container(
                                                    padding: EdgeInsets.all(
                                                      6.w,
                                                    ),
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            6.r,
                                                          ),
                                                      color: AppColor.white
                                                          .withOpacity(.5),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                          width: 160.w,
                                                          child: TextView(
                                                            text:
                                                                '${o.name?.capitalize()}',
                                                            maxLines: 1,
                                                            textOverflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textStyle: TextStyle(
                                                              color:
                                                                  AppColor
                                                                      .darkindgrey,
                                                              fontSize:
                                                                  16.20.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ),
                                                        TextView(
                                                          text: o.volume ?? '',
                                                          maxLines: 1,
                                                          textOverflow:
                                                              TextOverflow
                                                                  .ellipsis,
                                                          textStyle: TextStyle(
                                                            color:
                                                                AppColor
                                                                    .darkindgrey,
                                                            fontSize: 13.20.sp,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Divider(
                                                  color: AppColor.darkindgrey,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              SizedBox(height: 20.h),
                              TextFormWidget(
                                label: 'Dosage',
                                labelStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.primary1,
                                ),
                                border: 10,
                                isFilled: true,
                                keyboardType: TextInputType.number,
                                fillColor: AppColor.white,
                                controller: dosageTextController,
                                validator: AppValidator.validateString(),
                              ),
                              SizedBox(height: 20.h),
                              TextFormWidget(
                                label: 'Frequency',
                                labelStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.primary1,
                                ),
                                readOnly: true,
                                border: 10,
                                isFilled: true,
                                fillColor: AppColor.white,
                                controller: frequencyTextController,
                                suffixWidget: PopupMenuButton<String>(
                                  onSelected: (String item) {
                                    // Handle the selected menu item
                                  },
                                  itemBuilder: (BuildContext context) {
                                    return [
                                      PopupMenuItem<String>(
                                        value: 'daily',
                                        child: TextView(
                                          text: 'Daily',
                                          textStyle: GoogleFonts.gabarito(
                                            color: AppColor.darkindgrey,
                                            fontSize: 15.40.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        onTap: () {
                                          presFrequency = 'daily';
                                          frequencyTextController.text =
                                              'Daily';
                                          model.notifyListeners();
                                        },
                                      ),
                                      PopupMenuItem<String>(
                                        value: 'weekly',
                                        child: TextView(
                                          text: 'Weekly',
                                          textStyle: GoogleFonts.gabarito(
                                            color: AppColor.darkindgrey,
                                            fontSize: 15.40.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        onTap: () {
                                          presFrequency = 'weekly';
                                          frequencyTextController.text =
                                              'Weekly';
                                          model.notifyListeners();
                                        },
                                      ),
                                    ];
                                  },
                                  child: Icon(
                                    Icons.arrow_drop_down_sharp,
                                    size: 30.sp,
                                    color: AppColor.darkindgrey,
                                  ), // Optional: Customize the button's icon
                                ),
                                validator: AppValidator.validateString(),
                              ),
                              SizedBox(height: 20.h),
                              TextFormWidget(
                                label: 'Note (Optional)',
                                labelStyle: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.primary1,
                                ),
                                border: 10,
                                isFilled: true,
                                keyboardType: TextInputType.multiline,
                                alignLabelWithHint: true,
                                maxline: 4,
                                fillColor: AppColor.white,
                                controller: noteTextController,
                                validator: AppValidator.validateString(),
                              ),
                              SizedBox(height: 20.h),

                              model.isLoading
                                  ? SpinKitCircle(
                                    color: AppColor.primary1,
                                    size: 34.sp,
                                  )
                                  : Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      GestureDetector(
                                        onTap: () => Navigator.pop(context),
                                        child: Container(
                                          padding: EdgeInsets.all(10.w),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            border: Border.all(
                                              color: AppColor.primary1,
                                            ),

                                            color: AppColor.white,
                                          ),
                                          width: 100.w,
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
                                      SizedBox(width: 20.w),
                                      GestureDetector(
                                        onTap: () {
                                          if (presMedsFormKey.currentState!
                                                  .validate() &&
                                              _searchedMeds?.id != null) {
                                            model.createMedicinePrescrition(
                                              context,
                                              id: id,
                                              create:
                                                  CreateAddMedicineEntityModel(
                                                    medicineId:
                                                        _searchedMeds?.id,
                                                    dosage:
                                                        dosageTextController
                                                            .text
                                                            .trim(),
                                                    other:
                                                        noteTextController.text
                                                            .trim(),
                                                    frequency: presFrequency,
                                                    instructions:
                                                        noteTextController.text
                                                            .trim(),
                                                  ),
                                            );
                                          } else {
                                            AppUtils.snackbarTop(
                                              context,
                                              message:
                                                  "Search for medications on our system and fill all required fields.!",
                                              error: true,
                                            );
                                          }
                                          model.notifyListeners();
                                        },
                                        child: Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(10.w),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                            color: AppColor.primary1,
                                          ),
                                          child: TextView(
                                            text: 'Create Prescription',
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
                              SizedBox(height: 10.h),
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

  Color trnsType(status) {
    if (status.toLowerCase() == 'debit') {
      return AppColor.red;
    }
    return AppColor.primary1;
  }

  void cancelAppointmentDialogBox(context, {String? id}) => showDialog(
    context: context,
    builder: (context) {
      return ViewModelBuilder<DocViewModel>.reactive(
        viewModelBuilder: () => DocViewModel(),
        onViewModelReady: (model) {},
        disposeViewModel: false,
        onDispose: (viewModel) {
          reasonController.clear();
        },
        builder: (_, DocViewModel model, __) {
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
                                model.doctorsAppointmentUpdate(
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

  getBankNameViaCode(code) {
    for (var bank in BankCodes().bank_code['data']!) {
      if (code == bank['code']) {
        return bank['name'];
      }
    }
    return '';
  }

  void rescheduleAppointmentDialogBox(
    context, {
    String? id,
    String? slotId,
  }) => showDialog(
    context: context,
    builder: (context) {
      return ViewModelBuilder<DocViewModel>.reactive(
        viewModelBuilder: () => DocViewModel(),
        onViewModelReady: (model) {
          model.getDoctorsDetail(context);
        },
        disposeViewModel: false,
        onDispose: (viewModel) {
          reasonController.clear();
        },
        builder: (_, DocViewModel model, __) {
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
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: 'Reschedule Appointment',
                      textStyle: GoogleFonts.dmSans(
                        color: AppColor.fineRed,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                      height: 150.h,
                      child: Form(
                        key: formKeyReschedule,
                        child: TextFormWidget(
                          label: 'Reason for rescheduling appointment',
                          border: 10,
                          isFilled: true,
                          maxline: 3,
                          alignLabelWithHint: true,
                          fillColor: AppColor.transparent,
                          controller: reasonController,
                          validator: AppValidator.validateString(),
                        ),
                      ),
                    ),

                    if (model.getDocDetailResponseModel != null &&
                        model
                            .getDocDetailResponseModel!
                            .original!
                            .availableSlots!
                            .isNotEmpty)
                      Wrap(
                        spacing: 6.20,
                        runSpacing: 10,
                        alignment: WrapAlignment.start,
                        children: [
                          if (model.getDocDetailResponseModel != null &&
                              model
                                  .getDocDetailResponseModel!
                                  .original!
                                  .availableSlots!
                                  .isNotEmpty)
                            ...model
                                .getDocDetailResponseModel!
                                .original!
                                .availableSlots!
                                .where((w) => w.isBooked == false)
                                .map(
                                  (o) => GestureDetector(
                                    onTap:
                                        o.isBooked == true
                                            ? () {}
                                            : () {
                                              _slot = o;
                                              print(_slot);
                                              model.notifyListeners();
                                            },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 5.4.w,
                                        horizontal: 10.w,
                                      ),
                                      width: 100.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color:
                                            _slot == o
                                                ? AppColor.primary1
                                                : AppColor.transparent,
                                        border: Border.all(
                                          color:
                                              _slot == o
                                                  ? AppColor.white
                                                  : AppColor.black,
                                        ),
                                      ),
                                      child: Center(
                                        child: Column(
                                          children: [
                                            TextView(
                                              text: DateFormat(
                                                'dd/MM/yyyy',
                                              ).format(
                                                DateTime.parse(
                                                  o.availableDate!.toString(),
                                                ).toLocal(),
                                              ),
                                              textStyle: GoogleFonts.dmSans(
                                                color:
                                                    _slot == o
                                                        ? AppColor.white
                                                        : AppColor.black,
                                                fontSize: 12.2.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            TextView(
                                              text: o.availableTime ?? '',
                                              textStyle: GoogleFonts.dmSans(
                                                color:
                                                    _slot == o
                                                        ? AppColor.white
                                                        : AppColor.black,
                                                fontSize: 12.2.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                        ],
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
                                if (formKeyReschedule.currentState!
                                    .validate()) {
                                  model.doctorsAppointmentReschedule(
                                    context,
                                    id: id,
                                    reschedule: RescheduleBookingEntityModel(
                                      reason: reasonController.text,
                                      slotId: _slot!.id,
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
            ),
          );
        },
      );
    },
  );

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

        return ViewModelBuilder<DocViewModel>.reactive(
          viewModelBuilder: () => DocViewModel(),
          onViewModelReady: (model) {},
          onDispose: (viewModel) {
            accountNumberTextController.clear();
            bankCodeTextController.clear();
          },
          builder: (_, DocViewModel model, __) {
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
                                keyboardType: TextInputType.text,
                                isFilled: true,
                                readOnly: true,
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
                                              keyboardType: TextInputType.text,
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
                                                  child: Container(
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

        return ViewModelBuilder<DocViewModel>.reactive(
          viewModelBuilder: () => DocViewModel(),
          onViewModelReady: (model) {},
          onDispose: (viewModel) {
            amountTextController.clear();
          },
          builder: (_, DocViewModel model, __) {
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
                                              context,
                                              amount: int.parse(
                                                amountTextController.text
                                                    .trim(),
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

  void modalBottomSheetBankDetails(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Enables full-screen dragging
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (builder) {
        return ViewModelBuilder<DocViewModel>.reactive(
          viewModelBuilder: () => DocViewModel(),
          onViewModelReady: (model) {
            model.getDoctorsDetail(context);
          },
          onDispose: (viewModel) {},
          builder: (_, DocViewModel model, __) {
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
                    maxChildSize: 0.5, // Can be dragged to 90% of screen height
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
                                text: 'Bank Account Detail',
                                textStyle: TextStyle(
                                  color: AppColor.black,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 20.h),
                              TextView(
                                text:
                                    'Account Name: ${model.getDocDetailResponseModel?.original?.bankAccount?.accountName?.capitalizeWords() ?? ''}',
                                textStyle: TextStyle(
                                  color: AppColor.primary1.withOpacity(.9),
                                  fontSize: 16.90.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 12.20.h),
                              TextView(
                                text:
                                    'Account Number: ${model.getDocDetailResponseModel?.original?.bankAccount?.accountNumber?.capitalize() ?? ''}',
                                textStyle: TextStyle(
                                  color: AppColor.grey1,
                                  fontSize: 16.20.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 12.20.h),
                              TextView(
                                text:
                                    'Bank Name: ${model.getBankNameViaCode(model.getDocDetailResponseModel?.original?.bankAccount?.bankCode ?? '')}',
                                textStyle: TextStyle(
                                  color: AppColor.black,
                                  fontSize: 16.20.sp,
                                  fontWeight: FontWeight.w400,
                                ),
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
}
