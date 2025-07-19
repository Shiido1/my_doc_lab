import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:doc_lab_pharm/ui/app_assets/app_image.dart';

import '../../../../app_assets/app_color.dart';
import '../../../../widget/button_widget.dart';
import '../../../../widget/text_form_widget.dart';
import '../../../../widget/text_widget.dart';

class PatientResultsScreen extends StatelessWidget {
  const PatientResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Results',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.darkindgrey,
                    fontSize: 20.0.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20.h, width: 20.w),
              ],
            ),
            SizedBox(height: 20.h),
            TextView(
              text: 'Results',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.primary1,
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20.h),
            TextView(
              text: 'Blood Test',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.darkindgrey,
                fontSize: 17.2.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Divider(color: AppColor.friendlyPrimary),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Name',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 17.2.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextView(
                  text: 'John Joseph',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.greyIt,
                    fontSize: 17.2.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Age',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 17.2.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextView(
                  text: '25',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.greyIt,
                    fontSize: 17.2.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Gender',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 17.2.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextView(
                  text: 'Male',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.greyIt,
                    fontSize: 17.2.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Date',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 17.2.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextView(
                  text: '12/06/2025 | 10:00 AM',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.greyIt,
                    fontSize: 17.2.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Doctor\'s Name',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 17.2.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextView(
                  text: 'Dr Bolu Adeleke',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.greyIt,
                    fontSize: 17.2.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Status',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 17.2.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 2.4.w,
                    horizontal: 10.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.primary1,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: TextView(
                    text: 'Normal',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.white,
                      fontSize: 14.20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            TextView(
              text: 'Key Metrics',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.darkindgrey,
                fontSize: 17.2.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Divider(color: AppColor.friendlyPrimary),
            SizedBox(height: 20.h),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColor.funnyLookingGrey,
                  width: 0.6,
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8.w,
                      right: 6.6.w,
                      left: 6.6.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextView(
                          text: 'Hemoglobin',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.black,
                            fontSize: 15.0.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextView(
                          text: '13.5 g/dL',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.black,
                            fontSize: 15.0.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: AppColor.funnyLookingGrey, thickness: 0.6),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8.w,
                      right: 6.6.w,
                      left: 6.6.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextView(
                          text: 'White Blood Cells (WBC)',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.black,
                            fontSize: 15.0.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextView(
                          text: '12 g/dL',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.black,
                            fontSize: 15.0.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: AppColor.funnyLookingGrey, thickness: 0.6),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8.w,
                      right: 6.6.w,
                      left: 6.6.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextView(
                          text: 'Platelets',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.black,
                            fontSize: 15.0.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextView(
                          text: '12 g/dL',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.black,
                            fontSize: 15.0.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: AppColor.funnyLookingGrey, thickness: 0.6),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8.w,
                      right: 6.6.w,
                      left: 6.6.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextView(
                          text: 'Reference Range',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.black,
                            fontSize: 15.0.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextView(
                          text: '12-16 g/dL',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.black,
                            fontSize: 15.0.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: AppColor.funnyLookingGrey, thickness: 0.6),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 8.w,
                      right: 6.6.w,
                      left: 6.6.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextView(
                          text: 'Status',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.black,
                            fontSize: 15.0.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 2.4.w,
                            horizontal: 10.w,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.primary1,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: TextView(
                            text: 'Normal',
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.white,
                              fontSize: 14.20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 6.h),
                ],
              ),
            ),

            SizedBox(height: 40.h),
            TextView(
              text: 'Doctor\'s Comments',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.darkindgrey,
                fontSize: 17.2.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Divider(color: AppColor.friendlyPrimary),
            SizedBox(height: 20.h),
            TextFormWidget(
              label: 'Doctor\'s comments',
              border: 10,
              isFilled: true,
              fillColor: AppColor.oneKindgrey,
              borderColor: AppColor.transparent,
              maxline: 4,
              alignLabelWithHint: true,
              // controller: emailTextController,
              // prefixWidget: Padding(
              //   padding: EdgeInsets.all(9.2.w),
              //   child: SvgPicture.asset(AppImage.message),
              // ),
              // validator: AppValidator.validateEmail(),
            ),
            SizedBox(height: 20.h),

            TextView(
              text:
                  'Please consult your doctor for further clarification regarding these results.',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.primary1,
                fontSize: 15.2.sp,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
                decorationColor: AppColor.primary1,
              ),
            ),
            SizedBox(height: 30.h),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10.w),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.primary),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextView(
                    text: 'Download Result as PDF',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.black,
                      fontSize: 16.2.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 14.w),
                  SvgPicture.asset(AppImage.pdf),
                ],
              ),
            ),
            SizedBox(height: 18.h),
            ButtonWidget(
              buttonText: 'Book Appointment',
              buttonColor: AppColor.primary1,
              buttonBorderColor: AppColor.transparent,
              textStyle: GoogleFonts.dmSans(
                color: AppColor.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
