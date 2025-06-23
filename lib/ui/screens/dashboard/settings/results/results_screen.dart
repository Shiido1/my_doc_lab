import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_image.dart';
import 'package:my_doc_lab/ui/screens/dashboard/settings/results/patient_result_screen.dart';

import '../../../../widget/text_widget.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Results',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.darkindgrey,
                    fontSize: 20.0.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20.h, width: 20.w),
              ],
            ),
            SizedBox(height: 20.h),
            TextView(
              text: 'Results List',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.black,
                fontSize: 18.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Divider(color: AppColor.friendlyPrimary),
            SizedBox(height: 15.0.h),

            ...[1, 2, 2].map(
              (i) => GestureDetector(
                onTap:
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PatientResultsScreen(),
                      ),
                    ),
                child: Container(
                  margin: EdgeInsets.only(bottom: 10.w),
                  color: AppColor.transparent,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(16.w),
                            decoration: BoxDecoration(
                              color: AppColor.primary1.withOpacity(.3),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: SvgPicture.asset(
                              AppImage.blood,
                              height: 40.h,
                              color: AppColor.primary1,
                              width: 50.w,
                            ),
                          ),
                          SizedBox(width: 20.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextView(
                                text: 'Blood Test',
                                textStyle: GoogleFonts.gabarito(
                                  color: AppColor.primary,
                                  fontSize: 18.0.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 4.h),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 1.4.w,
                                  horizontal: 16.w,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColor.blue,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextView(
                                  text: 'Available',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.white,
                                    fontSize: 14.20.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(height: 4.h),
                              TextView(
                                text: 'Date: 12/05/2024',
                                textStyle: GoogleFonts.gabarito(
                                  color: AppColor.grey1,
                                  fontSize: 18.0.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Divider(color: AppColor.friendlyPrimary),
                    ],
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
