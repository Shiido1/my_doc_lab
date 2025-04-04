import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_image.dart';
import 'package:my_doc_lab/ui/screens/edit_profile_screen.dart';
import 'package:my_doc_lab/ui/widget/button_widget.dart';
import 'package:my_doc_lab/ui/widget/text_form_widget.dart';
import 'package:my_doc_lab/ui/widget/text_widget.dart';

class CreateNewPasswordScreen extends StatefulWidget {
  const CreateNewPasswordScreen({super.key});

  @override
  State<CreateNewPasswordScreen> createState() =>
      _CreateNewPasswordScreenState();
}

class _CreateNewPasswordScreenState extends State<CreateNewPasswordScreen> {
  // bool _onTap = false;
  TextEditingController newcontroller = TextEditingController();
  TextEditingController confirmcontroller = TextEditingController();

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
              text: 'Create New Password',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.darkindgrey,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20.h),
            TextView(
              text: 'Create your new password to Login',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.darkindgrey,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),

            SizedBox(height: 20.h),

            TextFormWidget(
              label: 'Enter new password',
              // hint: 'Email Address',
              border: 10,
              isFilled: true,
              fillColor: AppColor.white,
              controller: newcontroller,
              prefixWidget: Padding(
                padding: EdgeInsets.all(9.2.w),
                child: SvgPicture.asset(AppImage.lock),
              ),
              suffixWidget: Padding(
                padding: EdgeInsets.all(9.2.w),
                child: SvgPicture.asset(AppImage.close_eye),
              ),
              // validator: AppValidator.validateEmail(),
            ),
            SizedBox(height: 20.h),

            TextFormWidget(
              label: 'Confirm password',
              // hint: 'Email Address',
              border: 10,
              isFilled: true,
              fillColor: AppColor.white,
              controller: confirmcontroller,
              prefixWidget: Padding(
                padding: EdgeInsets.all(9.2.w),
                child: SvgPicture.asset(AppImage.lock),
              ),
              suffixWidget: Padding(
                padding: EdgeInsets.all(9.2.w),
                child: SvgPicture.asset(AppImage.close_eye),
              ),
              // validator: AppValidator.validateEmail(),
            ),
            SizedBox(height: 80.h),
            ButtonWidget(
              buttonText: 'Create Password',
              buttonColor: AppColor.primary1,
              buttonBorderColor: AppColor.transparent,
              textStyle: GoogleFonts.dmSans(
                color: AppColor.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
              onPressed:
                  () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditProfileScreen(),
                    ),
                  ),
            ),
            SizedBox(height: 26.0.h),
            GestureDetector(
              onTap: () {},
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Didn\'t receive the code? ',
                    style: GoogleFonts.gabarito(
                      color: AppColor.black,
                      fontSize: 16.4.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Resend',
                        style: GoogleFonts.gabarito(
                          color: AppColor.primary1,
                          fontSize: 16.4.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
