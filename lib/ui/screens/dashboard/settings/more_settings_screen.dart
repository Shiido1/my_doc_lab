import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_image.dart';
import 'package:my_doc_lab/ui/screens/authentication/edit_profile_screen.dart';
import 'package:my_doc_lab/ui/screens/dashboard/phamacy_screen.dart';
import 'package:my_doc_lab/ui/widget/text_widget.dart';

class MoreSettingsScreen extends StatelessWidget {
  const MoreSettingsScreen({super.key});

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
                  text: 'More',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Icon(Icons.notifications_none_outlined),
              ],
            ),
            Divider(color: AppColor.grey.withOpacity(.3)),
            SizedBox(height: 30.h),
            Center(
              child: Column(
                children: [
                  Stack(
                    fit: StackFit.loose,
                    children: [
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 0,
                        child: SvgPicture.asset(AppImage.edit),
                      ),
                      Container(
                        padding: EdgeInsets.all(60.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.oneKindgrey,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        left: 96.0,
                        child: SvgPicture.asset(AppImage.edit),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  TextView(
                    text: 'John Cena',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextView(
                    text: 'johncenaa@gmail.com',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.grey,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
            SizedBox(height: 30.h),
            moreContainerWidget(
              image: AppImage.person,
              text: 'Edit Profile',
              onTap:
                  () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditProfileScreen(),
                    ),
                  ),
            ),
            SizedBox(height: 20.h),
            moreContainerWidget(
              image: AppImage.walleta,
              text: 'Wallet',
              onTap: () {},
            ),
            SizedBox(height: 20.h),
            moreContainerWidget(
              image: AppImage.results,
              text: 'Results',
              onTap: () {},
            ),
            SizedBox(height: 20.h),
            moreContainerWidget(
              image: AppImage.pharm,
              text: 'Pharmacy',
              onTap:
                  () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PharmacyScreen()),
                  ),
            ),
            SizedBox(height: 20.h),
            moreContainerWidget(
              image: AppImage.history,
              text: 'Order History',
              onTap: () {},
            ),
            SizedBox(height: 20.h),
            moreContainerWidget(
              image: AppImage.help,
              text: 'Help & Support',
              onTap: () {},
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  moreContainerWidget({
    required String image,
    required String text,
    required Function() onTap,
  }) => GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColor.lightgrey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(image, color: AppColor.darkindgrey),
          SizedBox(width: 20.w),
          TextView(
            text: text,
            textStyle: GoogleFonts.gabarito(
              color: AppColor.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          Icon(Icons.keyboard_arrow_right_sharp, color: AppColor.darkindgrey),
        ],
      ),
    ),
  );
}
