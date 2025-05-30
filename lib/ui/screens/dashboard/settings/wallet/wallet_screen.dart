import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';

import '../../../../app_assets/app_image.dart';
import '../../../../widget/text_widget.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 22.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back_ios_outlined, size: 20.sp),
                ),
                TextView(
                  text: 'My Wallet',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20.h, width: 20.w),
              ],
            ),
            Divider(color: AppColor.greylight),
            SizedBox(height: 20.w),
            Card(
              elevation: 3,
              shadowColor: const Color.fromARGB(255, 143, 143, 143),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6.w, horizontal: 8.w),
                decoration: BoxDecoration(
                  color: AppColor.primary1,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextView(
                  text: 'Top-Up',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.white,
                    fontSize: 18.20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

            SizedBox(height: 20.w),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 14.w, horizontal: 18.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColor.greyIt),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Available Balance',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.primary1,
                      fontSize: 18.20.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 5.10.w),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppImage.wallet,
                        width: 18.w,
                        height: 16.20.h,
                        color: AppColor.primary1,
                      ),
                      SizedBox(width: 10.w),
                      TextView(
                        text: 'N 20,000.00',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.primary1,
                          fontSize: 32.20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            TextView(
              text: 'Transaction',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.primary1,
                fontSize: 18.20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 10.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 14.w, horizontal: 18.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColor.greyIt),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 170.w,
                    child: TextView(
                      text: 'Added to Wallet From Bank Transfer',
                      maxLines: 2,
                      textOverflow: TextOverflow.ellipsis,
                      textStyle: GoogleFonts.gabarito(
                        color: AppColor.black,
                        fontSize: 18.20.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextView(
                        text: 'N 20,000.00',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.primary1,
                          fontSize: 22.20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      TextView(
                        text: '27 Mar, 2025',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.black,
                          fontSize: 17.20.sp,
                          fontWeight: FontWeight.w400,
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
    );
  }
}
