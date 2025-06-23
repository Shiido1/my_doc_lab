import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../app_assets/app_color.dart';
import '../../../../app_assets/app_image.dart';
import '../../../../widget/button_widget.dart';
import '../../../../widget/text_widget.dart';

class ConfirmTestScreen extends StatelessWidget {
  const ConfirmTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Tests',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 20.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SvgPicture.asset(
                  AppImage.notification,
                  width: 24.w,
                  height: 24.w,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: AppColor.primary1.withOpacity(.7),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: SvgPicture.asset(
                    AppImage.blood,
                    height: 40.h,
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
                        color: AppColor.primary1,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 10.w),
                    SizedBox(
                      width: 260.w,
                      child: TextView(
                        text:
                            'A blood test helps assess your overall health and detect a wide range of conditions, such as infections, anemia, and more. Common tests include Complete Blood Count (CBC) and Blood Sugar Analysis.',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.black.withOpacity(.7),
                          fontSize: 13.0.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 6,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Date',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.black,
                    fontSize: 18.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextView(
                  text: 'Edit',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.grey,
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(6.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.primary1.withOpacity(.17),
                  ),
                  child: SvgPicture.asset(
                    AppImage.calendar,
                    // ignore: deprecated_member_use
                    color: AppColor.primary1,
                  ),
                ),
                SizedBox(width: 20.w),
                TextView(
                  text: 'Wednesday, Jun 23, 2024 | 2:00 PM',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.black,
                    fontSize: 15.40.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Divider(color: AppColor.grey.withOpacity(.3), thickness: 1),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Location',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.black,
                    fontSize: 18.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextView(
                  text: 'Edit',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.grey,
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(6.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColor.primary1.withOpacity(.17),
                  ),
                  child: SvgPicture.asset(
                    AppImage.location,
                    color: AppColor.primary1,
                  ),
                ),
                SizedBox(width: 20.w),
                TextView(
                  text: 'No. 26 Jos St, Garki, Abuja.',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.black,
                    fontSize: 15.40.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Divider(color: AppColor.grey.withOpacity(.3), thickness: 1),
            SizedBox(height: 30.h),
            TextView(
              text: 'Payment Details',
              textStyle: GoogleFonts.dmSans(
                color: AppColor.black,
                fontSize: 18.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Consultation',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.grey,
                    fontSize: 14.80.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextView(
                  text: 'N10,000',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 14.80.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Discount',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.grey,
                    fontSize: 14.80.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextView(
                  text: 'N1000',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 14.80.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Total',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 18.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextView(
                  text: 'N10,000',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.primary1,
                    fontSize: 14.80.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 60.h),
            ButtonWidget(
              buttonText: 'Confirm Payment',
              buttonColor: AppColor.primary1,
              buttonBorderColor: AppColor.transparent,
              textStyle: GoogleFonts.dmSans(
                color: AppColor.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
              onPressed:
                  () => showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder:
                        (ctxt) => Dialog(
                          backgroundColor: Colors.transparent,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 20.w,
                            ),
                            margin: EdgeInsets.only(top: 200.w, bottom: 200.w),
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8.w),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.primary1,
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    color: AppColor.white,
                                    size: 30.sp,
                                  ),
                                ),
                                SizedBox(height: 30.h),
                                TextView(
                                  text: 'Payment Successful',
                                  textStyle: GoogleFonts.dmSans(
                                    color: AppColor.black,
                                    fontSize: 15.80.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                TextView(
                                  text: 'Your payment has been approved',
                                  textStyle: GoogleFonts.dmSans(
                                    color: AppColor.black,
                                    fontSize: 15.80.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 40.h),
                                ButtonWidget(
                                  buttonText: 'Go to Appointments',
                                  buttonHeight: 40,
                                  buttonColor: AppColor.primary1,
                                  buttonBorderColor: AppColor.transparent,
                                  textStyle: GoogleFonts.dmSans(
                                    color: AppColor.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
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
