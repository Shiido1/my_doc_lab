// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:doc_lab_pharm/core/connect_end/model/care_giver_resiter_entity_model.dart';
import 'package:doc_lab_pharm/core/connect_end/model/registration_entity_model.dart';
import 'package:doc_lab_pharm/ui/app_assets/app_color.dart';
import 'package:doc_lab_pharm/ui/app_assets/app_image.dart';
import 'package:doc_lab_pharm/ui/widget/text_form_widget.dart';
import 'package:doc_lab_pharm/ui/widget/text_widget.dart';
import 'package:stacked/stacked.dart';

import '../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../core/core_folder/app/app.locator.dart';
import '../../app_assets/app_utils.dart';
import '../../app_assets/app_validatiion.dart';
import '../../widget/button_widget.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key, required this.userType});
  String? userType;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController fnameTextController = TextEditingController();
  TextEditingController lnameTextController = TextEditingController();
  TextEditingController profTextController = TextEditingController();
  TextEditingController specTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  TextEditingController confirmPasswordTextController = TextEditingController();
  TextEditingController addressTextController = TextEditingController();
  TextEditingController cityTextController = TextEditingController();
  TextEditingController stateTextController = TextEditingController();
  TextEditingController phoneTextController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool _onTap = false;

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
              key: formKey,
              child: Column(
                children: [
                  SvgPicture.asset(AppImage.hands, height: 40.h, width: 40.w),

                  SizedBox(height: 10.h),
                  TextView(
                    text: 'Sign Up',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  TextFormWidget(
                    label: 'Enter your First Name',
                    border: 10,
                    isFilled: true,
                    fillColor: AppColor.white,
                    controller: fnameTextController,
                    prefixWidget: Padding(
                      padding: EdgeInsets.all(9.2.w),
                      child: SvgPicture.asset(
                        AppImage.person,
                        width: 20.w,
                        height: 20.h,
                      ),
                    ),
                    validator: AppValidator.validateString(),
                  ),
                  SizedBox(height: 20.h),
                  TextFormWidget(
                    label: 'Enter your Last Name',
                    border: 10,
                    isFilled: true,
                    fillColor: AppColor.white,
                    controller: lnameTextController,
                    prefixWidget: Padding(
                      padding: EdgeInsets.all(9.2.w),
                      child: SvgPicture.asset(
                        AppImage.person,
                        width: 20.w,
                        height: 20.h,
                      ),
                    ),
                    validator: AppValidator.validateString(),
                  ),
                  SizedBox(height: 20.h),
                  TextFormWidget(
                    label: 'Enter your Phone Number',
                    border: 10,
                    isFilled: true,
                    fillColor: AppColor.white,
                    keyboardType: TextInputType.number,
                    controller: phoneTextController,
                    prefixWidget: Padding(
                      padding: EdgeInsets.all(9.2.w),
                      child: SvgPicture.asset(
                        AppImage.person,
                        width: 20.w,
                        height: 20.h,
                      ),
                    ),
                    validator: AppValidator.validateString(),
                  ),
                  SizedBox(height: 20.h),
                  widget.userType == 'care-giver'
                      ? Column(
                        children: [
                          // TextFormWidget(
                          //   label: 'Enter Area of Specialization',
                          //   border: 10,
                          //   isFilled: true,
                          //   fillColor: AppColor.white,
                          //   controller: specTextController,
                          //   prefixWidget: Padding(
                          //     padding: EdgeInsets.all(9.2.w),
                          //     child: SvgPicture.asset(
                          //       AppImage.prof,
                          //       width: 20.w,
                          //       height: 20.h,
                          //     ),
                          //   ),
                          //   validator: AppValidator.validateString(),
                          // ),
                          // SizedBox(height: 20.h),
                          TextFormWidget(
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
                            onPasswordToggle:
                                () => model.selectSpecDialog(context),
                            validator: AppValidator.validateString(),
                          ),
                          SizedBox(height: 20.h),
                        ],
                      )
                      : SizedBox.shrink(),
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
                        width: 20.w,
                        height: 20.h,
                      ),
                    ),
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
                        width: 20.w,
                        height: 20.h,
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
                  TextFormWidget(
                    label: 'Confirm your password',
                    border: 10,
                    isFilled: true,
                    fillColor: AppColor.white,
                    controller: confirmPasswordTextController,
                    prefixWidget: Padding(
                      padding: EdgeInsets.all(9.2.w),
                      child: SvgPicture.asset(
                        AppImage.lock,
                        width: 20.w,
                        height: 20.h,
                      ),
                    ),
                    suffixWidget: Padding(
                      padding: EdgeInsets.all(9.2.w),
                      child: GestureDetector(
                        onTap: model.isOnTogglePasswordConfirm,
                        child: SvgPicture.asset(
                          !model.isTogglePasswordConfirm
                              ? AppImage.close_eye
                              : AppImage.opened_eye,
                          color: AppColor.grey,
                          height: !model.isTogglePasswordConfirm ? 20.h : 14.h,
                          width: !model.isTogglePasswordConfirm ? 20.w : 14.h,
                        ),
                      ),
                    ),
                    obscureText: !model.isTogglePasswordConfirm,
                    validator: AppValidator.confirmValidatePassword(
                      passwordController1: passwordTextController,
                      passwordController2: confirmPasswordTextController,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  TextFormWidget(
                    label: 'Address',
                    border: 10,
                    isFilled: true,
                    fillColor: AppColor.white,
                    controller: addressTextController,
                    prefixWidget: Padding(
                      padding: EdgeInsets.all(9.2.w),
                      child: SvgPicture.asset(
                        AppImage.location,
                        width: 20.w,
                        height: 20.h,
                      ),
                    ),
                    validator: AppValidator.validateString(),
                  ),
                  SizedBox(height: 20.h),
                  TextFormWidget(
                    label: 'City',
                    border: 10,
                    isFilled: true,
                    fillColor: AppColor.white,
                    controller: cityTextController,
                    prefixWidget: Padding(
                      padding: EdgeInsets.all(9.2.w),
                      child: SvgPicture.asset(
                        AppImage.location,
                        width: 20.w,
                        height: 20.h,
                      ),
                    ),
                    validator: AppValidator.validateString(),
                  ),
                  SizedBox(height: 20.h),
                  TextFormWidget(
                    label: 'State',
                    border: 10,
                    isFilled: true,
                    fillColor: AppColor.white,
                    controller: stateTextController,
                    prefixWidget: Padding(
                      padding: EdgeInsets.all(9.2.w),
                      child: SvgPicture.asset(
                        AppImage.location,
                        width: 20.w,
                        height: 20.h,
                      ),
                    ),
                    validator: AppValidator.validateString(),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () => setState(() => _onTap = !_onTap),
                        child:
                            !_onTap
                                ? Container(
                                  height: 20.0.h,
                                  width: 21.0.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2.r),
                                    color: AppColor.grey.withOpacity(.3),
                                  ),
                                )
                                : Container(
                                  padding: EdgeInsets.all(1.2.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(2.r),
                                    color: AppColor.grey.withOpacity(.3),
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    color: AppColor.black,
                                    size: 18.0.sp,
                                    weight: 40.r,
                                  ),
                                ),
                      ),
                      SizedBox(width: 20.w),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: 'I agree to Doclabpharm\'s ',
                              style: GoogleFonts.gabarito(
                                color: AppColor.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Terms of Service',
                                  style: GoogleFonts.gabarito(
                                    color: AppColor.primary1,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: ' and ',
                                  style: GoogleFonts.gabarito(
                                    color: AppColor.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Privacy Policy.',
                              style: GoogleFonts.gabarito(
                                color: AppColor.primary1,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                              children: <TextSpan>[],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 140.h),
                  ButtonWidget(
                    buttonText: 'Continue',
                    buttonColor: AppColor.primary1,
                    buttonBorderColor: AppColor.transparent,
                    textStyle: GoogleFonts.dmSans(
                      color: AppColor.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate() && _onTap) {
                        widget.userType == 'care-giver'
                            ? model.careRegisterUser(
                              context,
                              registerEntity: CareGiverResiterEntityModel(
                                firstName: fnameTextController.text.trim(),
                                lastName: lnameTextController.text.trim(),
                                phoneNumber: phoneTextController.text.trim(),
                                confirmPassword:
                                    confirmPasswordTextController.text.trim(),
                                speciality: specTextController.text.trim(),
                                city: cityTextController.text.trim(),
                                state: stateTextController.text.trim(),
                                address: addressTextController.text.trim(),
                                email: emailTextController.text.trim(),
                                password: passwordTextController.text.trim(),
                                role: model.selectedRole,
                              ),
                              userType: widget.userType,
                            )
                            : model.registerUser(
                              context,
                              registerEntity: RegistrationEntityModel(
                                firstName: fnameTextController.text.trim(),
                                lastName: lnameTextController.text.trim(),
                                phoneNumber: phoneTextController.text.trim(),
                                email: emailTextController.text.trim(),
                                password: passwordTextController.text.trim(),
                                city: cityTextController.text.trim(),
                                confirmPassword:
                                    confirmPasswordTextController.text.trim(),
                                address: addressTextController.text.trim(),
                                state: stateTextController.text.trim(),
                              ),
                              userType: widget.userType,
                            );
                      } else {
                        AppUtils.snackbarTop(
                          context,
                          message:
                              'Fill all information and agree to Doclabpharm terms and condition.',
                          error: true,
                        );
                      }
                    },
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
