import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/core/connect_end/model/checkoutentitymodel.dart';
import 'package:my_doc_lab/main.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/widget/text_widget.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../app_assets/constant.dart';
import '../../../widget/button_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int? index;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => locator<AuthViewModel>(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          model.doubleTapDeleteCartSnack(context);
        });
      },
      disposeViewModel: false,
      builder: (_, AuthViewModel model, __) {
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

                  return GestureDetector(
                    onDoubleTap:
                        () => showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: TextView(
                                text: 'Delete Item From Cart',
                                textStyle: GoogleFonts.dmSans(
                                  color: AppColor.fineRed,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              content: TextView(
                                text:
                                    'Do you want to delete this item from the cart, clicking Ok permanenetly deletes this item from cart',
                                textStyle: GoogleFonts.dmSans(
                                  color: AppColor.black,
                                  fontSize: 15.0.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              actions: [
                                TextButton(
                                  child: TextView(
                                    text: 'Cancel',
                                    textStyle: GoogleFonts.dmSans(
                                      color: AppColor.fineRed,
                                      fontSize: 16.20.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(
                                      context,
                                    ).pop(); // Close the dialog
                                  },
                                ),
                                TextButton(
                                  child: TextView(
                                    text: 'OK',
                                    textStyle: GoogleFonts.dmSans(
                                      color: AppColor.green,
                                      fontSize: 16.20.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  onPressed: () {
                                    // Do something
                                    box.deleteAt(index);
                                    setState(() {});
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                    child: Container(
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
                                  text: 'Service:',
                                  textStyle: GoogleFonts.dmSans(
                                    color: AppColor.black,
                                    fontSize: 15.0.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextView(
                                  text: getServiceName(
                                    checkoutEntityModel.serviceType,
                                  ),
                                  textStyle: GoogleFonts.dmSans(
                                    color: AppColor.grey,
                                    fontSize: 15.0.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: AppColor.funnyLookingGrey,
                            thickness: 0.6,
                          ),
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
                                  text: 'Date:',
                                  textStyle: GoogleFonts.dmSans(
                                    color: AppColor.black,
                                    fontSize: 15.0.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextView(
                                  text: checkoutEntityModel.date.substring(
                                    0,
                                    10,
                                  ),
                                  textStyle: GoogleFonts.dmSans(
                                    color: AppColor.grey,
                                    fontSize: 15.0.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: AppColor.funnyLookingGrey,
                            thickness: 0.6,
                          ),
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
                                  text: 'Time:',
                                  textStyle: GoogleFonts.dmSans(
                                    color: AppColor.black,
                                    fontSize: 15.0.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextView(
                                  text: checkoutEntityModel.time,
                                  textStyle: GoogleFonts.dmSans(
                                    color: AppColor.grey,
                                    fontSize: 15.0.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: AppColor.funnyLookingGrey,
                            thickness: 0.6,
                          ),
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
                                  text: 'Dr ${checkoutEntityModel.doctor}',
                                  textStyle: GoogleFonts.dmSans(
                                    color: AppColor.grey,
                                    fontSize: 15.0.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: AppColor.funnyLookingGrey,
                            thickness: 0.6,
                          ),
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
                                  text: 'Amount:',
                                  textStyle: GoogleFonts.dmSans(
                                    color: AppColor.black,
                                    fontSize: 15.0.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextView(
                                  text:
                                      '${getCurrency()}${oCcy.format(double.parse(checkoutEntityModel.amount))}',
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
                                margin: EdgeInsets.only(
                                  top: 200.w,
                                  bottom: 200.w,
                                ),
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
      },
    );
  }

  getServiceName(name) {
    if (name == 'consult') {
      return 'Consultation';
    } else if (name == 'lab') {
      return 'Laboraory Test';
    } else {
      return 'Pharmacy Medication';
    }
  }
}
