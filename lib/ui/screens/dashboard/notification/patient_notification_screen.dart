import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_image.dart';
import 'package:my_doc_lab/ui/app_assets/constant.dart';
import 'package:my_doc_lab/ui/widget/text_widget.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';

class PatientNotificationScreen extends StatelessWidget {
  const PatientNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => locator<AuthViewModel>(),
        onViewModelReady: (model) {
          model.notification();
        },
        disposeViewModel: false,
        builder: (_, AuthViewModel model, __) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 50.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      text: 'Notification',
                      textStyle: GoogleFonts.dmSans(
                        color: AppColor.black,
                        fontSize: 20.0.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    GestureDetector(
                      // onTap:
                      //     () => Navigator.of(context).push(
                      //       MaterialPageRoute(
                      //         builder: (context) => PatientDetailComplaintScreen(),
                      //       ),
                      //     ),
                      child: SvgPicture.asset(
                        AppImage.settings,
                        width: 24.w,
                        height: 24.w,
                      ),
                    ),
                  ],
                ),
                Divider(color: AppColor.friendlyPrimary),
                SizedBox(height: 20.h),
                if (model.getNotificationResponse != null &&
                    model
                        .getNotificationResponse!
                        .getUserNotitficationModelList!
                        .isNotEmpty)
                  // TextView(
                  //   text: 'Today',
                  //   textStyle: GoogleFonts.dmSans(
                  //     color: AppColor.black,
                  //     fontSize: 18.0.sp,
                  //     fontWeight: FontWeight.w700,
                  //   ),
                  // ),
                  // SizedBox(height: 20.h),
                  ...model.getNotificationResponse!.getUserNotitficationModelList!.map(
                    (e) => Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.w,
                        horizontal: 16.w,
                      ),
                      margin: EdgeInsets.only(bottom: 10.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(
                          color: AppColor.funnyLookingGrey.withOpacity(.4),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(12.w),
                            decoration: BoxDecoration(
                              color: AppColor.fineRed.withOpacity(.2),
                              shape: BoxShape.circle,
                            ),
                            child: SvgPicture.asset(
                              AppImage.not,
                              width: 24.w,
                              height: 24.w,
                            ),
                          ),
                          SizedBox(width: 18.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextView(
                                text: 'Status: ${e.status?.capitalize() ?? ''}',
                                textStyle: GoogleFonts.dmSans(
                                  color: AppColor.black,
                                  fontSize: 15.0.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              TextView(
                                text: 'Order Ref: ${e.orderTrx ?? ''}',
                                textStyle: GoogleFonts.dmSans(
                                  color: AppColor.black,
                                  fontSize: 15.0.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 2.h),
                              SizedBox(
                                width: 240.w,
                                child: TextView(
                                  text:
                                      'Payment Method: ${e.paymentMethod?.capitalize() ?? ''}',
                                  maxLines: 2,
                                  textOverflow: TextOverflow.ellipsis,
                                  textStyle: GoogleFonts.dmSans(
                                    color: AppColor.black,
                                    fontSize: 15.0.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              SizedBox(height: 2.h),
                              TextView(
                                text:
                                    '${getCurrency()}${oCcy.format(double.parse('${e.totalAmount}'))}',
                                textStyle: TextStyle(
                                  color: AppColor.darkindgrey,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 4.h),

                              TextView(
                                text: DateFormat('dd MMM, yyyy').format(
                                  DateTime.parse(
                                    e.updatedAt.toString(),
                                  ).toLocal(),
                                ),

                                textStyle: GoogleFonts.dmSans(
                                  color: AppColor.funnyLookingGrey,
                                  fontSize: 11.0.sp,
                                  fontWeight: FontWeight.w400,
                                  fontStyle: FontStyle.italic,
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
          );
        },
      ),
    );
  }
}
