// ignore_for_file: unnecessary_null_comparison
import 'package:my_doc_lab/ui/screens/dashboard/settings/wallet/web_view_screen.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:my_doc_lab/core/connect_end/model/call_token_generate_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/call_token_generate_response_model/call_token_generate_response_model.dart';
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
import 'package:my_doc_lab/core/connect_end/model/send_message_response_model/send_message_response_model.dart';
import 'package:my_doc_lab/core/connect_end/model/update_user_response_model/update_user_response_model.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_image.dart';
import 'package:my_doc_lab/ui/widget/text_widget.dart';
import 'package:stacked/stacked.dart';
import '../../../ui/app_assets/app_validatiion.dart';
import '../../../ui/screens/dashboard/dashboard_screen.dart';
import '../../../ui/widget/button_widget.dart';
import '../../../ui/widget/text_form_widget.dart';
import '../model/checkout_entity_model/checkout_entity_model.dart' as ch;
import '../../../main.dart';
import '../../../ui/app_assets/app_utils.dart';
import '../../../ui/app_assets/constant.dart';
import '../../../ui/app_assets/image_picker.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/app/app.logger.dart';
import '../../core_folder/app/app.router.dart';
import '../../core_folder/manager/shared_preference.dart';
import '../../debouncer.dart';
import '../model/add_booking_entity_model.dart';
import '../model/checkout_entity_model/item.dart';
import '../model/checkoutentitymodel.dart';
import '../model/get_all_doctors_response_model/get_all_doctors_response_model.dart';
import '../model/get_all_medicine_response_model/get_all_medicine_response_model.dart';
import '../model/get_all_pharmacies_response_model/get_all_pharmacies_response_model.dart';
import '../model/get_doctors_wallet_response_model/get_doctors_wallet_response_model.dart';
import '../model/get_medicine_detail_response_model/get_medicine_detail_response_model.dart';
import '../model/get_message_index_response_model/get_message_index_response_model.dart';
import '../model/get_pharmacy_detail_response_model/get_pharmacy_detail_response_model.dart';
import '../model/pay_stack_payment_model/pay_stack_payment_model.dart';
import '../model/post_user_cloud_entity_model.dart';
import '../model/post_user_verification_cloud_response/post_user_verification_cloud_response.dart';
import '../model/received_message_response_model/received_message_response_model.dart';
import '../model/search_doctor_entity_model.dart';
import '../model/searched_medicine_response_model/searched_medicine_response_model.dart';
import '../model/searched_pharmacy_response_model/searched_pharmacy_response_model.dart';
import '../model/send_message_entity_model.dart';
import '../model/update_user_entity_model.dart';
import '../model/view_doctors_prescription_model/view_doctors_prescription_model.dart';
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

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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

  GetMessageIndexResponseModelList? _getMessageIndexResponseModelList;
  GetMessageIndexResponseModelList? get getMessageIndexResponseModelList =>
      _getMessageIndexResponseModelList;
  ReceivedMessageResponseModelList? _receivedMessageResponseModelList;
  ReceivedMessageResponseModelList? get receivedMessageResponseModelList =>
      _receivedMessageResponseModelList;
  UpdateUserResponseModel? get updateUserResponseModel =>
      _updateUserResponseModel;
  UpdateUserResponseModel? _updateUserResponseModel;

  GetDoctorsWalletResponseModel? _getUsersWalletResponseModel;
  GetDoctorsWalletResponseModel? get getUsersWalletResponseModel =>
      _getUsersWalletResponseModel;
  PayStackPaymentModel? _payStackPaymentModel;
  PayStackPaymentModel? get payStackPaymentModel => _payStackPaymentModel;

  final debouncer = Debouncer();

  String selectedRole = '';

  List<Item> items = [];

  AuthViewModel({this.context});

  String query = '';
  String queryPharm = '';
  String queryMed = '';

  PostUserVerificationCloudResponse? _postUserVerificationCloudResponse;
  PostUserVerificationCloudResponse? get postUserVerificationCloudResponse =>
      _postUserVerificationCloudResponse;
  final _pickImage = ImagePickerHandler();
  File? image;
  String? filename;
  bool hasLoadedConversation = false;
  DateTime now = DateTime.now();
  TextEditingController sendtextController = TextEditingController(text: '');
  TextEditingController amountController = TextEditingController();

  Box<CheckoutEntityModel>? _box;

  List<SendMessageEntityModel> sendList = [];

  ScrollController scrollController1 = ScrollController();
  SendMessageResponseModel? _sendMessageResponseModel;
  SendMessageResponseModel? get sendMessageResponseModel =>
      _sendMessageResponseModel;
  CallTokenGenerateResponseModel? _callTokenGenerateResponseModel;
  CallTokenGenerateResponseModel? get callTokenGenerateResponseModel =>
      _callTokenGenerateResponseModel;
  ViewDoctorsPrescriptionModelList? _viewDoctorsPrescriptionModel;
  ViewDoctorsPrescriptionModelList? get viewDoctorsPrescriptionModel =>
      _viewDoctorsPrescriptionModel;
  RtcEngine? engine;

  dynamic remoteUidGlobal;
  dynamic remoteUidGlobalLocal;

  bool localUserJoined = false;
  bool onSwitch = false;

  onSwitched() {
    onSwitch = !onSwitch;
    notifyListeners();
  }

  Box<CheckoutEntityModel> getModelBox(box) {
    _box = box;
    notifyListeners();
    return _box!;
  }

  void deleteCartItem(Box<CheckoutEntityModel> box, int index) {
    box.deleteAt(index);
    getCartTotal();
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
        AppUtils.snackbar(context, message: _loginResponseModel?.message!);
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

  void checkOut(context, {ch.CheckoutEntityModel? checkout}) async {
    try {
      Navigator.pop(context);
      loadingDialog(context);
      await runBusyFuture(
        repositoryImply.checkout(checkout!),
        throwException: true,
      );
      Navigator.pop(context);
      showCheckoutSuccessfulModal(context);
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      Navigator.pop(context);
      Future.delayed(Duration(seconds: 1), () {
        AppUtils.snackbar(context, message: e.toString(), error: true);
      });
    }
    notifyListeners();
  }

  void updateUser(context, {UpdateUserEntityModel? updateEntity}) async {
    try {
      loadingDialog(context);
      _updateUserResponseModel = await runBusyFuture(
        repositoryImply.updateUser(updateEntity!),
        throwException: true,
      );
      if (_updateUserResponseModel?.status == 'success') {
        Navigator.pop(context);
        AppUtils.snackbar(context, message: 'Account updated successfully!');
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

  void viewDoctorsPrescription(context) async {
    try {
      _isLoading = true;
      _viewDoctorsPrescriptionModel = await runBusyFuture(
        repositoryImply.viewDocPrescription(),
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

  Future<void> viewDoctorsPrescriptionReload() async {
    try {
      _viewDoctorsPrescriptionModel = await runBusyFuture(
        repositoryImply.viewDocPrescription(),
        throwException: true,
      );

      _isLoading = false;
    } catch (e) {
      _isLoading = false;
    }
    notifyListeners();
  }

  Future<void> userWallet() async {
    try {
      _isLoading = true;
      _getUsersWalletResponseModel = await runBusyFuture(
        repositoryImply.userWallet(),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
    }
    notifyListeners();
  }

  Future<void> userWalletReload() async {
    try {
      _getUsersWalletResponseModel = await runBusyFuture(
        repositoryImply.userWallet(),
        throwException: true,
      );
      _isLoading = false;
    } catch (e) {
      _isLoading = false;
      logger.d(e);
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

  void paymentTopUp(context, {String? amount}) async {
    try {
      _isLoading = true;
      _payStackPaymentModel = await runBusyFuture(
        repositoryImply.paymentTopUp(amount!),
        throwException: true,
      );
      _isLoading = false;
      await AppUtils.snackbar(
        context,
        message: _payStackPaymentModel?.message ?? '',
      );
      Navigator.of(context).push(
        MaterialPageRoute(
          builder:
              (context) => WebViewScreen(
                payStackUrl: _payStackPaymentModel?.authorizationUrl,
              ),
        ),
      );
    } catch (e) {
      _isLoading = false;
      logger.d(e);
      AppUtils.snackbar(context, message: e.toString(), error: true);
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

  void generateToken(context, {CallTokenGenerateEntityModel? calltoken}) async {
    try {
      // _isLoading = true;
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
      // AppUtils.snackbar(context, message: e.toString(), error: true);
    }
    notifyListeners();
  }
  //006e18babecb1eb4a889feefcbbf60e5a5aIABQD9s1G6es/M/kbWiKi/dkNJI4CuvRV1fNvkIgJLIkVDJFnOkAAAAAIgDnmr0D/9g2aAQAAQCPlTVoAwCPlTVoAgCPlTVoBACPlTVo

  // Set up the Agora RTC engine instance
  Future<void> initializeAgoraVoiceSDK() async {
    await [Permission.microphone, Permission.camera].request();
    engine = createAgoraRtcEngine();
    await engine?.initialize(
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
          uid: 0, // Specifies the local user // Sets the video rendering mode
        ),
      ),
    );
  }

  // Register an event handler for Agora RTC
  void _setupEventHandlers() {
    engine?.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          debugPrint("Local user ${connection.localUid} joined");
          localUserJoined = true;
          remoteUidGlobalLocal = connection.localUid;
          notifyListeners();
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          debugPrint("Remote user $remoteUid joined");
          remoteUidGlobal = remoteUid;
          print('uuuuuuu000000000dD:${remoteUidGlobal.toString()}');
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
        clientRoleType: ClientRoleType.clientRoleAudience,
      ),
      uid: 0,
    );
  }

  // Leaves the channel and releases resources
  Future<void> cleanupAgoraEngine() async {
    await engine?.leaveChannel();
    await engine?.release();
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
                child: SizedBox(
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
                child: SizedBox(
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
                child: SizedBox(
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
      message: 'Kindly long press item to delete item from cart',
    );
  }

  homeGridView({double? mainAxisExtent}) {
    final isSearching =
        query.isNotEmpty && _searchedDoctorResponseModelList != null;
    final doctorsList =
        isSearching
            ? _searchedDoctorResponseModelList!.searchedDoctorResponseModelList
            : _getAllDoctorsResponseModelList?.getAllDoctorsResponseModelList ??
                [];

    return doctorsList.isEmpty
        ? Center(
          child: TextView(
            text: 'No Available Doctor',
            textStyle: GoogleFonts.dmSans(
              color: AppColor.darkindgrey,
              fontSize: 17.80.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        )
        : GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            mainAxisExtent: Platform.isIOS ? mainAxisExtent : 200,
          ),
          itemCount: doctorsList.length,
          itemBuilder: (context, index) {
            dynamic doctor = doctorsList[index];
            final doctorName =
                'Dr ${doctor.firstName ?? ''} ${doctor.lastName ?? ''}';
            final speciality = doctor.speciality ?? '';

            return GestureDetector(
              onTap: () {
                navigate.navigateTo(
                  Routes.profileScreen,
                  arguments: ProfileScreenArguments(id: doctor.id.toString()),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: AppColor.funnyLookingGrey.withOpacity(0.3),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                      child: Image.network(
                        imageString(index),
                        height: 120.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) => shimmerViewPharm(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            text: doctorName,
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.black,
                              fontSize: 16.0.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextView(
                            text: speciality,
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.grey,
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 14.0.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 1.w,
                                  horizontal: 4.w,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  color: AppColor.primary,
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: AppColor.white,
                                      size: 15.0.sp,
                                    ),
                                    SizedBox(width: 2.w),
                                    TextView(
                                      text: '4.8',
                                      textStyle: GoogleFonts.dmSans(
                                        color: AppColor.white,
                                        fontSize: 12.0.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Row(
                              //   children: [
                              //     SvgPicture.asset(
                              //       AppImage.location,
                              //       height: 15.2.h,
                              //       width: 16.2.w,
                              //     ),
                              //     SizedBox(width: 2.w),
                              //     TextView(
                              //       text: '800m away',
                              //       textStyle: GoogleFonts.gabarito(
                              //         color: AppColor.black,
                              //         fontSize: 12.0.sp,
                              //         fontWeight: FontWeight.w500,
                              //       ),
                              //     ),
                              //   ],
                              // ),
                            ],
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
  }

  String imageString(int index) {
    if (query != '' &&
        _searchedDoctorResponseModelList != null &&
        _searchedDoctorResponseModelList!
            .searchedDoctorResponseModelList
            .isNotEmpty) {
      return _searchedDoctorResponseModelList!
                      .searchedDoctorResponseModelList[index]
                      .profileImage !=
                  null &&
              _searchedDoctorResponseModelList!
                  .searchedDoctorResponseModelList[index]
                  .profileImage!
                  .contains('https')
          ? _searchedDoctorResponseModelList!
              .searchedDoctorResponseModelList[index]
              .profileImage!
          : 'https://res.cloudinary.com/dnv6yelbr/image/upload/v1747827538/${_searchedDoctorResponseModelList!.searchedDoctorResponseModelList[index].profileImage ?? ''}';
    } else if (_getAllDoctorsResponseModelList != null) {
      return _getAllDoctorsResponseModelList!
                      .getAllDoctorsResponseModelList![index]
                      .profileImage !=
                  null &&
              _getAllDoctorsResponseModelList!
                  .getAllDoctorsResponseModelList![index]
                  .profileImage!
                  .contains('https')
          ? _getAllDoctorsResponseModelList!
              .getAllDoctorsResponseModelList![index]
              .profileImage!
          : 'https://res.cloudinary.com/dnv6yelbr/image/upload/v1747827538/${_getAllDoctorsResponseModelList!.getAllDoctorsResponseModelList![index].profileImage ?? ''}';
    }
    return '';
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
      Future.delayed(Duration(seconds: 1), () {
        if (hasLoadedConversation) receiveConversation(id);
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
      message.senderType == "MydocLab\\Models\\Doctor"
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
                // ignore: deprecated_member_use
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

  clickCheckout() {
    List<CheckoutEntityModel> c = [];
    items.clear();
    for (int i = 0; i < box.length; i++) {
      c.add(box.getAt(i));
    }

    for (var element in c) {
      if (element.serviceType == 'consult') {
        items.add(
          Item(
            serviceType: 'consult',
            serviceId: element.serviceId,
            doctorId: element.doctorId,
            slotId: element.slotId,
            complaint: element.complaint,
          ),
        );
      } else if (element.serviceType == 'med') {
        items.add(
          Item(
            serviceType: 'med',
            productId: element.productId,
            qty: element.qty,
          ),
        );
      } else {
        items.add(
          Item(serviceType: element.serviceType, serviceId: element.serviceId),
        );
      }
    }
  }

  showCheckoutModal(BuildContext context) => showDialog(
    context: context,
    barrierDismissible: true,
    builder:
        (ctxt) => Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.w),
            margin: EdgeInsets.only(top: 200.w, bottom: 200.w),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.primary1,
                  ),
                  child: Icon(Icons.check, color: AppColor.white, size: 30.sp),
                ),
                SizedBox(height: 30.h),
                TextView(
                  text: 'Click Ok to Checkout.',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.black,
                    fontSize: 15.80.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20.h),
                TextView(
                  text: 'Your payment will be deducted from your wallet.',
                  textAlign: TextAlign.center,
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.black,
                    fontSize: 15.80.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 40.h),
                ButtonWidget(
                  buttonText: 'Checkout',
                  buttonHeight: 40,
                  buttonColor: AppColor.primary1,
                  buttonBorderColor: AppColor.transparent,
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  onPressed:
                      () => checkOut(
                        context,
                        checkout: ch.CheckoutEntityModel(
                          items: items,
                          paymentMethod: 'wallet',
                        ),
                      ),
                ),
              ],
            ),
          ),
        ),
  );

  showCheckoutSuccessfulModal(BuildContext context) => showDialog(
    context: context,
    barrierDismissible: true,
    builder:
        (ctxt) => Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.w),
            margin: EdgeInsets.only(top: 200.w, bottom: 200.w),
            decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.primary1,
                  ),
                  child: Icon(Icons.check, color: AppColor.white, size: 30.sp),
                ),
                SizedBox(height: 30.h),
                TextView(
                  text: 'Payment Successful',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.black,
                    fontSize: 15.80.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20.h),
                TextView(
                  text: 'Your payment has been approved',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.black,
                    fontSize: 15.80.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 40.h),
                ButtonWidget(
                  buttonText: 'Go to Dashboard',
                  buttonHeight: 40,
                  buttonColor: AppColor.primary1,
                  buttonBorderColor: AppColor.transparent,
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Dashboard()),
                    );
                    box.clear();
                  },
                ),
              ],
            ),
          ),
        ),
  );

  void modalBottomSheetTopUp(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Enables full-screen dragging
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (builder) {
        return StatefulBuilder(
          builder: (_, StateSetter setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: DraggableScrollableSheet(
                expand: false,
                initialChildSize: 0.35, // 50% of screen height
                minChildSize: 0.28, // Can be dragged to 30% of screen height
                maxChildSize: 0.45, // Can be dragged to 90% of screen height
                builder: (__, scrollController) {
                  return ViewModelBuilder<AuthViewModel>.reactive(
                    viewModelBuilder: () => AuthViewModel(),
                    onViewModelReady: (model) {},
                    onDispose: (viewModel) {
                      amountController.clear();
                    },
                    builder: (_, AuthViewModel model, __) {
                      return SingleChildScrollView(
                        padding: EdgeInsets.only(left: 12.w, right: 24.w),
                        controller: scrollController,
                        child: Form(
                          key: formKey,
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
                                text: 'Top Up Wallet',
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
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.primary1,
                                ),
                                border: 10,
                                isFilled: true,
                                keyboardType: TextInputType.number,
                                fillColor: AppColor.white,
                                controller: amountController,
                                validator: AppValidator.validateString(),
                              ),

                              SizedBox(height: 30.h),

                              !model.isLoading
                                  ? GestureDetector(
                                    onTap: () {
                                      if (formKey.currentState!.validate()) {
                                        model.paymentTopUp(
                                          context,
                                          amount: amountController.text.trim(),
                                        );
                                      }
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(10.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColor.primary1,
                                      ),
                                      child: TextView(
                                        text: 'Send',
                                        textStyle: GoogleFonts.gabarito(
                                          color: AppColor.white,
                                          fontSize: 22.0.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
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
}
