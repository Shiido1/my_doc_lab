import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/screens/dashboard/pharmacy/product_status_widget/product_status_widget.dart';
import 'package:my_doc_lab/ui/screens/dashboard/pharmacy/product_status_widget/product_status_widget_all.dart';
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
                    text: model.tab == 'All' ? 'Orders' : 'Order Items',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 20.w),
                model.tab == 'All'
                    ? TextFormWidget(
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
                      onChange: (p0) {
                        model.pharmMedQueryOrder = p0;
                        model.notifyListeners();
                      },
                    )
                    : SizedBox.shrink(),
                SizedBox(height: 30.h),
                model.onTapStatusContainer(),
                SizedBox(height: 20.h),

                if (model.tab == 'All')
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        await model.getPharmOrderReload(); // Trigger refresh
                      },
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            if (model.getPharmOrderModel != null &&
                                model
                                    .getPharmOrderModel!
                                    .original!
                                    .orders!
                                    .isNotEmpty)
                              if (model.pharmMedQueryOrder != '')
                                ...model.getPharmOrderModel!.original!.orders!
                                    .where(
                                      (o) =>
                                          o.user!.firstName!
                                              .toLowerCase()
                                              .contains(
                                                model.pharmMedQueryOrder
                                                    .toLowerCase(),
                                              ) ||
                                          o.user!.lastName!
                                              .toLowerCase()
                                              .contains(
                                                model.pharmMedQueryOrder
                                                    .toLowerCase(),
                                              ),
                                    )
                                    .map(
                                      (order) => ProductStatusAll(order: order),
                                    )
                              else
                                ...model.getPharmOrderModel!.original!.orders!
                                    .map(
                                      (order) => ProductStatusAll(order: order),
                                    ),
                          ],
                        ),
                      ),
                    ),
                  )
                else if (model.tab == 'In progress')
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        await model.getPharmOrderReload(); // Trigger refresh
                      },
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            if (model.orderItemListInProgress.isNotEmpty)
                              ...model.orderItemListInProgress.map(
                                (i) => ProductStatusProcess(item: i),
                              ),
                          ],
                        ),
                      ),
                    ),
                  )
                else if (model.tab == 'Failed')
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        await model.getPharmOrderReload(); // Trigger refresh
                      },
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            if (model.orderItemListCancelled.isNotEmpty)
                              ...model.orderItemListCancelled.map((i) {
                                return ProductStatusFailed(item: i);
                              }),
                          ],
                        ),
                      ),
                    ),
                  )
                else
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        await model.getPharmOrderReload(); // Trigger refresh
                      },
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            ...model.orderItemListCompleted.map(
                              (i) => ProductStatus(item: i),
                            ),
                          ],
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
}
