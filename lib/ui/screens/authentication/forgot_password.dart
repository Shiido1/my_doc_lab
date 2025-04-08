import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_image.dart';
import 'package:my_doc_lab/ui/screens/authentication/verification_screen_forgot_password.dart';
import 'package:my_doc_lab/ui/widget/button_widget.dart';
import 'package:my_doc_lab/ui/widget/text_form_widget.dart';
import 'package:my_doc_lab/ui/widget/text_widget.dart';

class ForgotPassword extends StatefulWidget {
  ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool _onTap = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            TextView(
              text: 'Forgot Password',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.darkindgrey,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20.h),
            TextView(
              text:
                  'Enter your email and phone number,  we will send a confirmation code',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.darkindgrey,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 30.h),
            Container(
              padding: EdgeInsets.all(6.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32.r),
                color: AppColor.greylight,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => setState(() => _onTap = false),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 14.w,
                        horizontal: 42.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color:
                            _onTap ? AppColor.transparent : AppColor.primary1,
                      ),
                      child: TextView(
                        text: 'Email',
                        textStyle: GoogleFonts.dmSans(
                          color: _onTap ? AppColor.darkindgrey : AppColor.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => _onTap = true),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 14.w,
                        horizontal: 42.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color:
                            _onTap ? AppColor.primary1 : AppColor.transparent,
                      ),
                      child: TextView(
                        text: 'Phone',
                        textStyle: GoogleFonts.dmSans(
                          color: _onTap ? AppColor.white : AppColor.darkindgrey,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            _onTap
                ? TextFormWidget(
                  label: 'Enter your Phone number',
                  // hint: 'Email Address',
                  border: 10,
                  isFilled: true,
                  fillColor: AppColor.white,
                  controller: phoneController,
                  prefixWidget: Padding(
                    padding: EdgeInsets.all(9.2.w),
                    child: SvgPicture.asset(AppImage.phone),
                  ),
                  // validator: AppValidator.validateEmail(),
                )
                : TextFormWidget(
                  label: 'Enter your email',
                  // hint: 'Email Address',
                  border: 10,
                  isFilled: true,
                  fillColor: AppColor.white,
                  controller: emailController,
                  prefixWidget: Padding(
                    padding: EdgeInsets.all(9.2.w),
                    child: SvgPicture.asset(AppImage.message),
                  ),
                  // validator: AppValidator.validateEmail(),
                ),
            SizedBox(height: 80.h),
            ButtonWidget(
              buttonText: 'Reset Password',
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
                      builder: (context) => VerificationScreenForgotPassword(),
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
