import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_image.dart';
import 'package:my_doc_lab/ui/widget/text_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.keyboard_arrow_left, size: 30.sp),
                ),
                TextView(
                  text: 'Notification',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.black,
                    fontSize: 20.0.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                GestureDetector(
                  // onTap:
                  //     () => Navigator.of(context).push(
                  //       MaterialPageRoute(
                  //         builder: (context) => PatientDetailComplaintScreen(),
                  //       ),
                  //     ),
                  child: SvgPicture.asset(
                    AppImage.settings,
                    width: 24.w,
                    height: 24.w,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            TextView(
              text: 'Today',
              textStyle: GoogleFonts.dmSans(
                color: AppColor.black,
                fontSize: 18.0.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 16.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                border: Border.all(
                  color: AppColor.funnyLookingGrey.withOpacity(.4),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: AppColor.fineRed.withOpacity(.2),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      AppImage.not,
                      width: 24.w,
                      height: 24.w,
                    ),
                  ),
                  SizedBox(width: 18.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text: 'Appointment Reminder',
                        textStyle: GoogleFonts.dmSans(
                          color: AppColor.black,
                          fontSize: 15.0.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 2.h),
                      SizedBox(
                        width: 240.w,
                        child: TextView(
                          text:
                              'You have successfully canceled your appointment with Dr Uju Odoh',
                          maxLines: 2,
                          textOverflow: TextOverflow.ellipsis,
                          textStyle: GoogleFonts.dmSans(
                            color: AppColor.black,
                            fontSize: 13.0.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      TextView(
                        text: '1 minute ago',

                        textStyle: GoogleFonts.dmSans(
                          color: AppColor.funnyLookingGrey,
                          fontSize: 11.0.sp,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
