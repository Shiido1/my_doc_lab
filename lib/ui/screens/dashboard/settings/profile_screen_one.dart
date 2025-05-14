import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/widget/text_form_widget.dart';
import '../../../app_assets/app_image.dart';
import '../../../widget/text_widget.dart';
import '../appointment/consultation_screen.dart';
import 'med_profile_screen.dart';

class ProfileScreen1 extends StatefulWidget {
  const ProfileScreen1({super.key});

  @override
  State<ProfileScreen1> createState() => _ProfileScreen1State();
}

class _ProfileScreen1State extends State<ProfileScreen1> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.keyboard_arrow_left, size: 30.sp),
            ),
            SizedBox(height: 10.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset(
                    AppImage.finedoc,
                    height: 136.h,
                    width: 130.w,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text: 'Dr Bolu Adeleke',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.black,
                          fontSize: 20.0.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      TextView(
                        text: 'Cardiologist',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.grey,
                          fontSize: 14.0.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 10.h),

                      Container(
                        width: 50.w,
                        padding: EdgeInsets.symmetric(
                          vertical: 2.h,
                          horizontal: 6.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: AppColor.primary,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: AppColor.white,
                              size: 14.sp,
                            ),
                            SizedBox(width: 3.w),
                            TextView(
                              text: '4.8',
                              textStyle: GoogleFonts.dmSans(
                                color: AppColor.white,
                                fontSize: 12.0.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.w),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppImage.location,
                            height: 14.h,
                            width: 14.w,
                          ),
                          SizedBox(width: 4.w),
                          TextView(
                            text: '800m away',
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.black,
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.w),
            TextView(
              text: 'About',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.black,
                fontSize: 16.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20.w),
            !isTapped
                ? Wrap(
                  children: [
                    SizedBox(
                      width: 350.w,
                      child: TextView(
                        text:
                            'Lorem ipsum dolor sit amet consectetur. Eu malesuada eu porta vitae neque ac. Purus lectus id suspendisse tempus morbi massa lectus urna. Maecenas donec eget eu et sed. Enim egestas arcu',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.black,
                          fontSize: 14.60.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 3,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isTapped = true;
                        });
                      },
                      child: TextView(
                        text: 'Read More',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.green,
                          fontSize: 14.60.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                )
                : Wrap(
                  children: [
                    SizedBox(
                      child: TextView(
                        text:
                            'Lorem ipsum dolor sit amet consectetur. Eu malesuada eu porta vitae neque ac. Purus lectus id suspendisse tempus morbi massa lectus urna. Maecenas donec eget eu et sed. Enim egestas arcu, Lorem ipsum dolor sit amet consectetur. Eu malesuada eu porta vitae neque ac. Purus lectus id suspendisse tempus morbi massa lectus urna. Maecenas donec eget eu et sed. Enim egestas arcu,Lorem ipsum dolor sit amet consectetur. Eu malesuada eu porta vitae neque ac. Purus lectus id suspendisse tempus morbi massa lectus urna. Maecenas donec eget eu et sed. Enim egestas arcu',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.black,
                          fontSize: 14.60.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isTapped = false;
                        });
                      },
                      child: TextView(
                        text: 'Read Less',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.green,
                          fontSize: 14.60.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
            SizedBox(height: 20.w),
            TextView(
              text: 'Time Availability',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.black,
                fontSize: 16.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.w),
            TextView(
              text: 'Mon - Sat : 10:00 am - 5:00 pm',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.grey1,
                fontSize: 14.20.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20.w),
            TextView(
              text: 'Certification',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.black,
                fontSize: 16.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20.w),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(AppImage.gradcap, height: 20.h, width: 20.w),
                SizedBox(width: 18.20.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: 'University of Jos',
                      textStyle: GoogleFonts.gabarito(
                        color: AppColor.black,
                        fontSize: 14.60.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 2.4.h),
                    TextView(
                      text: 'Doctor of Medicine',
                      textStyle: GoogleFonts.gabarito(
                        color: AppColor.green,
                        fontSize: 14.60.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.w),
            TextView(
              text: 'Location',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.black,
                fontSize: 16.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20.w),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(AppImage.location, height: 22.h, width: 22.w),
                SizedBox(width: 16.20.w),
                TextView(
                  text: 'Federal Housing Lugbe, FCT, Abuja.',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 14.60.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            SizedBox(height: 4.0.w),
            Divider(color: AppColor.grey, thickness: .3),
            TextView(
              text: 'Medicine',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.black,
                fontSize: 16.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 4.0.w),
            TextFormWidget(
              label: 'Search for Medicine',
              // hint: 'Email Address',
              border: 10,
              isFilled: true,
              fillColor: AppColor.transparent,
              // controller: fullnameTextController,
              prefixWidget: Padding(
                padding: EdgeInsets.all(14.w),
                child: SvgPicture.asset(AppImage.search),
              ),
              suffixWidget: Padding(
                padding: EdgeInsets.all(14.w),
                child: SvgPicture.asset(AppImage.filter),
              ),
              // validator: AppValidator.validateEmail(),
            ),
            SizedBox(height: 10.w),
            TextView(
              text: 'Service',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.black,
                fontSize: 16.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 4.0.w),
            SizedBox(
              height: 270.h,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  crossAxisCount: 2,
                  mainAxisExtent:
                      Platform.isIOS ? 250 : 210, // Number of columns
                ),
                itemBuilder: (context, index) {
                  // Build each grid item based on the index
                  return GestureDetector(
                    onTap:
                        () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MedProfileScreen(),
                          ),
                        ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: AppColor.funnyLookingGrey.withOpacity(.3),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.asset(
                              AppImage.medicine,
                              height: 150.h,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.w),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextView(
                                  text: 'MOKO Hydrogen Peroxide 100ml',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.darkindgrey,
                                    fontSize: 12.0.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextView(
                                  text: 'N 300.00',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.darkindgrey,
                                    fontSize: 12.0.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:
                              (context) => ConsultationScreen(bookTyoe: 'book'),
                        ),
                      ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 7.2.w,
                      horizontal: 14.0.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.primary1,
                    ),
                    child: TextView(
                      text: 'Book Appointment',
                      textStyle: GoogleFonts.gabarito(
                        color: AppColor.white,
                        fontSize: 14.0.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  ConsultationScreen(bookTyoe: 'book-friend'),
                        ),
                      ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 7.2.w,
                      horizontal: 14.0.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 181, 222, 204),
                    ),
                    child: TextView(
                      text: 'Book for Someone else',
                      textStyle: GoogleFonts.gabarito(
                        color: AppColor.darkindgrey,
                        fontSize: 14.0.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 60.h),
          ],
        ),
      ),
    );
  }
}
