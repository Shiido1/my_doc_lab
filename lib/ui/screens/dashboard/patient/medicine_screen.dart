import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/screens/dashboard/settings/profile_screen_one.dart';
import 'package:my_doc_lab/ui/widget/text_form_widget.dart';

import '../../../app_assets/app_image.dart';
import '../../../widget/text_widget.dart';

// ignore: must_be_immutable
class MedicineScreen extends StatefulWidget {
  const MedicineScreen({super.key});

  @override
  State<MedicineScreen> createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 20.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.keyboard_arrow_left, size: 30.sp),
                ),
                TextView(
                  text: 'Medicine',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 20.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 24.w, height: 24.w),
              ],
            ),
            SizedBox(height: 20.h),
            Column(
              children: [
                TextFormWidget(
                  label: 'Search for Medicine',
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

                Align(
                  alignment: Alignment.topLeft,
                  child: TextView(
                    text: 'Top Pharmacist',
                    textAlign: TextAlign.start,
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.primary1,
                      fontSize: 18.20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 500.h,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount: 2,
                      mainAxisExtent:
                          Platform.isIOS ? 200 : 170, // Number of columns
                    ),
                    itemBuilder: (context, index) {
                      // Build each grid item based on the index
                      return GestureDetector(
                        onTap:
                            () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ProfileScreen1(),
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
                                  height: 80.h,
                                  width: double.infinity,
                                  fit: BoxFit.fitWidth,
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
                                        color: AppColor.darkindgrey,
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
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
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
                        ),
                      );
                    },
                    itemCount: 20, // Number of items in the grid
                  ),
                ),
              ],
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
