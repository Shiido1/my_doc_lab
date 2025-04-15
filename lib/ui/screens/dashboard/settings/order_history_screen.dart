import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/widget/text_widget.dart' show TextView;

import '../../../app_assets/app_color.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

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
                  text: 'Order History',
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
            TextView(
              text: 'Active orders',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.primary1,
                fontSize: 18.20.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 20.w),

            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 14.w, horizontal: 12.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.greylight.withOpacity(.28),
                border: Border.all(color: AppColor.greyIt.withOpacity(.4)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text: 'Order ID',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.black,
                          fontSize: 18.20.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextView(
                        text: '#AD45GT6',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.black,
                          fontSize: 18.20.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextView(
                        text: 'Payment',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.black,
                          fontSize: 12.20.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                          color: AppColor.primary1.withOpacity(.2),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextView(
                          text: 'N 20,000.00',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.primary1,
                            fontSize: 17.20.sp,
                            fontWeight: FontWeight.w400,
                          ),
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
