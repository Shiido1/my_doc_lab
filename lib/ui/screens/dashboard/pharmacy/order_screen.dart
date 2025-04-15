import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/screens/dashboard/patient/patient_detail_sceen.dart';

import '../../../app_assets/app_image.dart';
import '../../../widget/text_form_widget.dart';
import '../../../widget/text_widget.dart';

class PharmacyOrderScreen extends StatefulWidget {
  const PharmacyOrderScreen({super.key});

  @override
  State<PharmacyOrderScreen> createState() => _PharmacyOrderScreenState();
}

class _PharmacyOrderScreenState extends State<PharmacyOrderScreen> {
  String tab = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 22.w),
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
                  text: 'Orders',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20.h, width: 20.w),
              ],
            ),
            SizedBox(height: 20.w),
            TextFormWidget(
              label: 'Search for Patients...',
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
            SizedBox(height: 30.h),

            Container(
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: AppColor.primary1.withOpacity(.08),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColor.greylight),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => setState(() => tab = 'All'),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.w,
                        horizontal: 10.w,
                      ),
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color:
                            tab == 'All'
                                ? AppColor.primary1
                                : AppColor.transparent,

                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextView(
                        text: 'All',
                        textStyle: GoogleFonts.dmSans(
                          color:
                              tab == 'All' ? AppColor.white : AppColor.primary1,
                          fontSize: 13.0.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => tab = 'In progress'),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.w,
                        horizontal: 10.w,
                      ),
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color:
                            tab == 'In progress'
                                ? AppColor.primary1
                                : AppColor.transparent,

                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextView(
                        text: 'In progress',
                        textStyle: GoogleFonts.dmSans(
                          color:
                              tab == 'In progress'
                                  ? AppColor.white
                                  : AppColor.primary1,
                          fontSize: 13.0.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => tab = 'Failed'),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.w,
                        horizontal: 10.w,
                      ),
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color:
                            tab == 'Failed'
                                ? AppColor.primary1
                                : AppColor.transparent,

                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextView(
                        text: 'Failed',
                        textStyle: GoogleFonts.gabarito(
                          color:
                              tab == 'Failed'
                                  ? AppColor.white
                                  : AppColor.primary1,
                          fontSize: 13.0.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => tab = 'Completed'),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.w,
                        horizontal: 10.w,
                      ),
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color:
                            tab == 'Completed'
                                ? AppColor.primary1
                                : AppColor.transparent,

                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextView(
                        text: 'Completed',
                        textStyle: GoogleFonts.gabarito(
                          color:
                              tab == 'Completed'
                                  ? AppColor.white
                                  : AppColor.primary1,
                          fontSize: 13.0.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (tab == 'All')
                      ...[1, 2, 3, 3].map(
                        (i) => GestureDetector(
                          onTap:
                              () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => PatientDetailSceen(),
                                ),
                              ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 8.w,
                              horizontal: 8.w,
                            ),
                            margin: EdgeInsets.only(bottom: 14.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColor.oneKindgrey),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(28.8.w),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.oneKindgrey,
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
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 4.w),
                                    TextView(
                                      text: 'Order No: #57',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.greyIt,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: 10.w),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 2.w,
                                        horizontal: 6.w,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColor.primary1.withOpacity(
                                          .2,
                                        ),
                                        borderRadius: BorderRadius.circular(22),
                                      ),
                                      child: TextView(
                                        text: 'Completed',
                                        textStyle: GoogleFonts.gabarito(
                                          color: AppColor.primary1,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    else if (tab == 'In progress')
                      ...[1, 2].map(
                        (i) => GestureDetector(
                          onTap:
                              () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => PatientDetailSceen(),
                                ),
                              ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 8.w,
                              horizontal: 8.w,
                            ),
                            margin: EdgeInsets.only(bottom: 14.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColor.oneKindgrey),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(28.8.w),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.oneKindgrey,
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
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 4.w),
                                    TextView(
                                      text: 'Order No: #57',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.greyIt,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: 10.w),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 2.w,
                                        horizontal: 6.w,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColor.yellow.withOpacity(.2),
                                        borderRadius: BorderRadius.circular(22),
                                      ),
                                      child: TextView(
                                        text: 'In progress',
                                        textStyle: GoogleFonts.gabarito(
                                          color: AppColor.brown,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    else if (tab == 'Failed')
                      ...[1, 2].map(
                        (i) => GestureDetector(
                          onTap:
                              () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => PatientDetailSceen(),
                                ),
                              ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 8.w,
                              horizontal: 8.w,
                            ),
                            margin: EdgeInsets.only(bottom: 14.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: AppColor.oneKindgrey),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(28.8.w),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.oneKindgrey,
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
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 4.w),
                                    TextView(
                                      text: 'Order No: #57',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.greyIt,
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: 10.w),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 2.w,
                                        horizontal: 6.w,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColor.fineRed.withOpacity(.2),
                                        borderRadius: BorderRadius.circular(22),
                                      ),
                                      child: TextView(
                                        text: 'Failed',
                                        textStyle: GoogleFonts.gabarito(
                                          color: AppColor.fineRed,
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    else
                      GestureDetector(
                        onTap:
                            () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => PatientDetailSceen(),
                              ),
                            ),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 8.w,
                            horizontal: 8.w,
                          ),
                          margin: EdgeInsets.only(bottom: 14.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: AppColor.oneKindgrey),
                          ),
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(28.8.w),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.oneKindgrey,
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
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 4.w),
                                  TextView(
                                    text: 'Order No: #57',
                                    textStyle: GoogleFonts.gabarito(
                                      color: AppColor.greyIt,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 10.w),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 2.w,
                                      horizontal: 6.w,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColor.primary1.withOpacity(.2),
                                      borderRadius: BorderRadius.circular(22),
                                    ),
                                    child: TextView(
                                      text: 'Completed',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.primary1,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
