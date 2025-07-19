import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:doc_lab_pharm/ui/app_assets/app_color.dart';
import '../../../app_assets/app_image.dart';
import '../../../widget/text_form_widget.dart';
import '../../../widget/text_widget.dart';

class HelpAndSupportScreen extends StatefulWidget {
  const HelpAndSupportScreen({super.key});

  @override
  State<HelpAndSupportScreen> createState() => _HelpAndSupportScreenState();
}

class _HelpAndSupportScreenState extends State<HelpAndSupportScreen> {
  bool onTapCoro = false;

  bool onTapCoro1 = false;

  bool onTapCoro2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Help & Support',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 20.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 24.w, height: 24.h),
              ],
            ),
            Divider(color: AppColor.greyIt.withOpacity(.4)),
            SizedBox(height: 20.h),
            TextFormWidget(
              label: 'Search',
              // hint: 'Email Address',
              border: 10,
              isFilled: true,
              fillColor: AppColor.transparent,
              // controller: fullnameTextController,
              prefixWidget: Padding(
                padding: EdgeInsets.all(14.w),
                child: SvgPicture.asset(AppImage.search),
              ),
              // validator: AppValidator.validateEmail(),
            ),
            SizedBox(height: 20.h),
            TextView(
              text: 'FAQ & Support',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.black,
                fontSize: 20.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 12.20.h),
            TextView(
              text: 'Find answers to all your questions below',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.grey,
                fontSize: 16.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: AppColor.greyIt.withOpacity(.5),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(AppImage.document),
                ),
                SizedBox(width: 20.w),
                TextView(
                  text: 'Terms of service',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: AppColor.greyIt.withOpacity(.5),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(AppImage.pClip),
                ),
                SizedBox(width: 20.w),
                TextView(
                  text: 'Visit website',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                    color: AppColor.greyIt.withOpacity(.5),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    AppImage.message,
                    color: AppColor.greyIt,
                  ),
                ),
                SizedBox(width: 20.w),
                TextView(
                  text: 'Email Us',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.greyIt),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 260.w,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.w, top: 14.w),
                          child: TextView(
                            text:
                                'What are Coronaviruses and what is Covid-19?',
                            maxLines: 2,
                            textOverflow: TextOverflow.fade,
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.primary1,
                              fontSize: 16.0.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: IconButton(
                          onPressed: () {
                            setState(() {
                              onTapCoro = !onTapCoro;
                            });
                          },
                          icon:
                              onTapCoro
                                  ? Icon(Icons.keyboard_arrow_down, size: 30.sp)
                                  : Icon(Icons.keyboard_arrow_up, size: 30.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: onTapCoro ? 5.0.h : 0.h),
                  onTapCoro
                      ? SizedBox(
                        width: 320,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.w, bottom: 4.w),
                          child: TextView(
                            text:
                                'Coronaviruses (CoV) are a large number of viruses causing illnesses ranging from the common cold to pneumonia (a severe lung infection).',
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.grey,
                              fontSize: 14.0.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                      : SizedBox.shrink(),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            Container(
              // padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.greyIt),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 260.w,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.w, top: 14.w),
                          child: TextView(
                            text: 'How does Covid-19 spread?',
                            maxLines: 2,
                            textOverflow: TextOverflow.fade,
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.primary1,
                              fontSize: 16.0.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: IconButton(
                          onPressed: () {
                            setState(() {
                              onTapCoro1 = !onTapCoro1;
                            });
                          },
                          icon:
                              onTapCoro1
                                  ? Icon(Icons.keyboard_arrow_down, size: 30.sp)
                                  : Icon(Icons.keyboard_arrow_up, size: 30.sp),
                        ),
                      ),
                    ],
                  ),
                  onTapCoro1
                      ? SizedBox(
                        width: 320.w,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.w, bottom: 4.w),
                          child: TextView(
                            text:
                                'Coronaviruses (CoV) are a large number of viruses causing illnesses ranging from the common cold to pneumonia (a severe lung infection).',
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.grey,
                              fontSize: 14.0.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                      : SizedBox.shrink(),
                ],
              ),
            ),
            SizedBox(height: 30.h),

            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.greyIt),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 260.w,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.w, top: 14.w),
                          child: TextView(
                            text: 'What are the symptoms of Covid-19?',
                            maxLines: 2,
                            textOverflow: TextOverflow.fade,
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.primary1,
                              fontSize: 16.0.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: IconButton(
                          onPressed: () {
                            setState(() {
                              onTapCoro2 = !onTapCoro2;
                            });
                          },
                          icon:
                              onTapCoro2
                                  ? Icon(Icons.keyboard_arrow_down, size: 30.sp)
                                  : Icon(Icons.keyboard_arrow_up, size: 30.sp),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: onTapCoro2 ? 5.0.h : 0.h),
                  onTapCoro2
                      ? SizedBox(
                        width: 320,
                        child: Padding(
                          padding: EdgeInsets.only(left: 10.w, bottom: 4.w),
                          child: TextView(
                            text:
                                'Coronaviruses (CoV) are a large number of viruses causing illnesses ranging from the common cold to pneumonia (a severe lung infection).',
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.grey,
                              fontSize: 14.0.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                      : SizedBox.shrink(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
