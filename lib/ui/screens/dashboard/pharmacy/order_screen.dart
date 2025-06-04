import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/constant.dart';
import 'package:my_doc_lab/ui/screens/dashboard/patient/patient_detail_sceen.dart';
import 'package:my_doc_lab/ui/screens/dashboard/pharmacy/product_status_widget/product_status_widget.dart';
import 'package:my_doc_lab/ui/screens/dashboard/pharmacy/product_status_widget/product_status_widget_failed.dart';
import 'package:my_doc_lab/ui/screens/dashboard/pharmacy/product_status_widget/product_status_widget_proceed.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/view_model/pharm_view_model.dart';
import '../../../app_assets/app_image.dart';
import '../../../widget/text_form_widget.dart';
import '../../../widget/text_widget.dart';

class PharmacyOrderScreen extends StatelessWidget {
  const PharmacyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PharmViewModel>.reactive(
      viewModelBuilder: () => PharmViewModel(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await model.getPharmOrder();
        });
      },
      disposeViewModel: false,
      builder: (_, PharmViewModel model, __) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 22.w),
            child: Column(
              children: [
                SizedBox(height: 10.w),
                Center(
                  child: TextView(
                    text: 'Orders',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 20.w),
                TextFormWidget(
                  label: 'Search for Patients...',
                  border: 10,
                  isFilled: true,
                  fillColor: AppColor.transparent,
                  prefixWidget: Padding(
                    padding: EdgeInsets.all(14.w),
                    child: SvgPicture.asset(
                      AppImage.search,
                      height: 20.h,
                      width: 20.w,
                    ),
                  ),
                  onChange: (p0) {},
                ),
                SizedBox(height: 30.h),

                Container(
                  decoration: BoxDecoration(
                    // ignore: deprecated_member_use
                    color: AppColor.primary1.withOpacity(.08),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColor.greylight),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          model.tab = 'All';
                          model.notifyListeners();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 5.w,
                            horizontal: 10.w,
                          ),
                          decoration: BoxDecoration(
                            // ignore: deprecated_member_use
                            color:
                                model.tab == 'All'
                                    ? AppColor.primary1
                                    : AppColor.transparent,

                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextView(
                            text: 'All',
                            textStyle: GoogleFonts.dmSans(
                              color:
                                  model.tab == 'All'
                                      ? AppColor.white
                                      : AppColor.primary1,
                              fontSize: 13.0.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          model.tab = 'In progress';
                          model.notifyListeners();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 5.w,
                            horizontal: 10.w,
                          ),
                          decoration: BoxDecoration(
                            // ignore: deprecated_member_use
                            color:
                                model.tab == 'In progress'
                                    ? AppColor.primary1
                                    : AppColor.transparent,

                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextView(
                            text: 'In progress',
                            textStyle: GoogleFonts.dmSans(
                              color:
                                  model.tab == 'In progress'
                                      ? AppColor.white
                                      : AppColor.primary1,
                              fontSize: 13.0.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          model.tab = 'Failed';
                          model.notifyListeners();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 5.w,
                            horizontal: 10.w,
                          ),
                          decoration: BoxDecoration(
                            // ignore: deprecated_member_use
                            color:
                                model.tab == 'Failed'
                                    ? AppColor.primary1
                                    : AppColor.transparent,

                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextView(
                            text: 'Failed',
                            textStyle: GoogleFonts.gabarito(
                              color:
                                  model.tab == 'Failed'
                                      ? AppColor.white
                                      : AppColor.primary1,
                              fontSize: 13.0.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          model.tab = 'Completed';
                          model.notifyListeners();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 5.w,
                            horizontal: 10.w,
                          ),
                          decoration: BoxDecoration(
                            // ignore: deprecated_member_use
                            color:
                                model.tab == 'Completed'
                                    ? AppColor.primary1
                                    : AppColor.transparent,

                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextView(
                            text: 'Completed',
                            textStyle: GoogleFonts.gabarito(
                              color:
                                  model.tab == 'Completed'
                                      ? AppColor.white
                                      : AppColor.primary1,
                              fontSize: 13.0.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),

                if (model.tab == 'All')
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          if (model.getPharmOrderModel != null &&
                              model
                                  .getPharmOrderModel!
                                  .original!
                                  .orders!
                                  .isNotEmpty)
                            ...model.getPharmOrderModel!.original!.orders!.map(
                              (i) => GestureDetector(
                                onTap:
                                    () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder:
                                            (context) => PatientDetailSceen(),
                                      ),
                                    ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 8.w,
                                    horizontal: 8.w,
                                  ),
                                  margin: EdgeInsets.only(bottom: 14.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: AppColor.oneKindgrey,
                                    ),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      i.user?.profileImage != null
                                          ? Padding(
                                            padding: EdgeInsets.only(top: 8.w),
                                            child: ClipOval(
                                              child: SizedBox.fromSize(
                                                size: const Size.fromRadius(30),
                                                child: Image.network(
                                                  i.user!.profileImage!
                                                          .contains('https')
                                                      ? '${i.user?.profileImage}'
                                                      : 'https://res.cloudinary.com/dnv6yelbr/image/upload/v1747827538/${i.user?.profileImage}',
                                                  fit: BoxFit.cover,
                                                  errorBuilder:
                                                      (
                                                        context,
                                                        error,
                                                        stackTrace,
                                                      ) => shimmerViewPharm(),
                                                ),
                                              ),
                                            ),
                                          )
                                          : Container(
                                            padding: EdgeInsets.all(28.8.w),
                                            margin: EdgeInsets.only(top: 8.w),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: AppColor.oneKindgrey,
                                            ),
                                          ),
                                      SizedBox(width: 20.w),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: 220.w,
                                            child: TextView(
                                              text:
                                                  '${i.user?.firstName?.capitalize()} ${i.user?.lastName?.capitalize()}',
                                              textOverflow: TextOverflow.fade,
                                              maxLines: 1,
                                              textStyle: GoogleFonts.gabarito(
                                                color: AppColor.darkindgrey,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 4.w),
                                          TextView(
                                            text: 'Order No: ${i.orderTrx}',
                                            textStyle: GoogleFonts.gabarito(
                                              color: AppColor.greyIt,
                                              fontSize: 13.sp,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(height: 10.w),
                                          TextView(
                                            text:
                                                '${getCurrency()}${oCcy.format(double.parse('${i.totalSum}'))}',
                                            textStyle: TextStyle(
                                              color: AppColor.darkindgrey,
                                              fontSize: 14.20.sp,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  )
                else if (model.tab == 'In progress')
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          if (model.orderItemListInProgress.isNotEmpty)
                            ...model.orderItemListInProgress.map(
                              (i) => ProductStatusProcess(item: i),
                            ),
                        ],
                      ),
                    ),
                  )
                else if (model.tab == 'Failed')
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          if (model.orderItemListCancelled.isNotEmpty)
                            ...model.orderItemListCancelled.map((i) {
                              return ProductStatusFailed(item: i);
                            }),
                        ],
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...model.orderItemListCompleted.map(
                            (i) => ProductStatus(item: i),
                          ),
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
}
