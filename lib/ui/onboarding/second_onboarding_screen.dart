import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:doc_lab_pharm/ui/app_assets/app_color.dart';
import 'package:doc_lab_pharm/ui/app_assets/app_image.dart';
import 'package:doc_lab_pharm/ui/screens/authentication/login_screen.dart';
import 'package:doc_lab_pharm/ui/screens/authentication/sign_up_screen.dart';
import 'package:doc_lab_pharm/ui/widget/button_widget.dart';
import 'package:doc_lab_pharm/ui/widget/text_widget.dart';

// ignore: must_be_immutable
class SecondOnboardingScreen extends StatelessWidget {
  SecondOnboardingScreen({super.key, required this.userType});

  String? userType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 70.w, horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: SvgPicture.asset(AppImage.mydoc),
            ),
            SizedBox(height: 20.h),
            Image.asset(
              AppImage.onboard,
              width: double.infinity.w,
              height: 300.h,
              fit: BoxFit.fitWidth,
            ),
            SizedBox(height: 30.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: TextView(
                text: 'Welcome',
                textStyle: GoogleFonts.gabarito(
                  color: AppColor.primary1,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: TextView(
                text: 'Ready to Begin Your Health Journey?',
                textStyle: GoogleFonts.gabarito(
                  color: AppColor.primary1,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: TextView(
                text:
                    'Sign up to book your first consultation or log in to continue.',
                textStyle: GoogleFonts.gabarito(
                  color: AppColor.black,
                  fontSize: 16.4.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 32.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: ButtonWidget(
                buttonText: 'Sign Up',
                buttonColor: AppColor.primary1,
                buttonBorderColor: AppColor.transparent,
                textStyle: GoogleFonts.dmSans(
                  color: AppColor.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
                onPressed:
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(userType: userType),
                      ),
                    ),
              ),
            ),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: ButtonWidget(
                buttonText: 'Log In',
                buttonColor: AppColor.white,
                buttonBorderColor: AppColor.primary1,
                textStyle: GoogleFonts.dmSans(
                  color: AppColor.primary1,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),

                onPressed:
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(userType: userType),
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
