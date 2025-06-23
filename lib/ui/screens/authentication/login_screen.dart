// ignore_for_file: deprecated_member_use

import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/core/connect_end/model/care_giver_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/model/login_entity.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_image.dart';
import 'package:my_doc_lab/ui/screens/authentication/forgot_password.dart';
import 'package:my_doc_lab/ui/screens/authentication/sign_up_screen.dart';
import 'package:my_doc_lab/ui/widget/text_form_widget.dart';
import 'package:my_doc_lab/ui/widget/text_widget.dart';
import 'package:stacked/stacked.dart';
import '../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../core/core_folder/app/app.locator.dart';
import '../../app_assets/app_validatiion.dart';
import '../../widget/button_widget.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  LoginScreen({super.key, required this.userType});
  String? userType;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController roleTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  GlobalKey<FormState> formKeyLogin = GlobalKey<FormState>();

  String? deviceToken;

  Future<void> getDeviceToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    setState(() {
      deviceToken = token;
    });
    print('FCM Token: $deviceToken');
  }

  Future<void> _requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  @override
  void initState() {
    _requestPermission();
    getDeviceToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => locator<AuthViewModel>(),
      onViewModelReady: (model) {},
      disposeViewModel: false,
      builder: (_, AuthViewModel model, __) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 60.w),
            child: Form(
              key: formKeyLogin,
              child: Column(
                children: [
                  SvgPicture.asset(AppImage.hands, height: 40.h, width: 40.w),

                  SizedBox(height: 10.h),
                  TextView(
                    text: 'Log in',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  TextFormWidget(
                    label: 'Email Address',
                    border: 10,
                    isFilled: true,
                    fillColor: AppColor.white,
                    controller: emailTextController,
                    prefixWidget: Padding(
                      padding: EdgeInsets.all(9.2.w),
                      child: SvgPicture.asset(
                        AppImage.message,
                        height: 20.h,
                        width: 20.w,
                      ),
                    ),
                    validator: AppValidator.validateEmail(),
                  ),
                  SizedBox(height: 20.h),

                  TextFormWidget(
                    label: 'Enter your password',
                    border: 10,
                    isFilled: true,
                    fillColor: AppColor.white,
                    controller: passwordTextController,
                    prefixWidget: Padding(
                      padding: EdgeInsets.all(9.2.w),
                      child: SvgPicture.asset(
                        AppImage.lock,
                        height: 20.h,
                        width: 20.w,
                      ),
                    ),
                    suffixWidget: Padding(
                      padding: EdgeInsets.all(9.2.w),
                      child: GestureDetector(
                        onTap: model.isOnTogglePassword,
                        child: SvgPicture.asset(
                          !model.isTogglePassword
                              ? AppImage.close_eye
                              : AppImage.opened_eye,
                          color: AppColor.grey,
                          height: !model.isTogglePassword ? 20.h : 14.h,
                          width: !model.isTogglePassword ? 20.w : 14.h,
                        ),
                      ),
                    ),
                    obscureText: !model.isTogglePassword,
                    validator: AppValidator.validateString(),
                  ),
                  SizedBox(height: 20.h),

                  widget.userType == 'care-giver'
                      ? TextFormWidget(
                        label: 'Select your role',
                        border: 10,
                        isFilled: true,
                        readOnly: true,
                        fillColor: AppColor.white,
                        controller: TextEditingController(
                          text: model.selectedRole,
                        ),
                        prefixWidget: Padding(
                          padding: EdgeInsets.all(9.2.w),
                          child: SvgPicture.asset(
                            AppImage.spec,
                            height: 20.h,
                            width: 20.w,
                          ),
                        ),
                        suffixIcon: Icons.arrow_drop_down,
                        onPasswordToggle: () => model.selectSpecDialog(context),
                        validator: AppValidator.validateString(),
                      )
                      : SizedBox.shrink(),

                  SizedBox(height: 10.h),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap:
                          () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ForgotPassword(),
                            ),
                          ),
                      child: TextView(
                        text: 'Forgot Password?',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.primary1,
                          fontSize: 15.4.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 60.h),
                  ButtonWidget(
                    buttonText: 'Login',
                    buttonColor: AppColor.primary1,
                    buttonBorderColor: AppColor.transparent,
                    textStyle: GoogleFonts.dmSans(
                      color: AppColor.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    onPressed: () {
                      if (formKeyLogin.currentState!.validate()) {
                        widget.userType == 'care-giver'
                            ? model.loginCareGiver(
                              context,
                              careGiverEntity: CareGiverEntityModel(
                                email: emailTextController.text.trim(),
                                password: passwordTextController.text.trim(),
                                role: model.selectedRole,
                                deviceToken: deviceToken,
                                deviceType:
                                    Platform.isAndroid ? 'android' : 'ios',
                              ),
                            )
                            : model.loginUser(
                              context,
                              loginEntity: LoginEntityModel(
                                email: emailTextController.text.trim(),
                                password: passwordTextController.text.trim(),
                                deviceToken: deviceToken,
                                deviceType:
                                    Platform.isAndroid ? 'android' : 'ios',
                              ),
                            );
                      }
                    },
                  ),
                  SizedBox(height: 26.0.h),
                  GestureDetector(
                    onTap:
                        () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    SignUpScreen(userType: widget.userType),
                          ),
                        ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextView(
                          text: 'Don\'t have an account? ',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.black,
                            fontSize: 16.4.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextView(
                          text: 'Sign Up',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.primary1,
                            fontSize: 16.4.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30.h),
                  GestureDetector(
                    onTap:
                        () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder:
                                (context) =>
                                    SignUpScreen(userType: widget.userType),
                          ),
                        ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 12.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(color: AppColor.lightgrey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(AppImage.google),
                          TextView(
                            text: 'Sign in with Google',
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.darkindgrey,
                              fontSize: 16.4.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 20.h, width: 20.w),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 12.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: AppColor.lightgrey),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(AppImage.apple),
                        TextView(
                          text: 'Sign in with Apple',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.darkindgrey,
                            fontSize: 16.4.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 20.h, width: 20.w),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 12.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(color: AppColor.lightgrey),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset(AppImage.facebook),
                        TextView(
                          text: 'Sign in with Facebook',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.darkindgrey,
                            fontSize: 16.4.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 20.h, width: 20.w),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
