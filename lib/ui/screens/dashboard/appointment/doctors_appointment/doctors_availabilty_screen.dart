import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import '../../../../../core/connect_end/model/doctor_availability_entity_model/availability.dart';
import '../../../../../core/connect_end/model/doctor_availability_entity_model/doctor_availability_entity_model.dart';
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
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          model.getDoctorsDetail(context);
        });
      },
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
                if (model.availabilities.isNotEmpty)
                  Column(
                    children: [
                      ...model.availabilities.map(
                        (o) => Container(
                          width: double.infinity,

                          padding: EdgeInsets.symmetric(
                            vertical: 14.w,
                            horizontal: 18.w,
                          ),
                          margin: EdgeInsets.only(bottom: 12.w),
                          decoration: BoxDecoration(
                            color: AppColor.finegrey2,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: const Color.fromARGB(255, 188, 203, 196),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextView(
                                    text: o.dayOfWeek ?? '',
                                    textStyle: GoogleFonts.gabarito(
                                      color: AppColor.darkindgrey,
                                      fontSize: 15.20.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 4.2.h),
                                  TextView(
                                    text:
                                        '${model.convertTo12Hour(o.startTime!)} - ${model.convertTo12Hour(o.endTime!)}',
                                    textStyle: GoogleFonts.gabarito(
                                      color: AppColor.darkindgrey,
                                      fontSize: 12.0.sp,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                onPressed: () {
                                  model.availabilities.remove(o);
                                  model.notifyListeners();
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: AppColor.red,
                                  size: 25.40.sp,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                SizedBox(height: 30.h),
                GestureDetector(
                  onTap:
                      () => model.openCalendarDialog(
                        context,
                        add: () {
                          model.availabilities.add(
                            Availability(
                              dayOfWeek: model.availabilityDate,
                              startTime:
                                  '${model.formatTimeOfDay24(model.timeStart)['24Hour']}',
                              endTime:
                                  '${model.formatTimeOfDay24(model.timeEnd)['24Hour']}',
                            ),
                          );
                          model.notifyListeners();
                          Navigator.pop(context);
                        },
                      ),
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
                SizedBox(height: 30.h),
                model.availabilities.isNotEmpty
                    ? GestureDetector(
                      onTap: () {
                        model.setDoctorsAvailabilty(
                          context,
                          id:
                              model.getDocDetailResponseModel?.original?.id
                                  .toString(),
                          availability: DoctorAvailabilityEntityModel(
                            availabilities: model.availabilities,
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 10.w,
                          horizontal: 20.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.primary1,
                        ),
                        child: TextView(
                          text: 'Set Availabilty ',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.white,
                            fontSize: 16.20.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    )
                    : SizedBox.shrink(),
              ],
            ),
          ),
        );
      },
    );
  }
}
