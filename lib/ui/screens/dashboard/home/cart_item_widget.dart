import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/connect_end/model/checkoutentitymodel.dart';
import '../../../../main.dart';
import '../../../app_assets/app_color.dart';
import '../../../app_assets/constant.dart';
import '../../../widget/text_widget.dart';

class CartItemWidget extends StatefulWidget {
  final CheckoutEntityModel model;
  final int index;
  final VoidCallback onItemDeleted;

  const CartItemWidget({
    super.key,
    required this.model,
    required this.index,
    required this.onItemDeleted,
  });

  @override
  State<CartItemWidget> createState() => _CartItemWidgetState();
}

class _CartItemWidgetState extends State<CartItemWidget> {
  @override
  Widget build(BuildContext context) {
    final model = widget.model;

    return Column(
      children: [
        GestureDetector(
          onLongPress:
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
                          'Do you want to delete this item from the cart? Clicking OK will permanently delete it.',
                      textStyle: GoogleFonts.dmSans(
                        color: AppColor.black,
                        fontSize: 15.0.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: TextView(
                          text: 'Cancel',
                          textStyle: GoogleFonts.dmSans(
                            color: AppColor.fineRed,
                            fontSize: 16.20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          box.deleteAt(widget.index);
                          widget.onItemDeleted(); // Notify parent
                          Navigator.of(context).pop();
                        },
                        child: TextView(
                          text: 'OK',
                          textStyle: GoogleFonts.dmSans(
                            color: AppColor.green,
                            fontSize: 16.20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
          child: Container(
            margin: EdgeInsets.only(bottom: 20.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColor.funnyLookingGrey, width: 0.6),
            ),
            child: Column(
              children: [
                _row('Service:', getServiceName(model.serviceType)),
                _divider(),
                _row('Date:', model.date.substring(0, 10)),
                _divider(),
                _row('Time:', model.time),
                _divider(),
                _row('Prescribed by:', 'Dr ${model.doctor}'),
                model.qty != 0 ? _divider() : SizedBox.shrink(),
                model.qty != 0
                    ? _rowQuantity(
                      'Quantity:',
                      '${model.qty}',
                      onAdd: () {
                        if (model.qty > 0) {
                          model.qty = model.qty + 1;
                          setState(() {});
                        } else {}
                      },
                      onSubstract: () {
                        if (model.qty == 1) {
                        } else {
                          model.qty -= 1;
                          setState(() {});
                        }
                      },
                      valueColor: AppColor.primary,
                    )
                    : SizedBox.shrink(),
                _divider(),
                _rowAmount(
                  'Amount:',
                  '${getCurrency()}${oCcy.format(double.parse(getAmount(quantity: model.qty, amount: double.parse(model.amount))))}',
                  valueColor: AppColor.primary,
                ),
                SizedBox(height: 6.h),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String getAmount({num? quantity, double? amount}) {
    if (quantity == 0) {
      amount = amount;
    } else {
      amount = amount! * quantity!;
    }
    return amount.toString();
  }

  Widget _row(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.6.w, vertical: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextView(
            text: label,
            textStyle: GoogleFonts.dmSans(
              color: AppColor.black,
              fontSize: 15.0.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextView(
            text: value,
            textStyle: GoogleFonts.dmSans(
              color: valueColor ?? AppColor.grey,
              fontSize: 15.0.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _rowQuantity(
    String label,
    String value, {
    Color? valueColor,
    Function()? onAdd,
    Function()? onSubstract,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.6.w, vertical: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextView(
            text: label,
            textStyle: GoogleFonts.dmSans(
              color: AppColor.black,
              fontSize: 15.0.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            children: [
              Container(
                width: 30.w,
                height: 30.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColor.primary1),
                ),
                child: Center(
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: onSubstract,
                    icon: Icon(
                      Icons.remove,
                      color: AppColor.primary1,
                      size: 20.sp,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              TextView(
                text: value,
                textStyle: GoogleFonts.dmSans(
                  color: valueColor ?? AppColor.grey,
                  fontSize: 18.0.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(width: 10.w),
              Container(
                width: 30.w,
                height: 30.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppColor.primary1),
                ),
                child: Center(
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: onAdd,
                    icon: Icon(
                      Icons.add,
                      color: AppColor.primary1,
                      size: 20.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _rowAmount(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6.6.w, vertical: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextView(
            text: label,
            textStyle: GoogleFonts.dmSans(
              color: AppColor.black,
              fontSize: 15.0.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextView(
            text: value,
            textStyle: TextStyle(
              color: valueColor ?? AppColor.grey,
              fontSize: 15.8.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _divider() =>
      Divider(color: AppColor.funnyLookingGrey, thickness: 0.6);

  String getServiceName(String name) {
    if (name == 'consult') return 'Consultation';
    if (name == 'lab') return 'Laboratory Test';
    return 'Pharmacy Medication';
  }
}
