import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/screens/create_new_password_screen.dart';
import 'package:my_doc_lab/ui/widget/button_widget.dart';
import 'package:my_doc_lab/ui/widget/text_widget.dart';

class VerificationScreenForgotPassword extends StatefulWidget {
  const VerificationScreenForgotPassword({super.key});

  @override
  State<VerificationScreenForgotPassword> createState() =>
      _VerificationScreenForgotPasswordState();
}

class _VerificationScreenForgotPasswordState
    extends State<VerificationScreenForgotPassword> {
  // bool _onTap = false;
  TextEditingController controller = TextEditingController();

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
              text: 'Enter Verification Code',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.darkindgrey,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 20.h),
            TextView(
              text: 'Enter the Code we sent to 087681****',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.darkindgrey,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 30.h),
            SizedBox(height: 80.h),
            ButtonWidget(
              buttonText: 'Verify',
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
                      builder: (context) => CreateNewPasswordScreen(),
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
