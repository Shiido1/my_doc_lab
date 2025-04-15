import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import '../../../app_assets/app_image.dart';
import '../../../widget/text_form_widget.dart';
import '../../../widget/text_widget.dart';

class PharmacyProductScreen extends StatefulWidget {
  const PharmacyProductScreen({super.key});

  @override
  State<PharmacyProductScreen> createState() => _PharmacyProductScreenState();
}

class _PharmacyProductScreenState extends State<PharmacyProductScreen> {
  String tab = 'All';

  List<String> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
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
                  text: 'Product List',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20.h, width: 20.w),
              ],
            ),
            Divider(color: AppColor.funnyLookingGrey.withOpacity(.4)),
            SizedBox(height: 20.w),
            TextFormWidget(
              label: 'Search for products',
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
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 5.w,
                    horizontal: 10.w,
                  ),
                  decoration: BoxDecoration(
                    // ignore: deprecated_member_use
                    color: AppColor.primary1,

                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_circle_outline_outlined,
                        color: AppColor.white,
                        size: 16.sp,
                      ),
                      SizedBox(width: 10.w),
                      TextView(
                        text: 'Add',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.white,
                          fontSize: 13.0.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 5.w,
                    horizontal: 10.w,
                  ),
                  decoration: BoxDecoration(
                    // ignore: deprecated_member_use
                    color: AppColor.fineRed,

                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.remove_circle_outline_outlined,
                        color: AppColor.white,
                        size: 16.sp,
                      ),
                      SizedBox(width: 10.w),
                      TextView(
                        text: 'Add',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.white,
                          fontSize: 13.0.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 20.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 5.w,
                    horizontal: 10.w,
                  ),
                  decoration: BoxDecoration(
                    // ignore: deprecated_member_use
                    color: AppColor.yellow,

                    borderRadius: BorderRadius.circular(22),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.keyboard_arrow_down_sharp,
                        color: AppColor.white,
                        size: 16.sp,
                      ),
                      SizedBox(width: 10.w),
                      TextView(
                        text: 'Action',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.white,
                          fontSize: 13.0.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 20.h),

            Container(
              width: double.infinity,
              height: isTablet ? null : 440.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColor.greyIt.withOpacity(.05),
                border: Border.all(color: AppColor.greyIt.withOpacity(.3)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10.w, left: 10.w, top: 4.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(width: 10.w),
                        TextView(
                          text: 'Name',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.grey2,
                            fontSize: 16.8.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextView(
                          text: 'Price',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.grey2,
                            fontSize: 16.8.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextView(
                          text: 'Qty',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.grey2,
                            fontSize: 16.8.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextView(
                          text: 'Action',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.grey2,
                            fontSize: 16.8.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(color: AppColor.greyIt.withOpacity(.3)),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...[
                            1,
                            23,
                            4,
                            5,
                            6,
                            7,
                            8,
                            9,
                            0,
                            1,
                            2,
                            3,
                            4,
                            45,
                            5,
                            5,
                          ].map(
                            (o) => Row(
                              children: [
                                Checkbox(
                                  value: selectedOptions.contains(
                                    'Blood Sugar',
                                  ),
                                  onChanged: (isChecked) {
                                    setState(() {
                                      if (isChecked!) {
                                        selectedOptions.add('Blood Sugar');
                                      } else {
                                        selectedOptions.remove('Blood Sugar');
                                      }
                                    });
                                  },
                                ),
                                TextView(
                                  text: 'Furosemide',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.grey2,
                                    fontSize: 16.sp,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                TextView(
                                  text: 'N1000',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.grey2,
                                    fontSize: 16.sp,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                TextView(
                                  text: '100',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.grey2,
                                    fontSize: 16.sp,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(width: 30.w),
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      AppImage.edit,
                                      width: 20.w,
                                      height: 20.h,
                                      color: AppColor.black,
                                    ),
                                    SizedBox(width: 20.w),
                                    Icon(
                                      Icons.remove_circle_outline_outlined,
                                      color: AppColor.fineRed,
                                      size: 22.sp,
                                    ),
                                  ],
                                ),

                                // SizedBox(width: 10.w),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
