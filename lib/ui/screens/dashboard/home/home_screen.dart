import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/widget/text_form_widget.dart';

import '../../../app_assets/app_image.dart';
import '../../../widget/text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 17.2.w, vertical: 50.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.w),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(20.w),
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
                      text: 'Hello John!',
                      textStyle: GoogleFonts.dmSans(
                        color: AppColor.black,
                        fontSize: 19.20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextView(
                      text: 'How can we help you today?',
                      textStyle: GoogleFonts.gabarito(
                        color: AppColor.greyIt,
                        fontSize: 14.20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                SvgPicture.asset(AppImage.cart, width: 24.w, height: 24.w),
                SizedBox(width: 20.w),
                SvgPicture.asset(
                  AppImage.notification,
                  width: 24.w,
                  height: 24.w,
                ),
              ],
            ),
            SizedBox(height: 20.w),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 14.w, horizontal: 18.w),
              decoration: BoxDecoration(
                color: AppColor.primary1.withOpacity(.6),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColor.white),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Available Balance',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.white,
                      fontSize: 13.20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppImage.wallet,
                        width: 20.w,
                        height: 20.w,
                        color: AppColor.white,
                      ),
                      SizedBox(width: 10.w),
                      TextView(
                        text: '20,000.00',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.white,
                          fontSize: 20.0.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            TextFormWidget(
              label: 'Search for doctors, specialties, or tests...',
              // hint: 'Email Address',
              border: 10,
              isFilled: true,
              fillColor: AppColor.transparent,
              // controller: fullnameTextController,
              prefixWidget: Padding(
                padding: EdgeInsets.all(14.w),
                child: SvgPicture.asset(AppImage.search),
              ),
              suffixWidget: Padding(
                padding: EdgeInsets.all(14.w),
                child: SvgPicture.asset(AppImage.filter),
              ),
              // validator: AppValidator.validateEmail(),
            ),
            SizedBox(height: 20.h),
            Stack(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 20.w,
                    horizontal: 12.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.blue,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColor.white),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(top: 20.w, bottom: 20.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextView(
                          text: 'Book an Appointment',
                          textStyle: GoogleFonts.dmSans(
                            color: AppColor.white,
                            fontSize: 17.80.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        TextView(
                          text:
                              'Connect with top doctors and get\nexpert care at your convenience.',
                          textAlign: TextAlign.center,
                          textStyle: GoogleFonts.dmSans(
                            color: AppColor.white,
                            fontSize: 11.54.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 4.8.w,
                            horizontal: 56.0.w,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextView(
                            text: 'Book Now',
                            textStyle: GoogleFonts.dmSans(
                              color: AppColor.blue,
                              fontSize: 13.20.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 2.2,
                  left: 3,
                  child: Image.asset(AppImage.doc, height: 160.h, width: 180.w),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  firstContainer(),
                  secondContainer(),
                  thirdContainer(),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            TextView(
              text: 'Upcoming Appointments',
              textStyle: GoogleFonts.dmSans(
                color: AppColor.primary1,
                fontSize: 16.20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Our Doctors',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.black,
                    fontSize: 16.20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextView(
                  text: 'See all',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.primary,
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            SizedBox(
              height: 370.h,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  mainAxisExtent:
                      Platform.isIOS ? 240 : 200, // Number of columns
                ),
                itemBuilder: (context, index) {
                  // Build each grid item based on the index
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: AppColor.funnyLookingGrey.withOpacity(.3),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                          child: Image.asset(
                            AppImage.finedoc,
                            height: 120.h,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextView(
                                text: 'Dr Bolu Adeleke',
                                textStyle: GoogleFonts.gabarito(
                                  color: AppColor.black,
                                  fontSize: 16.0.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextView(
                                text: 'Cardiologist',
                                textStyle: GoogleFonts.gabarito(
                                  color: AppColor.grey,
                                  fontSize: 12.0.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(height: 14.0.h),
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 1.w,
                                      horizontal: 4.w,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: AppColor.primary,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: AppColor.white,
                                          size: 15.0.sp,
                                        ),
                                        SizedBox(width: 2.w),
                                        TextView(
                                          text: '4.8',
                                          textStyle: GoogleFonts.dmSans(
                                            color: AppColor.white,
                                            fontSize: 12.0.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: 20.h),
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        AppImage.location,
                                        height: 15.2.h,
                                        width: 16.2.w,
                                      ),
                                      SizedBox(width: 2.w),
                                      TextView(
                                        text: '800m away',
                                        textStyle: GoogleFonts.gabarito(
                                          color: AppColor.black,
                                          fontSize: 12.0.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: 20, // Number of items in the grid
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Tests',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.black,
                    fontSize: 16.20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextView(
                  text: 'See all',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.primary,
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.w400,
                  ),
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
                        fontSize: 18.20.sp,
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
                          fontSize: 15.20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 6,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  firstContainer() => Stack(
    clipBehavior: Clip.none,
    children: [
      Container(
        alignment: Alignment.centerRight,
        width: 340.w,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        margin: EdgeInsets.only(right: 12.w),
        decoration: BoxDecoration(
          color: AppColor.primary1,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColor.white),
        ),
        child: Container(
          margin: EdgeInsets.only(bottom: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 10.h),
              TextView(
                text: 'Medicine',
                textStyle: GoogleFonts.dmSans(
                  color: AppColor.white,
                  fontSize: 17.80.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextView(
                text:
                    'Get in touch with top pharmacists,\norder your medications, and have\nthem delivered right to your\ndoorstep.',
                textAlign: TextAlign.start,
                textStyle: GoogleFonts.dmSans(
                  color: AppColor.white,
                  fontSize: 11.54.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 6.h),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 4.8.w,
                  horizontal: 50.w,
                ),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextView(
                  text: 'Book Now',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.blue,
                    fontSize: 13.20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        left: -6,
        bottom: -14,
        child: Image.asset(AppImage.doctor, height: 152.0.h, width: 140.w),
      ),
    ],
  );

  secondContainer() => Stack(
    fit: StackFit.passthrough,
    children: [
      Container(
        alignment: Alignment.centerLeft,
        width: 340.w,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        margin: EdgeInsets.only(right: 12.w),
        decoration: BoxDecoration(
          color: AppColor.darkindgrey,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColor.white),
        ),
        child: Container(
          margin: EdgeInsets.only(bottom: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              TextView(
                text: 'Schedule a Home Test',
                textStyle: GoogleFonts.dmSans(
                  color: AppColor.white,
                  fontSize: 17.80.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10.h),
              TextView(
                text:
                    'Book diagnostic tests and have\nthem done in the\ncomfort of your home.',
                textAlign: TextAlign.start,
                textStyle: GoogleFonts.dmSans(
                  color: AppColor.white,
                  fontSize: 11.54.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 4.8.w,
                  horizontal: 40.w,
                ),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextView(
                  text: 'Schedule Test',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.darkindgrey,
                    fontSize: 13.20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(height: 6.h),
            ],
          ),
        ),
      ),
      Positioned(
        right: 1,
        bottom: -30,
        child: Image.asset(AppImage.femdoc, height: 200.0.h, width: 160.w),
      ),
    ],
  );

  thirdContainer() => Stack(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        width: 340.w,
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        margin: EdgeInsets.only(right: 12.w),
        decoration: BoxDecoration(
          color: AppColor.primary1,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColor.white),
        ),
        child: Container(
          margin: EdgeInsets.only(bottom: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10.h),
              TextView(
                text: 'Laboratories',
                textStyle: GoogleFonts.dmSans(
                  color: AppColor.white,
                  fontSize: 17.80.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
              TextView(
                text:
                    'Connect with leading laboratories,\nschedule your tests, and have\nyour results delivered to you\nwith ease.',
                textAlign: TextAlign.start,
                textStyle: GoogleFonts.dmSans(
                  color: AppColor.white,
                  fontSize: 11.54.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10.h),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 4.8.w,
                  horizontal: 40.0.w,
                ),
                decoration: BoxDecoration(
                  color: AppColor.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextView(
                  text: 'Book Now',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.primary1,
                    fontSize: 13.20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        right: 19,
        top: 10.0,
        child: Image.asset(AppImage.lab_sci, height: 192.0.h, width: 160.w),
      ),
    ],
  );
}
