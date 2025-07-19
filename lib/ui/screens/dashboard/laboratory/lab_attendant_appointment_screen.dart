// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:doc_lab_pharm/core/connect_end/view_model/med_lab_view_model.dart';
import 'package:doc_lab_pharm/ui/app_assets/app_color.dart';
import 'package:doc_lab_pharm/ui/app_assets/app_image.dart';
import 'package:doc_lab_pharm/ui/app_assets/constant.dart';
import 'package:stacked/stacked.dart';
import '../../../../../core/core_folder/app/app.locator.dart';
import '../../../../core/connect_end/model/lab_tech_recent_appointment_model/lab_tech_recent_appointment_model.dart';
import '../../../widget/text_form_widget.dart';
import '../../../widget/text_widget.dart';

class LabAttendantAppointmentScreen extends StatefulWidget {
  const LabAttendantAppointmentScreen({super.key});

  @override
  State<LabAttendantAppointmentScreen> createState() =>
      _LabAttendantAppointmentScreenState();
}

class _LabAttendantAppointmentScreenState
    extends State<LabAttendantAppointmentScreen> {
  String tab = 'Upcoming';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LabTechViewModel>.reactive(
      viewModelBuilder: () => locator<LabTechViewModel>(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          model.getMostRecentAppointmentList();
        });
      },
      disposeViewModel: false,
      builder: (_, LabTechViewModel model, __) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Align(
                  alignment: Alignment.center,
                  child: TextView(
                    text: 'Appointments',
                    textStyle: GoogleFonts.dmSans(
                      color: AppColor.black,
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                TextFormWidget(
                  label: 'Search for appointments by name',
                  border: 10,
                  isFilled: true,
                  fillColor: AppColor.transparent,
                  prefixWidget: Padding(
                    padding: EdgeInsets.all(14.w),
                    child: SvgPicture.asset(AppImage.search),
                  ),
                  onChange: (p0) {
                    model.query = p0;
                    model.notifyListeners();
                  },
                ),
                SizedBox(height: 20.h),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.primary1.withOpacity(.68),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => setState(() => tab = 'Upcoming'),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 11.w,
                            horizontal: 20.w,
                          ),
                          decoration: BoxDecoration(
                            color:
                                tab == 'Upcoming'
                                    ? AppColor.primary1
                                    : AppColor.transparent,

                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextView(
                            text: 'Upcoming',
                            textStyle: GoogleFonts.dmSans(
                              color:
                                  tab == 'Upcoming'
                                      ? AppColor.white
                                      : AppColor.darkindgrey,
                              fontSize: 13.0.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => tab = 'Completed'),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 11.w,
                            horizontal: 20.w,
                          ),
                          decoration: BoxDecoration(
                            color:
                                tab == 'Completed'
                                    ? AppColor.primary1
                                    : AppColor.transparent,

                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextView(
                            text: 'Completed',
                            textStyle: GoogleFonts.dmSans(
                              color:
                                  tab == 'Completed'
                                      ? AppColor.white
                                      : AppColor.darkindgrey,
                              fontSize: 13.0.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => setState(() => tab = 'Cancelled'),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 11.w,
                            horizontal: 20.w,
                          ),
                          decoration: BoxDecoration(
                            color:
                                tab == 'Cancelled'
                                    ? AppColor.primary1
                                    : AppColor.transparent,

                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextView(
                            text: 'Cancelled',
                            textStyle: GoogleFonts.dmSans(
                              color:
                                  tab == 'Cancelled'
                                      ? AppColor.white
                                      : AppColor.darkindgrey,
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
                if (model.labTechMostRecentAppointmentModel != null &&
                    model
                        .labTechMostRecentAppointmentModel!
                        .labTechRecentAppointmentModelList!
                        .isNotEmpty)
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        await model.getMostRecentAppointmentList();
                      },
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            if (tab == 'Upcoming')
                              if (model.query != '')
                                ...model
                                    .labTechMostRecentAppointmentModel!
                                    .labTechRecentAppointmentModelList!
                                    .where(
                                      (w) =>
                                          w.user!.firstName!
                                              .toLowerCase()
                                              .contains(model.query) ||
                                          w.user!.lastName!
                                              .toLowerCase()
                                              .contains(
                                                model.query.toLowerCase(),
                                              ),
                                    )
                                    .map(
                                      (o) => appointMentCard(
                                        appointmentStatus: 'Upcoming',
                                        appointment: o,
                                        lab: model,
                                      ),
                                    )
                              else
                                ...model.getListOfScheduledAppointmentModelList
                                    .map(
                                      (o) => appointMentCard(
                                        appointmentStatus: 'Upcoming',
                                        appointment: o,
                                        lab: model,
                                      ),
                                    )
                            else if (tab == 'Completed')
                              if (model.query != '')
                                ...model.getListOfCompletedAppointmentModelList
                                    .where(
                                      (w) =>
                                          w.user!.firstName!
                                              .toLowerCase()
                                              .contains(model.query) ||
                                          w.user!.lastName!
                                              .toLowerCase()
                                              .contains(
                                                model.query.toLowerCase(),
                                              ),
                                    )
                                    .map(
                                      (o) => appointMentCard(
                                        appointmentStatus: 'Completed',
                                        appointment: o,
                                      ),
                                    )
                              else
                                ...model.getListOfCompletedAppointmentModelList
                                    .map(
                                      (o) => appointMentCard(
                                        appointmentStatus: 'Completed',
                                        appointment: o,
                                      ),
                                    )
                            else if (tab == 'Cancelled')
                              if (model.query != '')
                                ...model.getListOfCancelledAppointmentModelList
                                    .where(
                                      (w) =>
                                          w.user!.firstName!
                                              .toLowerCase()
                                              .contains(model.query) ||
                                          w.user!.lastName!
                                              .toLowerCase()
                                              .contains(
                                                model.query.toLowerCase(),
                                              ),
                                    )
                                    .map(
                                      (o) => appointMentCard(
                                        appointmentStatus: 'Cancelled',
                                        appointment: o,
                                      ),
                                    )
                              else
                                ...model.getListOfCancelledAppointmentModelList
                                    .map(
                                      (o) => appointMentCard(
                                        appointmentStatus: 'Cancelled',
                                        appointment: o,
                                      ),
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

  Color getAppColor(String app) {
    if (app == 'Upcoming') {
      return AppColor.grey;
    } else if (app == 'Cancelled') {
      return AppColor.red;
    }
    return AppColor.darkindgrey;
  }

  appointMentCard({
    String? appointmentStatus,
    LabTechRecentAppointmentModel? appointment,
    LabTechViewModel? lab,
  }) => GestureDetector(
    // onTap:
    //     () => navigate.navigateTo(
    //       Routes.doctorAppointmentDetailSceen,
    //       arguments: DoctorAppointmentDetailSceenArguments(
    //         appointment: appointment,
    //       ),
    //     ),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.w),
      margin: EdgeInsets.only(bottom: 20.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color.fromARGB(218, 208, 208, 208)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: TextView(
                      text:
                          '${appointment?.user?.firstName?.capitalize() ?? ''} ${appointment?.user?.lastName?.capitalize() ?? ''}',
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      textStyle: GoogleFonts.gabarito(
                        color: AppColor.darkindgrey,
                        fontSize: 18.0.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  TextView(
                    text: appointment?.diagnosis?.name ?? '',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.darkindgrey,
                      fontSize: 14.0.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  appointment?.user?.profileImage != null
                      ? ClipOval(
                        child: SizedBox.fromSize(
                          size: Size.fromRadius(24),
                          child: Image.network(
                            appointment!.user!.profileImage!.contains(
                                  'https://res.cloudinary.com',
                                )
                                ? '${appointment.user?.profileImage}'
                                : 'https://res.cloudinary.com/dnv6yelbr/image/upload/v1747827538/${appointment.user?.profileImage}',
                            fit: BoxFit.cover,
                            errorBuilder:
                                (context, error, stackTrace) =>
                                    shimmerViewPharm(),
                          ),
                        ),
                      )
                      : Container(
                        padding: EdgeInsets.all(20.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColor.oneKindgrey,
                        ),
                      ),
                ],
              ),
            ],
          ),
          SizedBox(height: 40.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    AppImage.calendar,
                    color: AppColor.darkindgrey,
                  ),
                  SizedBox(width: 8.w),
                  TextView(
                    text: DateFormat('dd/MM/yyyy').format(
                      DateTime.parse(appointment!.date.toString()).toLocal(),
                    ),
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.darkindgrey,
                      fontSize: 14.0.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SvgPicture.asset(AppImage.time, color: AppColor.darkindgrey),
                  SizedBox(width: 8.w),
                  TextView(
                    text: appointment.time ?? '',

                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.darkindgrey,
                      fontSize: 14.0.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 2.w),
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      color: getAppColor(appointmentStatus!),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 8.w),
                  TextView(
                    text: appointmentStatus,
                    textStyle: GoogleFonts.gabarito(
                      color: getAppColor(appointmentStatus),
                      fontSize: 14.0.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 12.0.h),
          appointmentStatus == 'Upcoming'
              ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap:
                          () => lab?.cancelAppointmentDialogBox(
                            context,
                            id: appointment.orderId.toString(),
                          ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 8.w,
                          horizontal: 46.0.w,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(
                            235,
                            146,
                            25,
                            16,
                          ).withOpacity(.8),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextView(
                          text: 'Cancel',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.white,
                            fontSize: 14.20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: GestureDetector(
                      onTap:
                          () => lab?.completeAppointmentDialogBox(
                            context,
                            id: appointment.orderId.toString(),
                          ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 8.w,
                          horizontal: 36.w,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.primary1,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextView(
                          text: 'Complete',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.white,
                            fontSize: 14.20.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
              : SizedBox.shrink(),
        ],
      ),
    ),
  );

  String convertTo12Hour(String time24) {
    // Parse "17:00" into DateTime
    final DateFormat inputFormat = DateFormat.Hm(); // "HH:mm"
    final DateTime dateTime = inputFormat.parse(time24);

    // Format to 12-hour time with AM/PM
    final DateFormat outputFormat = DateFormat.jm(); // "h:mm a"
    return outputFormat.format(dateTime); // e.g., "5:00 PM"
  }
}
