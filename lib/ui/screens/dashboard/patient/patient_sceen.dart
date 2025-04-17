import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/screens/dashboard/patient/patient_detail_sceen.dart';

import '../../../app_assets/app_image.dart';
import '../../../widget/text_form_widget.dart';
import '../../../widget/text_widget.dart';

class PatientSceen extends StatelessWidget {
  const PatientSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 22.w),
        child: Column(
          children: [
            SizedBox(height: 10.h),
            Center(
              child: TextView(
                text: 'Patients',
                textStyle: GoogleFonts.gabarito(
                  color: AppColor.black,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 20.w),
            TextFormWidget(
              label: 'Search for Patients',
              // hint: 'Email Address',
              border: 10,
              isFilled: true,
              fillColor: AppColor.transparent,
              // controller: fullnameTextController,
              prefixWidget: Padding(
                padding: EdgeInsets.all(14.w),
                child: SvgPicture.asset(
                  AppImage.search,
                  height: 20.h,
                  width: 20.w,
                ),
              ),
              suffixWidget: Padding(
                padding: EdgeInsets.all(14.w),
                child: SvgPicture.asset(
                  AppImage.personPlus,
                  height: 20.h,
                  width: 20.w,
                ),
              ),
              // validator: AppValidator.validateEmail(),
            ),
            SizedBox(height: 30.h),
            ...[1, 2, 3, 3].map(
              (i) => GestureDetector(
                onTap:
                    () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PatientDetailSceen(),
                      ),
                    ),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 8.w),
                  margin: EdgeInsets.only(bottom: 14.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColor.oneKindgrey),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(28.8.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.oneKindgrey,
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            text: 'Sarah Johnson',
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.darkindgrey,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 4.w),
                          TextView(
                            text: '35 years • Female',
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.greyIt,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 10.w),
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppImage.task,
                                height: 16.h,
                                width: 16.w,
                              ),
                              SizedBox(width: 6.w),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 2.w,
                                  horizontal: 6.w,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColor.friendlyPrimary,
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                child: TextView(
                                  text: 'Appointment: 4/17/2025',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.primary1,
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
