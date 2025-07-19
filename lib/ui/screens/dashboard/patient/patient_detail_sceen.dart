import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:doc_lab_pharm/ui/app_assets/app_color.dart';
import 'package:doc_lab_pharm/ui/app_assets/app_image.dart';
import 'package:stacked/stacked.dart';
import 'package:doc_lab_pharm/core/connect_end/model/get_pharm_order_model/get_pharm_order_model.dart';
import '../../../../core/connect_end/view_model/pharm_view_model.dart';
import '../../../app_assets/constant.dart';
import '../../../widget/text_widget.dart';

// ignore: must_be_immutable
class PatientDetailSceen extends StatefulWidget {
  PatientDetailSceen({super.key, this.order, this.item});
  Orders? order;
  Items? item;

  @override
  State<PatientDetailSceen> createState() => _PatientDetailSceenState();
}

class _PatientDetailSceenState extends State<PatientDetailSceen> {
  String? id;
  var items;
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PharmViewModel>.reactive(
      viewModelBuilder: () => PharmViewModel(),
      onViewModelReady: (model) async {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await getId();
          await model.getPharmOrderId(id);

          items = model.orderByIdResponseModel!.original!.orders![0].items!;
        });
      },
      disposeViewModel: false,
      builder: (_, PharmViewModel model, __) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Row(
                  children: [
                    model
                                .orderByIdResponseModel
                                ?.original
                                ?.orders?[0]
                                .user
                                ?.profileImage !=
                            null
                        ? Container(
                          decoration: BoxDecoration(
                            color: AppColor.oneKindgrey,
                            borderRadius: BorderRadius.circular(
                              10,
                            ), // Outer container radius
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              10,
                            ), // Apply to the image as well
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(50),
                              child: Image.network(
                                model
                                        .orderByIdResponseModel!
                                        .original!
                                        .orders![0]
                                        .user!
                                        .profileImage!
                                        .contains('https')
                                    ? '${model.orderByIdResponseModel?.original?.orders?[0].user?.profileImage}'
                                    : 'https://res.cloudinary.com/dnv6yelbr/image/upload/v1747827538/${model.orderByIdResponseModel?.original?.orders?[0].user?.profileImage}',
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (context, error, stackTrace) =>
                                        shimmerViewPharm(),
                              ),
                            ),
                          ),
                        )
                        : Container(
                          padding: EdgeInsets.all(48.8.w),
                          decoration: BoxDecoration(
                            color: AppColor.oneKindgrey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                    SizedBox(width: 20.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text:
                              '${model.orderByIdResponseModel?.original?.orders?[0].user?.firstName?.capitalize() ?? ''} ${model.orderByIdResponseModel?.original?.orders?[0].user?.lastName?.capitalize() ?? ''}',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.darkindgrey,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4.w),
                        TextView(
                          text:
                              'Order Id: ${model.orderByIdResponseModel?.original?.orders?[0].orderTrx ?? ''}',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.greyIt,
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 10.w),

                        // Row(
                        //   children: [
                        //     GestureDetector(
                        //       onTap:
                        //           () => navigate.navigateTo(
                        //             Routes.pharmChatScreen,
                        //             arguments: PharmChatScreenArguments(
                        //               id: '',
                        //               messageModel: null,
                        //               appOrder: widget.order,
                        //             ),
                        //           ),
                        //       child: Container(
                        //         padding: EdgeInsets.symmetric(
                        //           vertical: 4.w,
                        //           horizontal: 8.w,
                        //         ),
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(6),
                        //           border: Border.all(
                        //             color: AppColor.darkindgrey,
                        //           ),
                        //         ),
                        //         child: Row(
                        //           children: [
                        //             SvgPicture.asset(
                        //               AppImage.chat,
                        //               height: 14.h,
                        //               width: 14.w,
                        //               color: AppColor.darkindgrey,
                        //             ),
                        //             SizedBox(width: 4.w),
                        //             TextView(
                        //               text: 'Message',
                        //               textStyle: GoogleFonts.gabarito(
                        //                 color: AppColor.darkindgrey,
                        //                 fontSize: 14.sp,
                        //                 fontWeight: FontWeight.w500,
                        //               ),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ),
                        //     SizedBox(width: 20.w),
                        //     GestureDetector(
                        //       onTap:
                        //           () => model.pharmOrderUpdate(
                        //             context,
                        //             id:
                        //                 model
                        //                     .orderByIdResponseModel!
                        //                     .original!
                        //                     .orders![0]
                        //                     .id
                        //                     .toString(),
                        //             reason: 'ok reason',
                        //             status: 'completed',
                        //           ),
                        //       child: Container(
                        //         padding: EdgeInsets.symmetric(
                        //           vertical: 4.w,
                        //           horizontal: 8.w,
                        //         ),
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(6),
                        //           border: Border.all(color: AppColor.white),
                        //           color: AppColor.darkindgrey,
                        //         ),
                        //         child: TextView(
                        //           text: 'Approve',
                        //           textStyle: GoogleFonts.gabarito(
                        //             color: AppColor.white,
                        //             fontSize: 14.sp,
                        //             fontWeight: FontWeight.w500,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.w),
                Divider(color: AppColor.greyIt, thickness: 1),
                SizedBox(height: 30.h),
                if (model.orderByIdResponseModel != null)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 4.w,
                              horizontal: 8.w,
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColor.grey),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'Contact Information',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.darkindgrey,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                SizedBox(height: 6.h),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    TextView(
                                      text: 'Address:',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.darkindgrey,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Spacer(),
                                    SizedBox(
                                      width: 200.w,
                                      child: TextView(
                                        text:
                                            '${model.orderByIdResponseModel?.original?.orders?[0].user?.address?.capitalize() ?? ''} ${model.orderByIdResponseModel?.original?.orders?[0].user?.city?.capitalize() ?? ''} ${model.orderByIdResponseModel?.original?.orders?[0].user?.state?.capitalize() ?? ''}',
                                        maxLines: 4,
                                        textAlign: TextAlign.end,
                                        textStyle: GoogleFonts.gabarito(
                                          color: AppColor.darkindgrey,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 6.h),
                              ],
                            ),
                          ),

                          model.orderByIdResponseModel != null &&
                                  model
                                      .orderByIdResponseModel!
                                      .original!
                                      .orders![0]
                                      .items!
                                      .any(
                                        (element) =>
                                            element.status!.toLowerCase() ==
                                            'processed',
                                      )
                              ? Container(
                                width: double.infinity,
                                margin: EdgeInsets.only(top: 12.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: AppColor.greyIt),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColor.primary1.withOpacity(
                                          .7,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(6),
                                          topRight: Radius.circular(6),
                                        ),
                                      ),
                                      width: double.infinity,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 10.w,
                                          vertical: 4.w,
                                        ),
                                        child: Row(
                                          children: [
                                            SvgPicture.asset(
                                              AppImage.task,
                                              color: AppColor.white,
                                            ),
                                            SizedBox(width: 10.w),
                                            TextView(
                                              text: 'Upcoming Orders',
                                              textStyle: GoogleFonts.gabarito(
                                                color: AppColor.white,
                                                fontSize: 14.8.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    Column(
                                      children: [
                                        SizedBox(height: 10.h),
                                        if (items.isNotEmpty)
                                          ...items.asMap().entries.map((entry) {
                                            final index = entry.key;
                                            final o = entry.value;
                                            final isLast =
                                                index == items.length - 1;
                                            return Wrap(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 10.w,
                                                  ),

                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              horizontal: 10.w,
                                                            ),
                                                        child: TextView(
                                                          text: DateFormat(
                                                            'dd/MM/yyyy',
                                                          ).format(
                                                            DateTime.parse(
                                                              o.updatedAt
                                                                  .toString(),
                                                            ).toLocal(),
                                                          ),
                                                          textStyle:
                                                              GoogleFonts.gabarito(
                                                                color:
                                                                    AppColor
                                                                        .grey,
                                                                fontSize: 16.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                          SvgPicture.asset(
                                                            AppImage.time,
                                                            color:
                                                                AppColor.grey,
                                                          ),
                                                          SizedBox(width: 6.w),
                                                          TextView(
                                                            text: DateFormat(
                                                              'hh:mma',
                                                            ).format(
                                                              DateTime.parse(
                                                                o.updatedAt
                                                                    .toString(),
                                                              ).toLocal(),
                                                            ),
                                                            textStyle:
                                                                GoogleFonts.gabarito(
                                                                  color:
                                                                      AppColor
                                                                          .grey,
                                                                  fontSize:
                                                                      16.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),

                                                if (!isLast) ...[
                                                  Divider(
                                                    color: AppColor.greyIt,
                                                  ),
                                                ],
                                              ],
                                            );
                                          }),
                                        SizedBox(height: 10.h),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                              : SizedBox.shrink(),

                          SizedBox(height: 20.h),
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppImage.pres,
                                height: 12.h,
                                width: 12.w,
                              ),
                              SizedBox(width: 6.w),
                              TextView(
                                text: 'Prescriptions',
                                textStyle: GoogleFonts.gabarito(
                                  color: AppColor.darkindgrey,
                                  fontSize: 16.20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.h),
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 4.w,
                              horizontal: 8.w,
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColor.grey),
                            ),
                            child: Column(
                              children: [
                                if (items.isNotEmpty)
                                  ...items.asMap().entries.map((entry) {
                                    final index = entry.key;
                                    final o = entry.value;
                                    final isLast = index == items.length - 1;

                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextView(
                                          text:
                                              'Drug: ${o.medicine?.name ?? ''}',
                                          textStyle: GoogleFonts.gabarito(
                                            color: AppColor.darkindgrey,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(height: 6.h),
                                        TextView(
                                          text: 'Quantity: ${o.quantity}',
                                          textStyle: GoogleFonts.gabarito(
                                            color: AppColor.darkindgrey,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(height: 6.h),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            TextView(
                                              text:
                                                  'Price: ${getCurrency()}${oCcy.format(double.parse(o.medicine!.price.toString()))}',
                                              textStyle: TextStyle(
                                                color: AppColor.darkindgrey,
                                                fontSize: 15.0.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),

                                            o.status == 'cancelled' ||
                                                    o.status == 'completed'
                                                ? SizedBox.shrink()
                                                : Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap:
                                                          () => model
                                                              .pharmOrderUpdateItem(
                                                                context,
                                                                status:
                                                                    'completed',
                                                                reason:
                                                                    'ok reason',
                                                                id:
                                                                    o.id.toString(),
                                                              ),
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              vertical: 4.w,
                                                              horizontal: 8.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                6,
                                                              ),
                                                          border: Border.all(
                                                            color:
                                                                AppColor.white,
                                                          ),
                                                          color:
                                                              AppColor
                                                                  .darkindgrey,
                                                        ),
                                                        child: TextView(
                                                          text: 'Approve',
                                                          textStyle:
                                                              GoogleFonts.gabarito(
                                                                color:
                                                                    AppColor
                                                                        .white,
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(width: 10.w),
                                                    GestureDetector(
                                                      onTap:
                                                          () => model
                                                              .cancelItemOrderDialogBox(
                                                                context,
                                                                id:
                                                                    o.id.toString(),
                                                              ),
                                                      child: Container(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                              vertical: 4.w,
                                                              horizontal: 8.w,
                                                            ),
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                6,
                                                              ),
                                                          border: Border.all(
                                                            color:
                                                                AppColor.white,
                                                          ),
                                                          color: AppColor.red,
                                                        ),
                                                        child: TextView(
                                                          text: 'Cancel',
                                                          textStyle:
                                                              GoogleFonts.gabarito(
                                                                color:
                                                                    AppColor
                                                                        .white,
                                                                fontSize: 14.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                          ],
                                        ),
                                        if (!isLast) ...[
                                          SizedBox(height: 3.0.h),
                                          Divider(color: AppColor.greyIt),
                                          SizedBox(height: 3.0.h),
                                        ],
                                      ],
                                    );
                                  }),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  TextView(
                                    text: 'Total:',
                                    textStyle: GoogleFonts.gabarito(
                                      color: AppColor.darkindgrey,
                                      fontSize: 16.20.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 12.w),
                                  TextView(
                                    text:
                                        '${getCurrency()}${oCcy.format(double.parse(model.orderByIdResponseModel?.original?.orders?[0].totalSum.toString() ?? '0.0'))}',
                                    textStyle: TextStyle(
                                      color: AppColor.darkindgrey,
                                      fontSize: 18.20.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap:
                                    () => model.cancelItemOrderDialogBox(
                                      context,
                                      id:
                                          model
                                              .orderByIdResponseModel!
                                              .original!
                                              .orders![0]
                                              .id
                                              .toString(),
                                    ),
                                child: Container(
                                  width: 100.w,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 4.w,
                                    horizontal: 8.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    border: Border.all(color: AppColor.white),
                                    color: AppColor.fineRed,
                                  ),
                                  child: Center(
                                    child: TextView(
                                      text: 'Cancel',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.white,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 30.h),
                        ],
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

  Future<void> getId() async {
    if (widget.order != null) {
      id = widget.order!.id.toString();
      setState(() {});
    } else {
      id = widget.item!.orderId.toString();
      setState(() {});
    }
  }
}
