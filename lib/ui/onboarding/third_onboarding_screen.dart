import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:doc_lab_pharm/ui/app_assets/app_color.dart';
import 'package:doc_lab_pharm/ui/app_assets/app_image.dart';
import 'package:doc_lab_pharm/ui/onboarding/second_onboarding_screen.dart';
import 'package:doc_lab_pharm/ui/widget/text_widget.dart';

class ThirdOnboardingScreen extends StatefulWidget {
  const ThirdOnboardingScreen({super.key});

  @override
  State<ThirdOnboardingScreen> createState() => _ThirdOnboardingScreenState();
}

class _ThirdOnboardingScreenState extends State<ThirdOnboardingScreen> {
  String selectedOption = '';

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
            SizedBox(height: 10.h),
            Center(
              child: Column(
                children: [
                  TextView(
                    text: 'Hello',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.darkindgrey,
                      fontSize: 28.4.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextView(
                    text: 'Tell us a bit about yourself',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.darkindgrey,
                      fontSize: 18.4.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  TextView(
                    text: 'I\'m a',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.darkindgrey,
                      fontSize: 27.4.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = 'patient';
                      });
                    },
                    child: Container(
                      width: 230.w,
                      padding: EdgeInsets.symmetric(
                        vertical: 5.2.w,
                        horizontal: 28.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColor.primary1,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextView(
                            text: 'Patient',
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.white,
                              fontSize: 22.4.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: 10.2.w),
                          Radio<String>(
                            value: 'patient',
                            groupValue: selectedOption,
                            fillColor: WidgetStateProperty.all(AppColor.white),
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value!;
                              });
                            }, // Autofocus is optional, depending on the app's needs.
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 23.10.h),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedOption = 'care-giver';
                      });
                    },
                    child: Container(
                      width: 230.w,
                      padding: EdgeInsets.symmetric(
                        vertical: 5.2.w,
                        horizontal: 28.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColor.primary1,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextView(
                            text: 'Care Giver',
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.white,
                              fontSize: 22.4.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: 10.2.w),
                          Radio<String>(
                            value: 'care-giver',
                            groupValue: selectedOption,
                            fillColor: WidgetStateProperty.all(AppColor.white),
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value!;
                              });
                            }, // Autofocus is optional, depending on the app's needs.
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 43.10.h),
                  GestureDetector(
                    onTap:
                        selectedOption == ''
                            ? () {}
                            : () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder:
                                    (context) => SecondOnboardingScreen(
                                      userType: selectedOption,
                                    ),
                              ),
                            ),
                    child: Container(
                      padding: EdgeInsets.all(14.20.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.primary1,
                      ),
                      child: Icon(
                        Icons.arrow_forward,
                        color: AppColor.white,
                        size: 30.sp,
                      ),
                    ),
                  ),

                  SizedBox(height: 43.10.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
