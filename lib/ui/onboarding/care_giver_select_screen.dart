import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_image.dart';
import 'package:my_doc_lab/ui/screens/dashboard/doctor_dashboard_screen.dart';
import 'package:my_doc_lab/ui/screens/dashboard/lab_dashboard_screen.dart';
import 'package:my_doc_lab/ui/screens/dashboard/pharmacy_dashboard_screen.dart';
import 'package:my_doc_lab/ui/widget/text_widget.dart';

// ignore: must_be_immutable
class CareGiverSelectScreen extends StatefulWidget {
  const CareGiverSelectScreen({super.key});

  @override
  State<CareGiverSelectScreen> createState() => _CareGiverSelectScreenState();
}

class _CareGiverSelectScreenState extends State<CareGiverSelectScreen> {
  String prof = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 60.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            TextView(
              text: 'Select Healthcare Profession',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.darkindgrey,
                fontSize: 22.4.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 30.h),
            GestureDetector(
              onTap:
                  () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => DocDashboard()),
                  ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: AppColor.lightgrey),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      AppImage.doctor_svg,
                      height: 20.h,
                      width: 20.w,
                    ),
                    SizedBox(width: 22.w),
                    TextView(
                      text: 'Doctor',
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
            GestureDetector(
              onTap:
                  () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PharmacyDashboard(),
                    ),
                  ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: AppColor.lightgrey),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      AppImage.pharmacist,
                      height: 20.h,
                      width: 20.w,
                    ),

                    SizedBox(width: 22.w),
                    TextView(
                      text: 'Pharmacist',
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
            GestureDetector(
              onTap:
                  () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => LaboratoryDashboard(),
                    ),
                  ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  border: Border.all(color: AppColor.lightgrey),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      AppImage.lab_sci_svg,
                      height: 20.h,
                      width: 20.w,
                    ),

                    SizedBox(width: 22.w),
                    TextView(
                      text: 'Laboratory Attendant',
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
          ],
        ),
      ),
    );
  }
}
