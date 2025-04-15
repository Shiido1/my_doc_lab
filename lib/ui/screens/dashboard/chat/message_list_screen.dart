import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/screens/dashboard/chat/chat_screen.dart';

import '../../../app_assets/app_image.dart';
import '../../../widget/text_form_widget.dart';
import '../../../widget/text_widget.dart';

class MessageListScreen extends StatelessWidget {
  const MessageListScreen({super.key});

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
                  text: 'Message',
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
            SizedBox(height: 10.w),
            TextFormWidget(
              label: 'See conservation',
              // hint: 'Email Address',
              border: 10,
              isFilled: true,
              fillColor: AppColor.transparent,
              // controller: fullnameTextController,
              prefixWidget: Padding(
                padding: EdgeInsets.all(14.w),
                child: SvgPicture.asset(
                  AppImage.search,
                  height: 20.h,
                  width: 20.w,
                ),
              ),

              // validator: AppValidator.validateEmail(),
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap:
                  () => Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => ChatScreen())),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 6.w),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColor.greylight),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(24.80.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.friendlyPrimary,
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text: 'Sarah Johnson',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.darkindgrey,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 230.w,
                          child: TextView(
                            text:
                                'You: I have been suffering from Tooth ache and stomach...',
                            maxLines: 1,
                            textOverflow: TextOverflow.ellipsis,
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.lightgrey,
                              fontSize: 12.20.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TextView(
                      text: 'Thu',
                      textStyle: GoogleFonts.gabarito(
                        color: AppColor.lightgrey,
                        fontSize: 12.20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
