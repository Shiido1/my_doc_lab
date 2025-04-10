import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_image.dart';
import 'package:my_doc_lab/ui/screens/authentication/forgot_password.dart';
import 'package:my_doc_lab/ui/widget/text_form_widget.dart';
import 'package:my_doc_lab/ui/widget/text_widget.dart';

import '../../widget/button_widget.dart';
import '../dashboard/dashboard_screen.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController fullnameTextController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();

  // bool _onTap = false;

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
                child: SvgPicture.asset(AppImage.message),
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
                child: SvgPicture.asset(AppImage.lock),
              ),
              suffixWidget: Padding(
                padding: EdgeInsets.all(9.2.w),
                child: SvgPicture.asset(AppImage.close_eye),
              ),
              // validator: AppValidator.validateEmail(),
            ),

            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap:
                    () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => ForgotPassword()),
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
              onPressed:
                  () => Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => Dashboard())),
            ),
            SizedBox(height: 26.0.h),
            RichText(
              text: TextSpan(
                text: 'Don\'t have an account? ',
                style: GoogleFonts.gabarito(
                  color: AppColor.black,
                  fontSize: 16.4.sp,
                  fontWeight: FontWeight.w500,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Sign Up',
                    style: GoogleFonts.gabarito(
                      color: AppColor.primary1,
                      fontSize: 16.4.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
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
            SizedBox(height: 20.h),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
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
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
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
    );
  }
}
