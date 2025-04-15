import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_image.dart';

import '../../../widget/text_form_widget.dart';
import '../../../widget/text_widget.dart';

class PatientDetailSceen extends StatefulWidget {
  const PatientDetailSceen({super.key});

  @override
  State<PatientDetailSceen> createState() => _PatientDetailSceenState();
}

class _PatientDetailSceenState extends State<PatientDetailSceen> {
  String tab = 'Overview';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Padding(
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
                                AppImage.chat,
                                height: 14.h,
                                width: 14.w,
                                color: AppColor.darkindgrey,
                              ),
                              SizedBox(width: 4.w),
                              TextView(
                                text: 'Message',
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

            Row(
              children: [
                GestureDetector(
                  onTap: () => setState(() => tab = 'Overview'),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 4.w,
                      horizontal: 14.w,
                    ),
                    decoration: BoxDecoration(
                      // ignore: deprecated_member_use
                      color:
                          tab == 'Overview'
                              ? AppColor.primary1
                              : AppColor.transparent,

                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextView(
                      text: 'Overview',
                      textStyle: GoogleFonts.dmSans(
                        color:
                            tab == 'Overview'
                                ? AppColor.white
                                : AppColor.primary1,
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 20.w),
                GestureDetector(
                  onTap: () => setState(() => tab = 'Records'),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 4.w,
                      horizontal: 14.w,
                    ),
                    decoration: BoxDecoration(
                      // ignore: deprecated_member_use
                      color:
                          tab == 'Records'
                              ? AppColor.primary1
                              : AppColor.transparent,

                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextView(
                      text: 'Records',
                      textStyle: GoogleFonts.dmSans(
                        color:
                            tab == 'Records'
                                ? AppColor.white
                                : AppColor.primary1,
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: 20.w),
                GestureDetector(
                  onTap: () => setState(() => tab = 'Metrics'),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 4.w,
                      horizontal: 14.w,
                    ),
                    decoration: BoxDecoration(
                      // ignore: deprecated_member_use
                      color:
                          tab == 'Metrics'
                              ? AppColor.primary1
                              : AppColor.transparent,

                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextView(
                      text: 'Metrics',
                      textStyle: GoogleFonts.dmSans(
                        color:
                            tab == 'Metrics'
                                ? AppColor.white
                                : AppColor.primary1,
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (tab == 'Overview')
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 4.w,
                              horizontal: 8.w,
                            ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          text: 'Upcoming Appointment',
                                          textStyle: GoogleFonts.gabarito(
                                            color: AppColor.white,
                                            fontSize: 14.8.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Spacer(),
                                        TextView(
                                          text: 'Reschedules',
                                          textStyle: GoogleFonts.gabarito(
                                            color: AppColor.white,
                                            fontSize: 14.8.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(width: 4.w),
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
                                    text: '4/18/2025',
                                    textStyle: GoogleFonts.gabarito(
                                      color: AppColor.grey,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                    vertical: 4.w,
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppImage.time,
                                        color: AppColor.grey,
                                      ),
                                      SizedBox(width: 6.w),
                                      TextView(
                                        text: '10:30 AM',
                                        textStyle: GoogleFonts.gabarito(
                                          color: AppColor.grey,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 4.w,
                                          horizontal: 10.w,
                                        ),
                                        decoration: BoxDecoration(
                                          // ignore: deprecated_member_use
                                          color: AppColor.primary1,

                                          borderRadius: BorderRadius.circular(
                                            22,
                                          ),
                                        ),
                                        child: TextView(
                                          text: 'Follow Up',
                                          textStyle: GoogleFonts.gabarito(
                                            color: AppColor.white,
                                            fontSize: 12.0.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 4.h),
                                Divider(color: AppColor.greyIt),
                                SizedBox(height: 6.h),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10.w,
                                    vertical: 4.w,
                                  ),
                                  child: TextView(
                                    text: 'Blood pressure check',
                                    textStyle: GoogleFonts.gabarito(
                                      color: AppColor.grey,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 6.h),
                              ],
                            ),
                          ),

                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AppImage.pres,
                                    height: 12.h,
                                    width: 12.w,
                                  ),
                                  SizedBox(width: 6.w),
                                  TextView(
                                    text: 'Prescriptions',
                                    textStyle: GoogleFonts.gabarito(
                                      color: AppColor.darkindgrey,
                                      fontSize: 16.20.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: TextView(
                                  text: 'View all',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.primary,
                                    fontSize: 14.0.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 4.w,
                              horizontal: 8.w,
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColor.grey),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text: 'Lisinopril',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.darkindgrey,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),

                                    SizedBox(height: 6.h),
                                    TextView(
                                      text: 'Once daily',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.darkindgrey,
                                        fontSize: 15.0.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: 6.h),
                                    TextView(
                                      text: 'Take in the morning with food',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.darkindgrey,
                                        fontSize: 15.0.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 2.4.w,
                                    horizontal: 8.w,
                                  ),
                                  decoration: BoxDecoration(
                                    // ignore: deprecated_member_use
                                    border: Border.all(color: AppColor.greyIt),
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: TextView(
                                    text: '10 mg',
                                    textStyle: GoogleFonts.gabarito(
                                      color: AppColor.greyIt,
                                      fontSize: 15.0.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AppImage.ste,
                                    height: 12.h,
                                    width: 12.w,
                                  ),
                                  SizedBox(width: 6.w),
                                  TextView(
                                    text: 'Medical History',
                                    textStyle: GoogleFonts.gabarito(
                                      color: AppColor.darkindgrey,
                                      fontSize: 16.20.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: TextView(
                                  text: 'View all',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.primary,
                                    fontSize: 14.0.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 4.w,
                              horizontal: 8.w,
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColor.grey),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextView(
                                      text: 'Hypertension',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.darkindgrey,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextView(
                                      text: '9/10/2021',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.darkindgrey.withOpacity(
                                          .4,
                                        ),
                                        fontSize: 15.0.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 6.h),
                                TextView(
                                  text: 'Prescribed lisinopril 10mg daily',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.darkindgrey,
                                    fontSize: 15.0.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 4.w,
                              horizontal: 8.w,
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColor.grey),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextView(
                                      text: 'Seasonal allergies',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.darkindgrey,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextView(
                                      text: '9/10/2021',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.darkindgrey.withOpacity(
                                          .4,
                                        ),
                                        fontSize: 15.0.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 6.h),
                                TextView(
                                  text: 'Recommended OTC antihistamines',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.darkindgrey,
                                    fontSize: 15.0.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12.h),
                        ],
                      )
                    else if (tab == 'Records')
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextView(
                                text: 'Medical Records',
                                textStyle: GoogleFonts.gabarito(
                                  color: AppColor.darkindgrey,
                                  fontSize: 16.20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 4.w,
                                    horizontal: 14.w,
                                  ),
                                  decoration: BoxDecoration(
                                    // ignore: deprecated_member_use
                                    color: AppColor.primary1,

                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.add_circle_outline_sharp,
                                        color: AppColor.white,
                                        size: 20.sp,
                                      ),
                                      SizedBox(width: 6.w),
                                      TextView(
                                        text: 'Add Record',
                                        textStyle: GoogleFonts.gabarito(
                                          color: AppColor.white,
                                          fontSize: 12.80.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 4.w,
                              horizontal: 8.w,
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColor.grey),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextView(
                                      text: 'Hypertension',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.darkindgrey,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextView(
                                      text: '9/10/2021',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.darkindgrey.withOpacity(
                                          .4,
                                        ),
                                        fontSize: 15.0.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 6.h),
                                TextView(
                                  text: 'Prescribed lisinopril 10mg daily',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.darkindgrey,
                                    fontSize: 15.0.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 20.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 4.w,
                              horizontal: 8.w,
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColor.grey),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextView(
                                      text: 'Seasonal allergies',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.darkindgrey,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextView(
                                      text: '9/10/2021',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.darkindgrey.withOpacity(
                                          .4,
                                        ),
                                        fontSize: 15.0.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 6.h),
                                TextView(
                                  text: 'Recommended OTC antihistamines',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.darkindgrey,
                                    fontSize: 15.0.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.h),
                          TextView(
                            text: 'Appointment History',
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.darkindgrey,
                              fontSize: 16.20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 4.w,
                              horizontal: 8.w,
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColor.grey),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextView(
                                      text: 'Follow-up',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.darkindgrey,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    TextView(
                                      text: 'Scheduled',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.darkindgrey.withOpacity(
                                          .4,
                                        ),
                                        fontSize: 15.0.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                TextView(
                                  text: '4/18/2025 - 10:30 AM',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.darkindgrey,
                                    fontSize: 15.0.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                TextView(
                                  text: 'Blood pressure check',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.darkindgrey,
                                    fontSize: 15.0.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    else
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormWidget(
                            label: '',
                            border: 10,
                            isFilled: true,
                            fillColor: AppColor.oneKindgrey,
                            borderColor: AppColor.transparent,
                            maxline: 7,
                            alignLabelWithHint: true,
                            // controller: emailTextController,
                            // prefixWidget: Padding(
                            //   padding: EdgeInsets.all(9.2.w),
                            //   child: SvgPicture.asset(AppImage.message),
                            // ),
                            // validator: AppValidator.validateEmail(),
                          ),
                          SizedBox(height: 20.h),
                          GestureDetector(
                            onTap: () {},
                            child: Center(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 8.w,
                                  horizontal: 14.w,
                                ),
                                width: 240.w,
                                decoration: BoxDecoration(
                                  // ignore: deprecated_member_use
                                  color: AppColor.primary1,

                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.add_circle_outline_sharp,
                                      color: AppColor.white,
                                      size: 20.sp,
                                    ),
                                    SizedBox(width: 6.w),
                                    TextView(
                                      text: 'Add Record',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.white,
                                        fontSize: 12.80.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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
