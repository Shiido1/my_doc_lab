import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/screens/dashboard/notification/notification_screen.dart';
import 'package:my_doc_lab/ui/screens/dashboard/tasks/tasks_screen.dart';
import 'package:my_doc_lab/ui/widget/text_form_widget.dart';
import '../../../app_assets/app_image.dart';
import '../../../widget/text_widget.dart';

class DocHomeScreen extends StatelessWidget {
  const DocHomeScreen({super.key});

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
                      text: 'Welcome back',
                      textStyle: GoogleFonts.dmSans(
                        color: AppColor.black,
                        fontSize: 19.20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextView(
                      text: 'Dr. Micheal',
                      textStyle: GoogleFonts.gabarito(
                        color: AppColor.greyIt,
                        fontSize: 14.20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Spacer(),
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
              label: 'Search for Patients or Appointment',
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
                dashContainer(
                  flex: 3,
                  image: AppImage.patient,
                  contColor: AppColor.primary1,
                  firstText: 'Patients',
                  secondText: 'Total Patients:',
                  thirdText: '45',
                ),
                SizedBox(width: 10.w),
                dashContainer(
                  flex: 4,
                  image: AppImage.calendar,
                  contColor: AppColor.darkindgrey,
                  firstText: 'Calendar',
                  secondText: 'Today:',
                  thirdText: '45',
                ),
              ],
            ),
            SizedBox(height: 12.h),
            Row(
              children: [
                dashContainer(
                  flex: 2,
                  image: AppImage.docMsg,
                  contColor: AppColor.primary1,
                  firstText: 'Message',
                  secondText: 'Unread:',
                  thirdText: '5',
                ),
                SizedBox(width: 10.w),
                dashContainer(
                  flex: 2,
                  image: AppImage.task,
                  contColor: AppColor.darkindgrey,
                  firstText: 'Task',
                  secondText: 'Urgent:',
                  thirdText: '2',
                  onTap:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => TasksScreen()),
                      ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Today\'s Appointment',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.black,
                    fontSize: 16.20.sp,
                    fontWeight: FontWeight.w700,
                  ),
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
            SizedBox(height: 20.h),
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
                    text: 'No appointments for today',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.white,
                      fontSize: 13.20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Icon(
                        Icons.add_circle_outline_rounded,
                        color: AppColor.white,
                      ),
                      SizedBox(width: 10.w),
                      TextView(
                        text: 'Schedule appointment',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.white,
                          fontSize: 12.0.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Priority Tasks',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.black,
                    fontSize: 16.20.sp,
                    fontWeight: FontWeight.w700,
                  ),
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
            SizedBox(height: 20.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 14.w, horizontal: 18.w),
              decoration: BoxDecoration(
                color: AppColor.primary1,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColor.white),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Review Sarah Johnson\'s blood test results',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.white,
                      fontSize: 15.20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  TextView(
                    text: 'Due: 4/12/2025',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.white,
                      fontSize: 12.0.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  TextView(
                    text: 'Check hypertension medication effectiveness',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.white,
                      fontSize: 12.0.sp,
                      fontWeight: FontWeight.w600,
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

  dashContainer({
    flex,
    contColor,
    image,
    firstText,
    secondText,
    thirdText,
    Function()? onTap,
  }) => Expanded(
    flex: flex,
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 12.w),
        decoration: BoxDecoration(
          color: contColor,
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(color: AppColor.white),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.white,
              ),
              child: SvgPicture.asset(
                image,
                color: contColor,
                height: 20.h,
                width: 20.w,
              ),
            ),
            SizedBox(height: 10.h),
            TextView(
              text: firstText,
              textStyle: GoogleFonts.dmSans(
                color: AppColor.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 10.h),
            TextView(
              text: secondText,
              textAlign: TextAlign.start,
              textStyle: GoogleFonts.gabarito(
                color: AppColor.white,
                fontSize: 12.6.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10.h),
            TextView(
              text: thirdText,
              textStyle: GoogleFonts.gabarito(
                color: AppColor.white,
                fontSize: 24.20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    ),
  );
}
