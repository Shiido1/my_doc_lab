import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/screens/dashboard/home/diagnosis_cate_screen.dart/doctor_test_screen.dart';
import 'package:my_doc_lab/ui/screens/dashboard/patient/medicine_screen.dart';
import 'package:my_doc_lab/ui/screens/dashboard/notification/notification_screen.dart';
import 'package:my_doc_lab/ui/screens/dashboard/settings/profile_screen.dart';
import 'package:my_doc_lab/ui/widget/text_form_widget.dart';
import '../../../app_assets/app_image.dart';
import '../../../widget/text_widget.dart';
import '../laboratory/lab_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    final double? mainAxisExtent = isTablet ? null : 220.h;
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
                GestureDetector(
                  onTap:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => NotificationScreen(),
                        ),
                      ),
                  child: SvgPicture.asset(
                    AppImage.notification,
                    width: 24.w,
                    height: 24.w,
                  ),
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
                child: SvgPicture.asset(
                  AppImage.search,
                  height: 20.h,
                  width: 20.w,
                ),
              ),
              suffixWidget: Padding(
                padding: EdgeInsets.all(14.w),
                child: SvgPicture.asset(
                  AppImage.filter,
                  height: 20.h,
                  width: 20.w,
                ),
              ),
              // validator: AppValidator.validateEmail(),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                fourthContainer(context),
                SizedBox(width: 10.w),

                secondContainer(context),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                firstContainer(context),
                SizedBox(width: 10.w),
                thirdContainer(context),
              ],
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
                GestureDetector(
                  onTap:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DoctorTestScreen(tap: true),
                        ),
                      ),
                  child: TextView(
                    text: 'See all',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.primary,
                      fontSize: 14.0.sp,
                      fontWeight: FontWeight.w400,
                    ),
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
                      Platform.isIOS
                          ? mainAxisExtent
                          : 200, // Number of columns
                ),
                itemBuilder: (context, index) {
                  // Build each grid item based on the index
                  return GestureDetector(
                    onTap:
                        () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(),
                          ),
                        ),
                    child: Container(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                GestureDetector(
                  onTap:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => DoctorTestScreen(tap: false),
                        ),
                      ),
                  child: TextView(
                    text: 'See all',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.primary,
                      fontSize: 14.0.sp,
                      fontWeight: FontWeight.w400,
                    ),
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
                      width: 240.w,
                      child: TextView(
                        text:
                            'A blood test helps assess your overall health and detect a wide range of conditions, such as infections, anemia, and more. Common tests include Complete Blood Count (CBC) and Blood Sugar Analysis.',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.black.withOpacity(.7),
                          fontSize: 15.20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        textOverflow: TextOverflow.ellipsis,
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

  firstContainer(context) => Expanded(
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap:
              () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => MedicineScreen())),
          child: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.w),
            margin: EdgeInsets.only(top: 4.w),
            decoration: BoxDecoration(
              color: AppColor.white,

              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColor.darkindgrey.withOpacity(.2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // SizedBox(height: 6.0.h),
                TextView(
                  text: 'Medicine',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.darkindgrey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 10.h),
                TextView(
                  text:
                      'Get in touch with top pharmacists, order Drugs, have them delivered right to your doorstep.',
                  textAlign: TextAlign.end,
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.darkindgrey,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 4.8.w,
                    horizontal: 10.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.darkindgrey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextView(
                    text: 'Book Now',
                    textStyle: GoogleFonts.dmSans(
                      color: AppColor.white,
                      fontSize: 12.20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),

        Positioned(
          bottom: 1.7,
          left: -10,
          child: Image.asset(AppImage.doctor, height: 80.0.h, width: 100.w),
        ),
      ],
    ),
  );

  secondContainer(context) => Expanded(
    child: Stack(
      fit: StackFit.passthrough,
      children: [
        GestureDetector(
          onTap:
              () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DoctorTestScreen(tap: false),
                ),
              ),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.w),
            decoration: BoxDecoration(
              color: AppColor.darkindgrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColor.white),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: 10.h),
                TextView(
                  text: 'Schedule Home Test',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.white,
                    fontSize: 13.60.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 10.h),
                TextView(
                  text:
                      'Book diagnostic tests, have them don at the comfort of your\nhome.',
                  textAlign: TextAlign.start,
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.white,
                    fontSize: 11.60.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 4.8.w,
                    horizontal: 4.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextView(
                    text: 'Schedule Test',
                    textStyle: GoogleFonts.dmSans(
                      color: AppColor.darkindgrey,
                      fontSize: 11.80.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 18.h),
              ],
            ),
          ),
        ),

        Positioned(
          right: -39,
          bottom: -10,
          child: Image.asset(AppImage.femdoc, height: 140.h, width: 140.w),
        ),
      ],
    ),
  );

  thirdContainer(context) => Expanded(
    child: Stack(
      children: [
        GestureDetector(
          onTap:
              () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => LaboratoryScreen()),
              ),
          child: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.w),
            decoration: BoxDecoration(
              color: AppColor.primary1,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 5.0.h),
                TextView(
                  text: 'Laboratories',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.white,
                    fontSize: 13.60.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10.h),
                TextView(
                  text:
                      'Connect with tops labs, schedule your tests, and have your results delivered with ease.',
                  textAlign: TextAlign.end,
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 13.20.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 4.8.w,
                    horizontal: 10.0.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextView(
                    text: 'Book Now',
                    textStyle: GoogleFonts.dmSans(
                      color: AppColor.primary1,
                      fontSize: 12.0.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),

        Positioned(
          bottom: -14,
          left: -24.0,
          child: Image.asset(AppImage.lab_sci, height: 100.h, width: 100.w),
        ),
      ],
    ),
  );

  fourthContainer(context) => Expanded(
    child: Stack(
      children: [
        GestureDetector(
          onTap:
              () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DoctorTestScreen(tap: true),
                ),
              ),
          child: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 12.w),
            decoration: BoxDecoration(
              color: AppColor.blue,
              borderRadius: BorderRadius.circular(10),
              // border: Border.all(color: AppColor.white),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 10.h),
                TextView(
                  text: 'Book Appointment',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.white,
                    fontSize: 13.30.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 10.h),
                TextView(
                  text:
                      'Connect with top doctors and get expert care at your convenience.',
                  textAlign: TextAlign.end,
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.white,
                    fontSize: 11.6.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 4.8.w,
                    horizontal: 10.0.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextView(
                    text: 'Book Now',
                    textStyle: GoogleFonts.dmSans(
                      color: AppColor.blue,
                      fontSize: 12.20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),

        Positioned(
          bottom: 1.7,
          left: -1.2,
          child: Image.asset(AppImage.doc, height: 80.h, width: 100.w),
        ),
      ],
    ),
  );
}
