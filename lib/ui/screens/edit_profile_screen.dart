import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_image.dart';
import 'package:my_doc_lab/ui/widget/button_widget.dart';
import 'package:my_doc_lab/ui/widget/text_form_widget.dart';
import 'package:my_doc_lab/ui/widget/text_widget.dart';

import 'dashboard/dashboard_screen.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 50.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_back_ios_outlined, size: 20.sp),
                ),
                TextView(
                  text: 'Edit Profile',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20.h, width: 20.w),
              ],
            ),
            Divider(color: AppColor.grey.withOpacity(.3)),
            SizedBox(height: 50.h),
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
              readOnly: true,
              fillColor: AppColor.oneKindgrey,
              borderColor: AppColor.transparent,
              // controller: emailTextController,
              prefixWidget: Padding(
                padding: EdgeInsets.all(9.2.w),
                child: SvgPicture.asset(AppImage.person),
              ),
              suffixWidget: Padding(
                padding: EdgeInsets.all(9.2.w),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.arrow_drop_down_outlined),
                ),
                // validator: AppValidator.validateEmail(),
              ),
            ),
            SizedBox(height: 20.h),
            TextFormWidget(
              hint: 'Email Address',
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
              hint: 'Address',
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
            SizedBox(height: 60.h),
            ButtonWidget(
              buttonText: 'Save',
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
                  ).push(MaterialPageRoute(builder: (context) => Dashboard())),
            ),
          ],
        ),
      ),
    );
  }
}
