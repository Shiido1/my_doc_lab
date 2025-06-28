// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/constant.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

import '../../../../../core/connect_end/model/get_pharm_order_model/get_pharm_order_model.dart';
import '../../../../../core/connect_end/view_model/pharm_view_model.dart';
import '../../../../app_assets/app_color.dart';
import '../../../../widget/text_widget.dart';

// ignore: must_be_immutable
class ProductStatusFailed extends StatelessWidget {
  ProductStatusFailed({super.key, required this.item});
  Items? item;

  @override
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PharmViewModel>.reactive(
      viewModelBuilder: () => PharmViewModel(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await model.getPharmOrderId(item?.orderId.toString());
        });
      },
      disposeViewModel: false,
      builder: (_, PharmViewModel model, __) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 8.w),
          margin: EdgeInsets.only(bottom: 14.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColor.oneKindgrey),
          ),
          child: Row(
            children: [
              model
                          .orderByIdResponseModel
                          ?.original
                          ?.orders?[0]
                          .user
                          ?.profileImage !=
                      null
                  ? Padding(
                    padding: EdgeInsets.only(top: 8.w),
                    child: ClipOval(
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(30),
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
                  : shimmerVieRound(),

              SizedBox(width: 20.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  model.isLoading || model.orderByIdResponseModel == null
                      ? Shimmer.fromColors(
                        baseColor: AppColor.friendlyPrimary,
                        highlightColor: AppColor.primary1.withOpacity(.5),
                        child: Container(
                          height: 10.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      )
                      : TextView(
                        text:
                            '${model.orderByIdResponseModel?.original?.orders?[0].user?.firstName?.capitalize() ?? ''} ${model.orderByIdResponseModel?.original?.orders?[0].user?.lastName?.capitalize() ?? ''}',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.darkindgrey,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  SizedBox(height: 4.w),
                  model.isLoading || model.orderByIdResponseModel == null
                      ? Shimmer.fromColors(
                        baseColor: AppColor.friendlyPrimary,
                        highlightColor: AppColor.primary1.withOpacity(.5),
                        child: Container(
                          height: 10.h,
                          width: 120.w,
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      )
                      : TextView(
                        text:
                            'Order No: ${model.orderByIdResponseModel?.original?.orders?[0].orderTrx ?? ''}',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.greyIt,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                  SizedBox(height: 10.w),
                  model.isLoading || model.orderByIdResponseModel == null
                      ? Shimmer.fromColors(
                        baseColor: AppColor.friendlyPrimary,
                        highlightColor: AppColor.primary1.withOpacity(.5),
                        child: Container(
                          height: 10.h,
                          width: 80.w,
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                      )
                      : Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 2.w,
                          horizontal: 6.w,
                        ),
                        decoration: BoxDecoration(
                          color: model
                              .statusValueColor(item?.status)
                              .withOpacity(.2),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: TextView(
                          text: model.statusValue(item?.status),
                          textStyle: GoogleFonts.gabarito(
                            color: model.statusValueColor(item?.status),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
