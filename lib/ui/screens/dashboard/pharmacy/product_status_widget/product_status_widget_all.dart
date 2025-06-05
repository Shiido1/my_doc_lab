import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/constant.dart';
import 'package:stacked/stacked.dart';

import '../../../../../core/connect_end/model/get_pharm_order_model/get_pharm_order_model.dart';
import '../../../../../core/connect_end/view_model/pharm_view_model.dart';
import '../../../../app_assets/app_color.dart';
import '../../../../widget/text_widget.dart';
import '../../patient/patient_detail_sceen.dart';

// ignore: must_be_immutable
class ProductStatusAll extends StatelessWidget {
  ProductStatusAll({super.key, required this.order});
  Orders? order;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PharmViewModel>.reactive(
      viewModelBuilder: () => PharmViewModel(),
      onViewModelReady: (model) {},
      disposeViewModel: false,
      builder: (_, PharmViewModel model, __) {
        return GestureDetector(
          onTap:
              () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => PatientDetailSceen()),
              ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.w, horizontal: 8.w),
            margin: EdgeInsets.only(bottom: 14.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColor.oneKindgrey),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                order?.user?.profileImage != null
                    ? Padding(
                      padding: EdgeInsets.only(top: 8.w),
                      child: ClipOval(
                        child: SizedBox.fromSize(
                          size: const Size.fromRadius(30),
                          child: Image.network(
                            order!.user!.profileImage!.contains('https')
                                ? '${order?.user?.profileImage}'
                                : 'https://res.cloudinary.com/dnv6yelbr/image/upload/v1747827538/${order?.user?.profileImage}',
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) =>
                                    shimmerViewPharm(),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 220.w,
                      child: TextView(
                        text:
                            '${order?.user?.firstName?.capitalize()} ${order?.user?.lastName?.capitalize()}',
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
                      text: 'Order No: ${order?.orderTrx}',
                      textStyle: GoogleFonts.gabarito(
                        color: AppColor.greyIt,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 10.w),
                    TextView(
                      text:
                          '${getCurrency()}${oCcy.format(double.parse('${order?.totalSum}'))}',
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
        );
      },
    );
  }
}
