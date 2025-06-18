import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:stacked/stacked.dart';

import '../../../../../core/connect_end/view_model/pharm_view_model.dart';
import '../../../../app_assets/app_image.dart';
import '../../../../app_assets/constant.dart';
import '../../../../widget/text_widget.dart';

class PharmWalletScreen extends StatelessWidget {
  const PharmWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PharmViewModel>.reactive(
      viewModelBuilder: () => PharmViewModel(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          model.getPharmWallet();
        });
      },
      disposeViewModel: false,
      builder: (_, PharmViewModel model, __) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: RefreshIndicator(
            onRefresh: model.getPharmWalletReload,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 22.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back_ios_outlined, size: 20.sp),
                      ),
                      TextView(
                        text: 'My Wallet',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 20.h, width: 20.w),
                    ],
                  ),
                  Divider(color: AppColor.greylight),
                  SizedBox(height: 20.w),

                  SizedBox(height: 20.w),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 14.w,
                      horizontal: 18.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColor.greyIt),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text: 'Available Balance',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.primary1,
                            fontSize: 18.20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 5.10.w),
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppImage.wallet,
                              width: 18.w,
                              height: 16.20.h,
                              color: AppColor.primary1,
                            ),
                            SizedBox(width: 10.w),
                            TextView(
                              text:
                                  '${getCurrency()}${oCcy.format(double.parse('${model.getPharmWalletResponseModel?.balance ?? 0}'))}',
                              textStyle: TextStyle(
                                color: AppColor.primary1,
                                fontSize: 32.20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h),
                  TextView(
                    text: 'Transaction History',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.primary1,
                      fontSize: 17.90.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  if (model.getPharmWalletResponseModel != null &&
                      model.getPharmWalletResponseModel!.histories!.isNotEmpty)
                    ...model.getPharmWalletResponseModel!.histories!.reversed.map(
                      (o) => Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 14.w,
                          horizontal: 18.w,
                        ),
                        margin: EdgeInsets.only(bottom: 10.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColor.greyIt),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 170.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextView(
                                    text: o.reference ?? "",
                                    maxLines: 2,
                                    textOverflow: TextOverflow.ellipsis,
                                    textStyle: GoogleFonts.gabarito(
                                      color: AppColor.black,
                                      fontSize: 18.20.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextView(
                                    text: o.status?.capitalize() ?? '',
                                    textStyle: GoogleFonts.gabarito(
                                      color:
                                          o.status?.toLowerCase() ==
                                                  'successful'
                                              ? AppColor.green
                                              : AppColor.grey2,
                                      fontSize: 15.80.sp,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextView(
                                    text: o.type?.capitalize() ?? '',
                                    textStyle: GoogleFonts.gabarito(
                                      color: model.trnsType(o.type),
                                      fontSize: 14.20.sp,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                TextView(
                                  text:
                                      '${getCurrency()}${oCcy.format(double.parse('${o.amount ?? 0}'))}',
                                  textStyle: GoogleFonts.gabarito(
                                    color: model.trnsType(o.type),
                                    fontSize: 22.20.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                TextView(
                                  text: DateFormat('dd MMM, yyyy').format(
                                    DateTime.parse(
                                      o.createdAt.toString(),
                                    ).toLocal(),
                                  ),
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.black,
                                    fontSize: 17.20.sp,
                                    fontWeight: FontWeight.w400,
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
        );
      },
    );
  }
}
