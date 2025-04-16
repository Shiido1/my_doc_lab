import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/screens/dashboard/notification/notification_screen.dart';
import 'package:my_doc_lab/ui/widget/text_form_widget.dart';
import '../../../app_assets/app_image.dart';
import '../../../widget/text_widget.dart';

class LaboratoryHomeScreen extends StatefulWidget {
  const LaboratoryHomeScreen({super.key});

  @override
  State<LaboratoryHomeScreen> createState() => _LaboratoryHomeScreenState();
}

class _LaboratoryHomeScreenState extends State<LaboratoryHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
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
                SvgPicture.asset(
                  AppImage.lab_message,
                  width: 24.w,
                  height: 24.w,
                ),
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
              label: 'Search for Patient or Appointments',
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: pharmContainer(
                    context,
                    image: AppImage.thick_appoint,
                    text1: 'Appointments',
                    text2: '50',
                    color: AppColor.primary1,
                  ),
                ),
                SizedBox(width: 12.0.w),

                Expanded(
                  flex: 3,
                  child: pharmContainer(
                    context,
                    image: AppImage.consultancy,
                    text1: 'Consultancy',
                    text2: '70',
                    color: AppColor.darkindgrey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            pharmContainer(
              context,
              image: AppImage.carty,
              text1: 'Order',
              text2: '10',
              color: AppColor.primary1,
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Appointments',
                  textAlign: TextAlign.start,
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.darkindgrey,
                    fontSize: 16.30.sp,
                    letterSpacing: -1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  children: [
                    TextView(
                      text: 'View all',
                      textAlign: TextAlign.start,
                      textStyle: GoogleFonts.gabarito(
                        color: AppColor.darkindgrey,
                        fontSize: 12.30.sp,
                        letterSpacing: -1,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 8.0.w),
                    Icon(
                      Icons.keyboard_arrow_right_rounded,
                      size: 16.sp,
                      color: AppColor.darkindgrey,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...[1, 2, 3, 4, 5].map(
                    (o) => Container(
                      width: 240.w,
                      padding: EdgeInsets.symmetric(
                        vertical: 8.w,
                        horizontal: 10.w,
                      ),
                      margin: EdgeInsets.only(right: 10.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.primary1,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(17.2.w),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.white,
                                ),
                              ),
                              SizedBox(width: 10.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextView(
                                    text: 'Daniel Wood',
                                    textAlign: TextAlign.start,
                                    textStyle: GoogleFonts.gabarito(
                                      color: AppColor.white,
                                      fontSize: 16.30.sp,
                                      letterSpacing: -1,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextView(
                                    text: '10:00 am',
                                    textAlign: TextAlign.start,
                                    textStyle: GoogleFonts.gabarito(
                                      color: AppColor.white,
                                      fontSize: 12.30.sp,
                                      letterSpacing: -1,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 1.4.w,
                                  horizontal: 8.w,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColor.yellow.withOpacity(.2),
                                  borderRadius: BorderRadius.circular(22),
                                ),
                                child: TextView(
                                  text: 'Pending',
                                  textAlign: TextAlign.center,
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.yellow,
                                    fontSize: 11.30.sp,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          Padding(
                            padding: EdgeInsets.only(left: 40.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'Blood Test',
                                  textAlign: TextAlign.start,
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.white,
                                    fontSize: 16.30.sp,
                                    letterSpacing: -1,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 1.4.w,
                                    horizontal: 8.w,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColor.darkindgrey,
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  child: TextView(
                                    text: 'Sample',
                                    textAlign: TextAlign.center,
                                    textStyle: GoogleFonts.gabarito(
                                      color: AppColor.white,
                                      fontSize: 11.30.sp,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 10.h),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Appointment Request',
                  textAlign: TextAlign.start,
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.darkindgrey,
                    fontSize: 16.30.sp,
                    letterSpacing: -1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  children: [
                    TextView(
                      text: 'View all',
                      textAlign: TextAlign.start,
                      textStyle: GoogleFonts.gabarito(
                        color: AppColor.darkindgrey,
                        fontSize: 12.30.sp,
                        letterSpacing: -1,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    // SizedBox(width: 8.0.w),
                    Icon(
                      Icons.keyboard_arrow_right_rounded,
                      size: 16.sp,
                      color: AppColor.darkindgrey,
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.h),

            Container(
              padding: EdgeInsets.symmetric(
                vertical: 16.w,
                horizontal: 16.80.w,
              ),
              margin: EdgeInsets.only(right: 10.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.primary1.withOpacity(.15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: 'Patient Name',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.primary1,
                          fontSize: 12.30.sp,
                          letterSpacing: -1,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextView(
                        text: 'Dates',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.primary1,
                          fontSize: 12.30.sp,
                          letterSpacing: -1,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextView(
                        text: 'Time',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.primary1,
                          fontSize: 12.30.sp,
                          letterSpacing: -1,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextView(
                        text: 'Action',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.primary1,
                          fontSize: 12.30.sp,
                          letterSpacing: -1,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  ...[1, 2, 3, 4, 5].map(
                    (o) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: isTablet ? 200 : 100,
                          child: TextView(
                            text: 'Daniel Woods',
                            textAlign: TextAlign.start,
                            textOverflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.primary1,
                              fontSize: 12.30.sp,
                              letterSpacing: -1,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 80.w,
                          child: TextView(
                            text: '12 Dec, 2025',
                            textAlign: TextAlign.start,
                            textOverflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.primary1,
                              fontSize: 12.30.sp,
                              letterSpacing: -1,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 50.w,
                          child: TextView(
                            text: '10:00 AM',
                            textAlign: TextAlign.start,

                            textOverflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.primary1,
                              fontSize: 12.30.sp,
                              letterSpacing: -1,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),

                        SizedBox(width: 4.0.w),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              width: 20.w,
                              child: Checkbox(
                                value: true,
                                onChanged: (isChecked) {
                                  // setState(() {
                                  //   if (isChecked!) {
                                  //     selectedOptions.add('Blood Sugar');
                                  //   } else {
                                  //     selectedOptions.remove('Blood Sugar');
                                  //   }
                                  // });
                                },
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.cancel_outlined,
                                color: AppColor.fineRed,
                                size: 20.sp,
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

  pharmContainer(context, {image, text1, text2, color}) => GestureDetector(
    onTap: () {},
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 12.0.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Container(
            padding: EdgeInsets.all(9.2.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.white,
            ),
            child: SvgPicture.asset(image, height: 22.h, width: 22.w),
          ),
          SizedBox(height: 10.h),
          TextView(
            text: text1,

            textAlign: TextAlign.start,
            textStyle: GoogleFonts.gabarito(
              color: AppColor.white,
              fontSize: 16.30.sp,
              letterSpacing: -1,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10.h),
          TextView(
            text: text2,
            textAlign: TextAlign.start,
            textStyle: GoogleFonts.gabarito(
              color: AppColor.white,
              fontSize: 28.20.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: -1,
            ),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    ),
  );
}
