import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_image.dart';
import 'package:my_doc_lab/ui/widget/button_widget.dart';
import 'package:my_doc_lab/ui/widget/text_form_widget.dart';
import 'package:my_doc_lab/ui/widget/text_widget.dart';

import '../../app_assets/app_validatiion.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            TextView(
              text: 'Forgot Password',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.darkindgrey,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20.h),
            TextView(
              text:
                  'Enter your email and phone number, we will send a confirmation code',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.darkindgrey,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 30.h),
            TextFormWidget(
              label: 'Enter your email',
              border: 10,
              isFilled: true,
              fillColor: AppColor.white,
              controller: emailController,
              prefixWidget: Padding(
                padding: EdgeInsets.all(9.2.w),
                child: SvgPicture.asset(AppImage.message),
              ),
              validator: AppValidator.validateEmail(),
            ),
            SizedBox(height: 80.h),
            ButtonWidget(
              buttonText: 'Reset Password',
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
