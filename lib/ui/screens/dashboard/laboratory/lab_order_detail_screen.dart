import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_image.dart';
import '../../../widget/text_widget.dart';

class LabOrderPatientDetailSceen extends StatefulWidget {
  const LabOrderPatientDetailSceen({super.key});

  @override
  State<LabOrderPatientDetailSceen> createState() =>
      _LabOrderPatientDetailSceenState();
}

class _LabOrderPatientDetailSceenState
    extends State<LabOrderPatientDetailSceen> {
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
              icon: Icon(Icons.arrow_back_ios_outlined, size: 20.sp),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(48.8.w),
                  decoration: BoxDecoration(
                    color: AppColor.oneKindgrey,
                    borderRadius: BorderRadius.circular(10),
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
                        fontSize: 17.0.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4.w),
                    TextView(
                      text: '35 years • Female',
                      textStyle: GoogleFonts.gabarito(
                        color: AppColor.greyIt,
                        fontSize: 15.0.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 4.w),
                    TextView(
                      text: 'Registation Date: 22 Apr, 2025',
                      textStyle: GoogleFonts.gabarito(
                        color: AppColor.greyIt,
                        fontSize: 15.0.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 4.w),
                    TextView(
                      text: 'Order No: #50',
                      textStyle: GoogleFonts.gabarito(
                        color: AppColor.greyIt,
                        fontSize: 15.0.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10.w),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 4.w,
                            horizontal: 8.w,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: AppColor.darkindgrey),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                AppImage.phone,
                                height: 14.h,
                                width: 14.w,
                                color: AppColor.darkindgrey,
                              ),
                              SizedBox(width: 4.w),
                              TextView(
                                text: 'Call',
                                textStyle: GoogleFonts.gabarito(
                                  color: AppColor.darkindgrey,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20.w),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 4.w,
                            horizontal: 8.w,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: AppColor.darkindgrey),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                AppImage.share,
                                height: 14.h,
                                width: 14.w,
                                color: AppColor.darkindgrey,
                              ),
                              SizedBox(width: 4.w),
                              TextView(
                                text: 'Share',
                                textStyle: GoogleFonts.gabarito(
                                  color: AppColor.darkindgrey,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10.w),
            Divider(color: AppColor.greyIt, thickness: 1),
            SizedBox(height: 10.w),

            Container(
              padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 8.w),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColor.grey),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Contact Information',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.darkindgrey,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(height: 6.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: 'Email',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.darkindgrey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextView(
                        text: 'sarah.j@example.com',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.darkindgrey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: 'Phone',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.darkindgrey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextView(
                        text: '(+234) 1234-4567',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.darkindgrey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: 'Address',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.darkindgrey,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextView(
                        text: 'No. 26 Jos St, Garki, Abuja',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.darkindgrey,
                          fontSize: 12.30.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 12.h),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColor.greyIt),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.primary1.withOpacity(.7),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6),
                        topRight: Radius.circular(6),
                      ),
                    ),
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.w,
                      ),
                      child: Row(
                        children: [
                          SvgPicture.asset(
                            AppImage.task,
                            color: AppColor.white,
                          ),
                          SizedBox(width: 10.w),
                          TextView(
                            text: 'Details',
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.white,
                              fontSize: 14.8.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 14.h),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 4.w,
                    ),
                    child: TextView(
                      text: 'Next Appointment',
                      textStyle: GoogleFonts.gabarito(
                        color: AppColor.grey,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 4.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextView(
                          text: 'COVID-19',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.grey,
                            fontSize: 15.6.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextView(
                          text: '12 Dec, 2025',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.grey,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 4.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextView(
                          text: 'Blood Test',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.grey,
                            fontSize: 15.6.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextView(
                          text: '12 Dec, 2025',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.grey,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 4.w,
                    ),
                    child: TextView(
                      text: 'Last Appointment',
                      textStyle: GoogleFonts.gabarito(
                        color: AppColor.grey,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 4.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextView(
                          text: 'X-Ray',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.grey,
                            fontSize: 15.6.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextView(
                          text: '12 Dec, 2025',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.grey,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
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
