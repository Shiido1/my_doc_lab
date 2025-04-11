import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_image.dart';

import '../../../widget/text_widget.dart';

class ConsultationScreen extends StatelessWidget {
  const ConsultationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.keyboard_arrow_left, size: 30.sp),
            ),
            SizedBox(height: 20.h),
            TextView(
              text: 'How do you wish to book?',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.grey,
                fontSize: 16.40.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20.h),
            Container(
              padding: EdgeInsets.only(
                top: 10.w,
                right: 14.w,
                left: 24.w,
                bottom: 10.w,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.primary1.withOpacity(.18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(14.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.primary1.withOpacity(.2),
                        ),
                        child: SvgPicture.asset(AppImage.aidbox),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            text: 'Virtual Consultation',
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.darkindgrey,
                              fontSize: 16.40.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 2.h),
                          SizedBox(
                            width: 200.w,
                            child: TextView(
                              text: 'Consult with a doctor over a secured call',
                              maxLines: 3,
                              textOverflow: TextOverflow.ellipsis,
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.darkindgrey,
                                fontSize: 13.40.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  TextView(
                    text: 'Per Consultation',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.darkindgrey,
                      fontSize: 12.40.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.h),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 2.w),
                              padding: EdgeInsets.all(3.w),
                              decoration: BoxDecoration(
                                color: AppColor.darkindgrey,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 7.2.w),
                            TextView(
                              text: 'Convenient & hassle free',
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.darkindgrey,
                                fontSize: 12.0.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 2.w),
                              padding: EdgeInsets.all(3.w),
                              decoration: BoxDecoration(
                                color: AppColor.darkindgrey,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 7.2.w),
                            TextView(
                              text: 'Secure Data Encrytion',
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.darkindgrey,
                                fontSize: 12.0.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 2.w),
                              padding: EdgeInsets.all(3.w),
                              decoration: BoxDecoration(
                                color: AppColor.darkindgrey,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 7.2.w),
                            TextView(
                              text:
                                  'Experts in a wide range of specializations',
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.darkindgrey,
                                fontSize: 12.0.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 2.w),
                              padding: EdgeInsets.all(3.w),
                              decoration: BoxDecoration(
                                color: AppColor.darkindgrey,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 7.2.w),
                            TextView(
                              text: 'One-on-one with a certified doctor',
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.darkindgrey,
                                fontSize: 12.0.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 2.w),
                              padding: EdgeInsets.all(3.w),
                              decoration: BoxDecoration(
                                color: AppColor.darkindgrey,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 7.2.w),
                            TextView(
                              text: 'Recommended treatment plans',
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.darkindgrey,
                                fontSize: 12.0.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              text: 'N 25,000',
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.darkindgrey,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10.w),
                              decoration: BoxDecoration(
                                color: AppColor.primary1,
                                borderRadius: BorderRadius.circular(22),
                              ),
                              child: TextView(
                                text: 'Book Now',
                                textStyle: GoogleFonts.gabarito(
                                  color: AppColor.white,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                ),
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
          ],
        ),
      ),
    );
  }
}
