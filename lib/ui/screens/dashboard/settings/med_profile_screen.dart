import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_image.dart';
import 'package:my_doc_lab/ui/screens/dashboard/home/cart_screen.dart';

import '../../../widget/text_widget.dart';

class MedProfileScreen extends StatefulWidget {
  const MedProfileScreen({super.key});

  @override
  State<MedProfileScreen> createState() => _MedProfileScreenState();
}

class _MedProfileScreenState extends State<MedProfileScreen> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.keyboard_arrow_left, size: 30.sp),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  child: Image.asset(
                    AppImage.medicine,
                    width: 180.w,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 20.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 150.w,
                      child: TextView(
                        text: 'MOKO Hydrogen Peroxide 100ml',
                        maxLines: 4,
                        textOverflow: TextOverflow.ellipsis,
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.darkindgrey,
                          fontSize: 13.20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    TextView(
                      text: 'By Dr Uju E.',
                      textStyle: GoogleFonts.gabarito(
                        color: AppColor.darkindgrey,
                        fontSize: 12.0.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 4.10.h),
                    SizedBox(
                      width: 150.w,
                      child: Divider(color: AppColor.greylight, thickness: 1),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30.h),
            TextView(
              text: 'Medicine Details',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.primary1,
                fontSize: 16.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20.h),

            !isTapped
                ? Wrap(
                  children: [
                    SizedBox(
                      width: 350.w,
                      child: TextView(
                        text:
                            'Lorem ipsum dolor sit amet consectetur. Eu malesuada eu porta vitae neque ac. Purus lectus id suspendisse tempus morbi massa lectus urna. Maecenas donec eget eu et sed. Enim egestas arcu',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.black,
                          fontSize: 14.60.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 3,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isTapped = true;
                        });
                      },
                      child: TextView(
                        text: 'Read More',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.green,
                          fontSize: 14.60.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                )
                : Wrap(
                  children: [
                    SizedBox(
                      child: TextView(
                        text:
                            'Lorem ipsum dolor sit amet consectetur. Eu malesuada eu porta vitae neque ac. Purus lectus id suspendisse tempus morbi massa lectus urna. Maecenas donec eget eu et sed. Enim egestas arcu, Lorem ipsum dolor sit amet consectetur. Eu malesuada eu porta vitae neque ac. Purus lectus id suspendisse tempus morbi massa lectus urna. Maecenas donec eget eu et sed. Enim egestas arcu,Lorem ipsum dolor sit amet consectetur. Eu malesuada eu porta vitae neque ac. Purus lectus id suspendisse tempus morbi massa lectus urna. Maecenas donec eget eu et sed. Enim egestas arcu',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.black,
                          fontSize: 14.60.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isTapped = false;
                        });
                      },
                      child: TextView(
                        text: 'Read Less',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.green,
                          fontSize: 14.60.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),

            SizedBox(height: isTapped ? 140.h : 280.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.w,
                      horizontal: 46.0.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.primary1,
                    ),
                    child: TextView(
                      text: 'Buy Now',
                      textStyle: GoogleFonts.gabarito(
                        color: AppColor.white,
                        fontSize: 14.0.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CartScreen()),
                      ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.w,
                      horizontal: 46.0.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.primary1,
                    ),
                    child: TextView(
                      text: 'Add to Cart',
                      textStyle: GoogleFonts.gabarito(
                        color: AppColor.white,
                        fontSize: 14.0.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 60.h),
          ],
        ),
      ),
    );
  }
}
