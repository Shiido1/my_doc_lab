import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:doc_lab_pharm/ui/widget/text_widget.dart';

import '../../../app_assets/app_color.dart';
import '../../../app_assets/app_image.dart';
import '../../../widget/text_form_widget.dart';
import '../home/cart_screen.dart';

class PharmacyScreen extends StatelessWidget {
  const PharmacyScreen({super.key});

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
                  text: 'Pharmacy',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.black,
                    fontSize: 20.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20.h, width: 20.w),
              ],
            ),
            Divider(color: AppColor.greylight),
            SizedBox(height: 20.h),
            TextFormWidget(
              label: 'Search for Drugs',
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
            TextView(
              text: 'Prescriptions(3)',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.black,
                fontSize: 16.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20.h),
            ...[1, 2, 3].map(
              (o) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                                text: 'Drug Name',
                                textStyle: GoogleFonts.dmSans(
                                  color: AppColor.black,
                                  fontSize: 15.0.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextView(
                                text: 'Amoxicillin 500mg',
                                textStyle: GoogleFonts.dmSans(
                                  color: AppColor.grey,
                                  fontSize: 15.0.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: AppColor.funnyLookingGrey,
                          thickness: 0.6,
                        ),
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
                                text: 'Dosage',
                                textStyle: GoogleFonts.dmSans(
                                  color: AppColor.black,
                                  fontSize: 15.0.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextView(
                                text: '1 Tablet every 8 hours',
                                textStyle: GoogleFonts.dmSans(
                                  color: AppColor.grey,
                                  fontSize: 15.0.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: AppColor.funnyLookingGrey,
                          thickness: 0.6,
                        ),
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
                                text: 'Duration',
                                textStyle: GoogleFonts.dmSans(
                                  color: AppColor.black,
                                  fontSize: 15.0.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextView(
                                text: '7 days',
                                textStyle: GoogleFonts.dmSans(
                                  color: AppColor.grey,
                                  fontSize: 15.0.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: AppColor.funnyLookingGrey,
                          thickness: 0.6,
                        ),
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
                                text: 'Prescribed by:',
                                textStyle: GoogleFonts.dmSans(
                                  color: AppColor.black,
                                  fontSize: 15.0.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextView(
                                text: 'Dr Bolu Adeleke',
                                textStyle: GoogleFonts.dmSans(
                                  color: AppColor.grey,
                                  fontSize: 15.0.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: AppColor.funnyLookingGrey,
                          thickness: 0.6,
                        ),
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
                                text: 'Drug Name',
                                textStyle: GoogleFonts.dmSans(
                                  color: AppColor.black,
                                  fontSize: 15.0.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextView(
                                text: 'N10,000',
                                textStyle: GoogleFonts.dmSans(
                                  color: AppColor.primary,
                                  fontSize: 15.0.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 6.h),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap:
                        () => Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => CartScreen()),
                        ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 6.6.w,
                        horizontal: 10.w,
                      ),
                      decoration: BoxDecoration(
                        color: AppColor.primary1,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: TextView(
                        text: 'Add to Cart',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.white,
                          fontSize: 16.0.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
