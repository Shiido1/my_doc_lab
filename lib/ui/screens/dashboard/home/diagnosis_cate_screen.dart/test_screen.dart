import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:doc_lab_pharm/ui/app_assets/app_color.dart';
import 'package:doc_lab_pharm/ui/screens/dashboard/home/diagnosis_cate_screen.dart/confirm_test_screen.dart';

import '../../../../app_assets/app_image.dart';
import '../../../../widget/button_widget.dart';
import '../../../../widget/text_widget.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  List valueList = [
    {'day': 'Mon', 'date': '21'},
    {'day': 'Tue', 'date': '22'},
    {'day': 'Wed', 'date': '23'},
    {'day': 'Thu', 'date': '24'},
    {'day': 'Fri', 'date': '25'},
    {'day': 'Sat', 'date': '26'},
    {'day': 'Sun', 'date': '27'},
  ];

  List timeList = [
    '9:00 AM',
    '10:00 AM',
    '11:00 AM',
    '1:00 PM',
    '2:00 PM',
    '3:00 PM',
    '4:00 PM',
    '5:00 PM',
    '6:00 PM',
  ];

  var v;
  var t;

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
            SizedBox(height: 20.h),
            TextView(
              text: 'Preparation',
              textStyle: GoogleFonts.dmSans(
                color: AppColor.primary1,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Divider(color: AppColor.grey, thickness: .5),
            SizedBox(height: 10.h),
            TextView(
              text:
                  'Fasting may be required for some tests. Please follow instructions provided during booking.',
              textStyle: GoogleFonts.dmSans(
                color: AppColor.grey,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 30.h),
            TextView(
              text: 'Result Time',
              textStyle: GoogleFonts.dmSans(
                color: AppColor.primary1,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Divider(color: AppColor.grey, thickness: .5),
            SizedBox(height: 10.h),
            TextView(
              text: 'Typically available within 24-48 hours.',
              textStyle: GoogleFonts.dmSans(
                color: AppColor.grey,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 30.h),

            TextView(
              text: 'Location',
              textStyle: GoogleFonts.dmSans(
                color: AppColor.primary1,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Divider(color: AppColor.grey, thickness: .5),
            SizedBox(height: 10.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColor.funnyLookingGrey),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(AppImage.location, color: AppColor.primary1),
                  SizedBox(width: 10.w),
                  TextView(
                    text: 'No. 26 Jos St, Garki, Abuja.',
                    textStyle: GoogleFonts.dmSans(
                      color: AppColor.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Icon(Icons.keyboard_arrow_down_outlined),
                ],
              ),
            ),

            SizedBox(height: 30.h),

            TextView(
              text: 'Available Dates',
              textStyle: GoogleFonts.dmSans(
                color: AppColor.primary1,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Divider(color: AppColor.grey, thickness: .5),
            SizedBox(height: 10.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...valueList.map(
                    (o) => GestureDetector(
                      onTap: () {
                        setState(() {
                          v = o;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 20.w),
                        padding: EdgeInsets.symmetric(
                          vertical: 6.w,
                          horizontal: 6.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color:
                              v == o ? AppColor.primary1 : AppColor.transparent,
                          border: Border.all(color: AppColor.funnyLookingGrey),
                        ),
                        child: Column(
                          children: [
                            TextView(
                              text: o['day'],
                              textStyle: GoogleFonts.dmSans(
                                color: v == o ? AppColor.white : AppColor.grey,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextView(
                              text: o['date'],
                              textStyle: GoogleFonts.dmSans(
                                color: v == o ? AppColor.white : AppColor.black,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Divider(color: AppColor.grey, thickness: .2),
            SizedBox(height: 10.h),
            Wrap(
              children: [
                ...timeList.map(
                  (o) => GestureDetector(
                    onTap: () {
                      setState(() {
                        t = o;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 20.w, bottom: 10.w),
                      padding: EdgeInsets.symmetric(
                        vertical: 5.4.w,
                        horizontal: 14.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color:
                            t == o ? AppColor.primary1 : AppColor.transparent,
                        border: Border.all(color: AppColor.funnyLookingGrey),
                      ),
                      child: TextView(
                        text: o,
                        textStyle: GoogleFonts.dmSans(
                          color: t == o ? AppColor.white : AppColor.black,
                          fontSize: 15.6.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 100.h),
            ButtonWidget(
              buttonText: 'Book Test',
              buttonColor: AppColor.primary1,
              buttonBorderColor: AppColor.transparent,
              textStyle: GoogleFonts.dmSans(
                color: AppColor.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
              onPressed:
                  () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ConfirmTestScreen(),
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
