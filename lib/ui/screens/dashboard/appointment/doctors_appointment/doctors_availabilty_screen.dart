import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import '../../../../../core/connect_end/view_model/doc_view_model.dart';
import '../../../../../core/core_folder/app/app.locator.dart';
import '../../../../app_assets/app_color.dart';
import '../../../../widget/text_widget.dart';

class DoctorAvailabilityScreen extends StatelessWidget {
  const DoctorAvailabilityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DocViewModel>.reactive(
      viewModelBuilder: () => locator<DocViewModel>(),
      onViewModelReady: (model) {},
      disposeViewModel: false,
      builder: (_, DocViewModel model, __) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 22.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                TextView(
                  text: 'Set Availabilty',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.primary1,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 30.h),
                GestureDetector(
                  onTap: () => model.openCalendarDialog(context),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 10.w,
                      horizontal: 20.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.primary1,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_circle_outline,
                          color: AppColor.white,
                          size: 22.sp,
                        ),
                        SizedBox(width: 20.w),
                        TextView(
                          text: 'Set Availabilty Time',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.white,
                            fontSize: 16.20.sp,
                            fontWeight: FontWeight.w400,
                          ),
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
