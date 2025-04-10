import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../app_assets/app_color.dart';
import '../../../../widget/text_widget.dart';

class PatientResultsScreen extends StatelessWidget {
  const PatientResultsScreen({super.key});

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
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.keyboard_arrow_left, size: 30.sp),
                ),
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
              text: 'Results',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.primary1,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20.h),
            TextView(
              text: 'Blood Test',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.darkindgrey,
                fontSize: 17.2.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Divider(color: AppColor.friendlyPrimary),
          ],
        ),
      ),
    );
  }
}
