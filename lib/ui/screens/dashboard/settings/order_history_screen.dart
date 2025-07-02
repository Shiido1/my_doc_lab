// ignore_for_file: must_be_immutable, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/widget/text_widget.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/model/get_user_order_history_model/get_user_order_history_model.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../app_assets/app_color.dart';
import '../../../app_assets/constant.dart';

class OrderHistoryScreen extends StatelessWidget {
  OrderHistoryScreen({super.key});

  GetUserOrderHistoryModel? order;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => AuthViewModel(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          model.orderHistory();
        });
      },
      disposeViewModel: false,
      builder: (_, AuthViewModel model, __) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: RefreshIndicator(
            onRefresh: () async {
              model.orderHistory();
            },
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 22.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextView(
                    text: 'Order History',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Divider(color: AppColor.greylight),
                  SizedBox(height: 20.w),
                  TextView(
                    text: 'Active orders',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.primary1,
                      fontSize: 18.20.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 20.w),
                  if (model.getOrderHistoryResponse != null &&
                      model
                          .getOrderHistoryResponse!
                          .getUserOrderHistoryModelList!
                          .isNotEmpty)
                    ...model.getOrderHistoryResponse!.getUserOrderHistoryModelList!.map(
                      (o) => PopupMenuButton<String>(
                        onSelected: (String item) {
                          // Handle the selected menu item
                        },
                        color: AppColor.finegrey2,
                        itemBuilder: (BuildContext context) {
                          return [
                            if (o.items!.isNotEmpty)
                              ...o.items!.map(
                                (item) => PopupMenuItem<String>(
                                  value: item.serviceName,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 4.w,
                                      horizontal: 8.w,
                                    ),
                                    margin: EdgeInsets.only(
                                      top: 10.w,
                                      left: 1.8.w,
                                      right: 1.2.w,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColor.darkindgrey,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 120.w,
                                              child: TextView(
                                                text:
                                                    item.serviceName
                                                        ?.capitalize() ??
                                                    '',
                                                maxLines: 1,
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                textStyle: GoogleFonts.gabarito(
                                                  color: AppColor.black,
                                                  fontSize: 14.20.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            TextView(
                                              text:
                                                  '${getCurrency()}${oCcyMeds.format(double.parse('${item.price}'))}',

                                              textOverflow:
                                                  TextOverflow.ellipsis,

                                              textStyle: TextStyle(
                                                color:
                                                    item.status?.toLowerCase() ==
                                                            'processed'
                                                        ? AppColor.yellow
                                                        : item.status
                                                                ?.toLowerCase() ==
                                                            'completed'
                                                        ? AppColor.primary1
                                                        : AppColor.grey,
                                                fontSize: 15.20.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 4.10.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 1.4.w,
                                                horizontal: 4.w,
                                              ),
                                              margin: EdgeInsets.only(
                                                bottom: 6.w,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    item.status
                                                                ?.toLowerCase() ==
                                                            'processed'
                                                        ? AppColor.yellow
                                                            .withOpacity(.1)
                                                        : item.status
                                                                ?.toLowerCase() ==
                                                            'completed'
                                                        ? AppColor.primary1
                                                            .withOpacity(.1)
                                                        : AppColor.grey
                                                            .withOpacity(.1),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                              ),
                                              child: TextView(
                                                text: item.status ?? '',
                                                textStyle: GoogleFonts.gabarito(
                                                  color:
                                                      item.status?.toLowerCase() ==
                                                              'processed'
                                                          ? AppColor.yellow
                                                          : item.status
                                                                  ?.toLowerCase() ==
                                                              'completed'
                                                          ? AppColor.primary1
                                                          : AppColor.grey,
                                                  fontSize: 12.20.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            TextView(
                                              text:
                                                  '${item.serviceType?.capitalize()}',
                                              textStyle: GoogleFonts.gabarito(
                                                color:
                                                    AppColor.funnyLookingGrey,
                                                fontSize: 16.20.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    order = o;
                                    model.notifyListeners();
                                  },
                                ),
                              ),
                          ];
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            vertical: 14.w,
                            horizontal: 12.w,
                          ),
                          margin: EdgeInsets.only(top: 10.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.greylight.withOpacity(.28),
                            border: Border.all(
                              color: AppColor.greyIt.withOpacity(.4),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextView(
                                    text: 'Order ID',
                                    textStyle: GoogleFonts.gabarito(
                                      color: AppColor.black,
                                      fontSize: 18.20.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextView(
                                    text: o.orderTrx ?? '',
                                    textStyle: GoogleFonts.gabarito(
                                      color: AppColor.black,
                                      fontSize: 18.20.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  TextView(
                                    text: o.paymentMethod?.capitalize() ?? '',
                                    textStyle: GoogleFonts.gabarito(
                                      color: AppColor.black,
                                      fontSize: 14.20.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  Container(
                                    padding: EdgeInsets.all(4.w),
                                    decoration: BoxDecoration(
                                      color:
                                          o.status?.toLowerCase() == 'paid'
                                              ? AppColor.primary1.withOpacity(
                                                .2,
                                              )
                                              : AppColor.red.withOpacity(.2),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: TextView(
                                      text:
                                          '${getCurrency()}${oCcy.format(double.parse('${o.totalAmount}'))}',
                                      textStyle: TextStyle(
                                        color:
                                            o.status?.toLowerCase() == 'paid'
                                                ? AppColor.primary1
                                                : AppColor.red,
                                        fontSize: 17.20.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ), // Optional: Customize the button's icon
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
