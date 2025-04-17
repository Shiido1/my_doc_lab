import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_image.dart';
import 'package:my_doc_lab/ui/onboarding/third_onboarding_screen.dart';
import 'package:my_doc_lab/ui/widget/button_widget.dart';
import 'package:my_doc_lab/ui/widget/text_widget.dart';

// ignore: must_be_immutable
class FirstOnboardingScreen extends StatefulWidget {
  const FirstOnboardingScreen({super.key});

  @override
  State<FirstOnboardingScreen> createState() => _FirstOnboardingScreenState();
}

class _FirstOnboardingScreenState extends State<FirstOnboardingScreen> {
  List<String> imageList = [AppImage.first, AppImage.third, AppImage.second];
  List<String> text1 = [
    'Your Health, Simplified',
    'Connect with Top Doctors\nAnytime, Anywhere.',
    'Stay On Top of Your Health.',
  ];
  List<String> text2 = [
    'Book consultations, schedule tests, and get\nprescriptions—all in one place.',
    'Browse qualified doctors, view profiles,\nand book consultations in a few taps.',
    'Get drug prescriptions and schedule tests\nconveniently through the app.',
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(imageList[index], fit: BoxFit.fitWidth),
          Positioned(
            left: 20,
            top: 60,
            child: SvgPicture.asset(AppImage.mydoc),
          ),
          index == 0
              ? Positioned(
                left: 30,
                bottom: 300,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: text1[index],
                      textStyle: GoogleFonts.dmSans(
                        color: AppColor.primary1,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextView(
                      text: text2[index],
                      textStyle: GoogleFonts.gabarito(
                        color: AppColor.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              )
              : Positioned(
                left: 40,
                top: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: text1[index],
                      textStyle: GoogleFonts.dmSans(
                        color: AppColor.primary1,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    TextView(
                      text: text2[index],
                      textStyle: GoogleFonts.gabarito(
                        color: AppColor.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
          Positioned(
            bottom: 80, // Adjust this value as needed
            left: 0,
            right: 0,
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 300.w,
                height: 44.0.h,
                child: ButtonWidget(
                  buttonText: index < 1 ? 'Get Started' : 'Continue',
                  buttonColor: AppColor.primary1,
                  buttonBorderColor: AppColor.transparent,
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.white,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  onPressed: () {
                    if (index > 1) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ThirdOnboardingScreen(),
                        ),
                      );
                    } else {
                      setState(() {
                        index += 1;
                      });
                    }
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
