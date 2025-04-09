import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/screens/dashboard/home/cart_screen.dart';
import 'package:my_doc_lab/ui/widget/button_widget.dart';
import 'package:my_doc_lab/ui/widget/text_form_widget.dart';

import '../../widget/text_widget.dart';

class PatientDetailComplaintScreen extends StatelessWidget {
  const PatientDetailComplaintScreen({super.key});

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
                  text: 'Patient Details',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.black,
                    fontSize: 20.0.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 20.h, width: 20.w),
              ],
            ),
            SizedBox(height: 30.h),
            TextFormWidget(
              hint: 'Full name',
              border: 10,
              isFilled: true,
              fillColor: AppColor.oneKindgrey,
              borderColor: AppColor.transparent,
              // controller: emailTextController,
              // prefixWidget: Padding(
              //   padding: EdgeInsets.all(9.2.w),
              //   child: SvgPicture.asset(AppImage.message),
              // ),
              // validator: AppValidator.validateEmail(),
            ),
            SizedBox(height: 20.h),
            TextFormWidget(
              hint: 'Age',
              border: 10,
              isFilled: true,
              fillColor: AppColor.oneKindgrey,
              borderColor: AppColor.transparent,
              // controller: emailTextController,
              // prefixWidget: Padding(
              //   padding: EdgeInsets.all(9.2.w),
              //   child: SvgPicture.asset(AppImage.message),
              // ),
              // validator: AppValidator.validateEmail(),
            ),
            SizedBox(height: 20.h),
            TextFormWidget(
              hint: 'Gender',
              border: 10,
              isFilled: true,
              fillColor: AppColor.oneKindgrey,
              borderColor: AppColor.transparent,
              // controller: emailTextController,
              // prefixWidget: Padding(
              //   padding: EdgeInsets.all(9.2.w),
              //   child: SvgPicture.asset(AppImage.message),
              // ),
              // validator: AppValidator.validateEmail(),
            ),
            SizedBox(height: 20.h),
            TextFormWidget(
              hint: 'Write your complaint',
              border: 10,
              isFilled: true,
              fillColor: AppColor.oneKindgrey,
              borderColor: AppColor.transparent,
              maxline: 4,
              // controller: emailTextController,
              // prefixWidget: Padding(
              //   padding: EdgeInsets.all(9.2.w),
              //   child: SvgPicture.asset(AppImage.message),
              // ),
              // validator: AppValidator.validateEmail(),
            ),
            SizedBox(height: 140.h),
            ButtonWidget(
              buttonText: 'Add to Cart',
              buttonColor: AppColor.primary1,
              buttonBorderColor: AppColor.transparent,
              textStyle: GoogleFonts.dmSans(
                color: AppColor.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
              onPressed:
                  () => Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => CartScreen())),
            ),
          ],
        ),
      ),
    );
  }
}
