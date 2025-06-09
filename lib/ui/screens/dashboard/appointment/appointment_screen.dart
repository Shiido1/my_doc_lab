import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_image.dart';
import '../../../widget/text_form_widget.dart';
import '../../../widget/text_widget.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  String tab = 'Upcoming';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Align(
              alignment: Alignment.center,
              child: TextView(
                text: 'Appointments',
                textStyle: GoogleFonts.dmSans(
                  color: AppColor.black,
                  fontSize: 20.0.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 20.h),
            TextFormWidget(
              label: 'Search for appointments by name or date sortttt',
              // hint: 'Email Address',
              border: 10,
              isFilled: true,
              fillColor: AppColor.transparent,
              // controller: fullnameTextController,
              prefixWidget: Padding(
                padding: EdgeInsets.all(14.w),
                child: SvgPicture.asset(AppImage.search),
              ),
              // validator: AppValidator.validateEmail(),
            ),
            SizedBox(height: 20.h),
            Container(
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: AppColor.primary1.withOpacity(.68),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => setState(() => tab = 'Upcoming'),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 11.w,
                        horizontal: 20.w,
                      ),
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color:
                            tab == 'Upcoming'
                                ? AppColor.primary1
                                : AppColor.transparent,

                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextView(
                        text: 'Upcoming',
                        textStyle: GoogleFonts.dmSans(
                          color:
                              tab == 'Upcoming'
                                  ? AppColor.white
                                  : AppColor.darkindgrey,
                          fontSize: 13.0.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => tab = 'Completed'),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 11.w,
                        horizontal: 20.w,
                      ),
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color:
                            tab == 'Completed'
                                ? AppColor.primary1
                                : AppColor.transparent,

                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextView(
                        text: 'Completed',
                        textStyle: GoogleFonts.dmSans(
                          color:
                              tab == 'Completed'
                                  ? AppColor.white
                                  : AppColor.darkindgrey,
                          fontSize: 13.0.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => tab = 'Canceled'),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 11.w,
                        horizontal: 20.w,
                      ),
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color:
                            tab == 'Canceled'
                                ? AppColor.primary1
                                : AppColor.transparent,

                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextView(
                        text: 'Canceled',
                        textStyle: GoogleFonts.dmSans(
                          color:
                              tab == 'Canceled'
                                  ? AppColor.white
                                  : AppColor.darkindgrey,
                          fontSize: 13.0.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (tab == 'Upcoming')
                      ...[1, 2, 3, 4].map(
                        (o) => appointMentCard(appointmentStatus: 'Upcoming'),
                      )
                    else if (tab == 'Completed')
                      ...[1, 2, 3, 4].map(
                        (o) => appointMentCard(appointmentStatus: 'Completed'),
                      )
                    else
                      ...[1, 2, 3, 4].map(
                        (o) => appointMentCard(appointmentStatus: 'Canceled'),
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

  Color getAppColor(String app) {
    if (app == 'Upcoming') {
      return AppColor.grey;
    } else if (app == 'Canceled') {
      return AppColor.red;
    }
    return AppColor.darkindgrey;
  }

  appointMentCard({String? appointmentStatus}) => Container(
    padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.w),
    margin: EdgeInsets.only(bottom: 20.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: const Color.fromARGB(218, 208, 208, 208)),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text: 'Dr Uju Odoh',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.darkindgrey,
                    fontSize: 18.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextView(
                  text: 'Cardiologist',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.darkindgrey,
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColor.oneKindgrey,
                  ),
                ),
                SizedBox(width: 16.w),
                SvgPicture.asset(AppImage.more_circle),
              ],
            ),
          ],
        ),
        SizedBox(height: 40.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  AppImage.calendar,
                  color: AppColor.darkindgrey,
                ),
                SizedBox(width: 8.w),
                TextView(
                  text: '26/06/2024',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.darkindgrey,
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                SvgPicture.asset(AppImage.time, color: AppColor.darkindgrey),
                SizedBox(width: 8.w),
                TextView(
                  text: '2:00 PM',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.darkindgrey,
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 2.w),
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    color: getAppColor(appointmentStatus!),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 8.w),
                TextView(
                  text: appointmentStatus,
                  textStyle: GoogleFonts.gabarito(
                    color: getAppColor(appointmentStatus),
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 12.0.h),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Expanded(
        //       child: Container(
        //         padding: EdgeInsets.symmetric(
        //           vertical: 8.w,
        //           horizontal: 46.0.w,
        //         ),
        //         decoration: BoxDecoration(
        //           color: AppColor.primary1.withOpacity(.7),
        //           borderRadius: BorderRadius.circular(8),
        //         ),
        //         child: TextView(
        //           text: 'Cancel',
        //           textStyle: GoogleFonts.gabarito(
        //             color: AppColor.darkindgrey,
        //             fontSize: 13.20.sp,
        //             fontWeight: FontWeight.w500,
        //           ),
        //         ),
        //       ),
        //     ),
        //     SizedBox(width: 20.w),
        //     Expanded(
        //       child: Container(
        //         padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 36.w),
        //         decoration: BoxDecoration(
        //           color: AppColor.primary1,
        //           borderRadius: BorderRadius.circular(8),
        //         ),
        //         child: TextView(
        //           text: 'Reschedule',
        //           textStyle: GoogleFonts.gabarito(
        //             color: AppColor.white,
        //             fontSize: 13.20.sp,
        //             fontWeight: FontWeight.w500,
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    ),
  );
}
