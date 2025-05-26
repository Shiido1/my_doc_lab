import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/main.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/widget/text_widget.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../app_assets/constant.dart';
import '../../../widget/button_widget.dart';
import 'cart_item_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
                  return CartItemWidget(
                    model: box.getAt(index),
                    index: index,
                    onItemDeleted: () {
                      setState(() {});
                    },
                  );
                }),

                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      text: 'Total:',
                      textStyle: GoogleFonts.dmSans(
                        color: AppColor.black,
                        fontSize: 18.0.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextView(
                      text:
                          '${getCurrency()}${oCcy.format(double.parse('${model.getCartTotal()}'))}',
                      textStyle: GoogleFonts.dmSans(
                        color: AppColor.black,
                        fontSize: 20.0.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),

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
                  onPressed: () {
                    model.clickCheckout();
                    model.showCheckoutModal(context);
                  },
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
