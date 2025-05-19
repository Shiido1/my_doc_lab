import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/core/connect_end/model/checkoutentitymodel.dart';
import 'package:my_doc_lab/main.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/widget/text_widget.dart';

import '../../../widget/button_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 20.w),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.keyboard_arrow_left, size: 30.sp),
                ),
                TextView(
                  text: 'Cart',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.black,
                    fontSize: 20.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20.h, width: 20.w),
              ],
            ),
            SizedBox(height: 30.h),
            ...List.generate(box.length, (index) {
              CheckoutEntityModel checkoutEntityModel = box.getAt(index);
              print('object: $checkoutEntityModel');
              return Container(
                margin: EdgeInsets.only(bottom: 20.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: AppColor.funnyLookingGrey,
                    width: 0.6,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 8.w,
                        right: 6.6.w,
                        left: 6.6.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(
                            text: 'Drug Name',
                            textStyle: GoogleFonts.dmSans(
                              color: AppColor.black,
                              fontSize: 15.0.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextView(
                            text: 'Amoxicillin 500mg',
                            textStyle: GoogleFonts.dmSans(
                              color: AppColor.grey,
                              fontSize: 15.0.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(color: AppColor.funnyLookingGrey, thickness: 0.6),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 8.w,
                        right: 6.6.w,
                        left: 6.6.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(
                            text: 'Dosage',
                            textStyle: GoogleFonts.dmSans(
                              color: AppColor.black,
                              fontSize: 15.0.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextView(
                            text: '1 Tablet every 8 hours',
                            textStyle: GoogleFonts.dmSans(
                              color: AppColor.grey,
                              fontSize: 15.0.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(color: AppColor.funnyLookingGrey, thickness: 0.6),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 8.w,
                        right: 6.6.w,
                        left: 6.6.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(
                            text: 'Duration',
                            textStyle: GoogleFonts.dmSans(
                              color: AppColor.black,
                              fontSize: 15.0.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextView(
                            text: '7 days',
                            textStyle: GoogleFonts.dmSans(
                              color: AppColor.grey,
                              fontSize: 15.0.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(color: AppColor.funnyLookingGrey, thickness: 0.6),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 8.w,
                        right: 6.6.w,
                        left: 6.6.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(
                            text: 'Prescribed by:',
                            textStyle: GoogleFonts.dmSans(
                              color: AppColor.black,
                              fontSize: 15.0.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextView(
                            text: 'Dr Bolu Adeleke',
                            textStyle: GoogleFonts.dmSans(
                              color: AppColor.grey,
                              fontSize: 15.0.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(color: AppColor.funnyLookingGrey, thickness: 0.6),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 8.w,
                        right: 6.6.w,
                        left: 6.6.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(
                            text: 'Drug Name',
                            textStyle: GoogleFonts.dmSans(
                              color: AppColor.black,
                              fontSize: 15.0.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextView(
                            text: 'N10,000',
                            textStyle: GoogleFonts.dmSans(
                              color: AppColor.primary,
                              fontSize: 15.0.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 6.h),
                  ],
                ),
              );
            }),
            SizedBox(height: 140.h),
            ButtonWidget(
              buttonText: 'Proceed to Checkout',
              buttonColor: AppColor.primary1,
              buttonBorderColor: AppColor.transparent,
              textStyle: GoogleFonts.dmSans(
                color: AppColor.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
              ),
              onPressed:
                  () => showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder:
                        (ctxt) => Dialog(
                          backgroundColor: Colors.transparent,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 20.w,
                            ),
                            margin: EdgeInsets.only(top: 200.w, bottom: 200.w),
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(8.w),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColor.primary1,
                                  ),
                                  child: Icon(
                                    Icons.check,
                                    color: AppColor.white,
                                    size: 30.sp,
                                  ),
                                ),
                                SizedBox(height: 30.h),
                                TextView(
                                  text: 'Payment Successful',
                                  textStyle: GoogleFonts.dmSans(
                                    color: AppColor.black,
                                    fontSize: 15.80.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                TextView(
                                  text: 'Your payment has been approved',
                                  textStyle: GoogleFonts.dmSans(
                                    color: AppColor.black,
                                    fontSize: 15.80.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 40.h),
                                ButtonWidget(
                                  buttonText: 'Go to Appointments',
                                  buttonHeight: 40,
                                  buttonColor: AppColor.primary1,
                                  buttonBorderColor: AppColor.transparent,
                                  textStyle: GoogleFonts.dmSans(
                                    color: AppColor.white,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ),
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
