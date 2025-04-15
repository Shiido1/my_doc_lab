import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/screens/dashboard/notification/notification_screen.dart';
import 'package:my_doc_lab/ui/widget/text_form_widget.dart';
import '../../../app_assets/app_image.dart';
import '../../../widget/text_widget.dart';

class PharmacyHomeScreen extends StatelessWidget {
  const PharmacyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    // final double? mainAxisExtent = isTablet ? null : 220.h;
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.w),
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
                      text: 'Welcome back',
                      textStyle: GoogleFonts.dmSans(
                        color: AppColor.black,
                        fontSize: 19.20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextView(
                      text: 'Dr. Mitchell',
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
            TextFormWidget(
              label: 'Search for Medicine ...',
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
                pharmContainer(
                  context,
                  image: AppImage.aid_symb,
                  text1: 'Good',
                  text2: 'Inventory Status',
                  text3: 'View Detailed Report',

                  color: AppColor.primary1,
                ),
                SizedBox(width: 10.w),

                Expanded(
                  child: pharmContainer(
                    context,
                    image: AppImage.double_box,
                    text1: 'N 8,55,875',
                    text2: 'Revenue: Jan 2022',
                    text3: 'View Detailed Report',

                    color: AppColor.darkindgrey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              children: [
                pharmContainer(
                  context,
                  image: AppImage.aid_box,
                  text1: '299',
                  text2: 'Medicines Available',
                  text3: 'Visit Inventory',

                  color: AppColor.darkindgrey,
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: pharmContainer(
                    context,
                    image: AppImage.traingle,
                    text1: '01',
                    text2: 'Medicine Shortage',
                    text3: 'Resolve Now',
                    color: AppColor.primary1,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Card(
              elevation: 2,
              margin: EdgeInsets.only(bottom: 10.w),
              shadowColor: AppColor.greyIt,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: AppColor.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text: 'Quick Report',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.greyIt,
                            fontSize: 20.20.sp,
                            letterSpacing: -1,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        TextView(
                          text: '70,856',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.greyIt,
                            fontSize: 22.20.sp,
                            letterSpacing: -1,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        TextView(
                          text: 'Qty of Medicines Sold',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.greyIt,
                            fontSize: 14.20.sp,
                            letterSpacing: -1,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(height: 10.h),
                        TextView(
                          text: 'January 2022',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.greyIt,
                            fontSize: 15.20.sp,
                            letterSpacing: -1,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 20.h),
                        TextView(
                          text: '7856',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.greyIt,
                            fontSize: 22.20.sp,
                            letterSpacing: -1,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        TextView(
                          text: 'Invoices Generated',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.greyIt,
                            letterSpacing: -1,
                            fontSize: 13.20.sp,
                            fontWeight: FontWeight.w600,
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

  pharmContainer(context, {image, text1, text2, text3, color}) =>
      GestureDetector(
        onTap: () {},
        child: Container(
          // alignment: Alignment.centerRight,
          padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 12.w),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
            // border: Border.all(color: AppColor.white),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10.h),
              SvgPicture.asset(image, height: 22.h, width: 22.w),
              SizedBox(height: 10.h),
              TextView(
                text: text1,
                textStyle: GoogleFonts.poppins(
                  color: AppColor.white,
                  fontSize: 20.30.sp,
                  letterSpacing: -1,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 10.h),
              TextView(
                text: text2,
                textAlign: TextAlign.end,
                textStyle: GoogleFonts.poppins(
                  color: AppColor.white,
                  fontSize: 16.6.sp,
                  fontWeight: FontWeight.w500,
                  letterSpacing: -1,
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextView(
                    text: text3,
                    textStyle: GoogleFonts.dmSans(
                      color: AppColor.white,
                      fontSize: 13.20.sp,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(width: 6.h),
                  SvgPicture.asset(
                    AppImage.double_arrow,
                    height: 8.h,
                    width: 8.w,
                  ),
                ],
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      );
}
