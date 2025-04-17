import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_image.dart';
import 'package:my_doc_lab/ui/screens/authentication/login_screen.dart';
import 'package:my_doc_lab/ui/widget/text_form_widget.dart';
import 'package:my_doc_lab/ui/widget/text_widget.dart';

import '../../widget/button_widget.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key, required this.userType});
  String? userType;

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController fullnameTextController = TextEditingController();

  bool _onTap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 60.w),
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
              label: 'Enter your Full Name',
              // hint: 'Email Address',
              border: 10,
              isFilled: true,
              fillColor: AppColor.white,
              controller: fullnameTextController,
              prefixWidget: Padding(
                padding: EdgeInsets.all(9.2.w),
                child: SvgPicture.asset(
                  AppImage.person,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
              // validator: AppValidator.validateEmail(),
            ),
            SizedBox(height: 20.h),
            widget.userType == 'care-giver'
                ? Column(
                  children: [
                    TextFormWidget(
                      label: 'Select Profession',
                      // hint: 'Email Address',
                      border: 10,
                      isFilled: true,
                      readOnly: true,
                      fillColor: AppColor.white,
                      controller: fullnameTextController,
                      prefixWidget: Padding(
                        padding: EdgeInsets.all(9.2.w),
                        child: SvgPicture.asset(
                          AppImage.prof,
                          width: 20.w,
                          height: 20.h,
                        ),
                      ),
                      suffixWidget: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.keyboard_arrow_down, size: 20.sp),
                      ),
                      // validator: AppValidator.validateEmail(),
                    ),
                    SizedBox(height: 20.h),
                    TextFormWidget(
                      label: 'Select your Specialization',
                      // hint: 'Email Address',
                      border: 10,
                      isFilled: true,
                      fillColor: AppColor.white,
                      controller: fullnameTextController,
                      prefixWidget: Padding(
                        padding: EdgeInsets.all(9.2.w),
                        child: SvgPicture.asset(
                          AppImage.spec,
                          width: 20.w,
                          height: 20.h,
                        ),
                      ),
                      // validator: AppValidator.validateEmail(),
                    ),
                    SizedBox(height: 20.h),
                  ],
                )
                : SizedBox.shrink(),
            TextFormWidget(
              label: 'Email Address',
              // hint: 'Email Address',
              border: 10,
              isFilled: true,
              fillColor: AppColor.white,
              controller: fullnameTextController,
              prefixWidget: Padding(
                padding: EdgeInsets.all(9.2.w),
                child: SvgPicture.asset(
                  AppImage.message,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
              // validator: AppValidator.validateEmail(),
            ),
            SizedBox(height: 20.h),
            TextFormWidget(
              label: 'Enter your password',
              // hint: 'Email Address',
              border: 10,
              isFilled: true,
              fillColor: AppColor.white,
              controller: fullnameTextController,
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
                child: SvgPicture.asset(
                  AppImage.close_eye,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
              // validator: AppValidator.validateEmail(),
            ),
            SizedBox(height: 20.h),
            TextFormWidget(
              label: 'Confirm your password',
              // hint: 'Email Address',
              border: 10,
              isFilled: true,
              fillColor: AppColor.white,
              controller: fullnameTextController,
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
                child: SvgPicture.asset(
                  AppImage.close_eye,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
              // validator: AppValidator.validateEmail(),
            ),
            SizedBox(height: 20.h),
            TextFormWidget(
              label: 'Address',
              // hint: 'Email Address',
              border: 10,
              isFilled: true,
              fillColor: AppColor.white,
              controller: fullnameTextController,
              prefixWidget: Padding(
                padding: EdgeInsets.all(9.2.w),
                child: SvgPicture.asset(
                  AppImage.location,
                  width: 20.w,
                  height: 20.h,
                ),
              ),
              // validator: AppValidator.validateEmail(),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => setState(() => _onTap = !_onTap),
                  child:
                      _onTap
                          ? Container(
                            height: 18.0.h,
                            width: 18.0.w,
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
                        text: 'I agree to My DocLab\'s ',
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
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
              onPressed:
                  () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder:
                          (context) => LoginScreen(userType: widget.userType),
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
