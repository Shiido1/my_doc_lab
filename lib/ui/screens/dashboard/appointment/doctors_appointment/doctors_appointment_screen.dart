// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_doc_lab/core/core_folder/app/app.router.dart';
import 'package:my_doc_lab/main.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_image.dart';
import 'package:my_doc_lab/ui/app_assets/constant.dart';
import 'package:stacked/stacked.dart';
import '../../../../../core/connect_end/model/get_list_of_doctors_appointment_model/get_list_of_doctors_appointment_model.dart';
import '../../../../../core/connect_end/model/update_status_reason_entity_model.dart';
import '../../../../../core/connect_end/view_model/doc_view_model.dart';
import '../../../../../core/core_folder/app/app.locator.dart';
import '../../../../widget/text_form_widget.dart';
import '../../../../widget/text_widget.dart';

class DoctorsAppointmentScreen extends StatefulWidget {
  const DoctorsAppointmentScreen({super.key});

  @override
  State<DoctorsAppointmentScreen> createState() =>
      _DoctorsAppointmentScreenState();
}

class _DoctorsAppointmentScreenState extends State<DoctorsAppointmentScreen> {
  String tab = 'Upcoming';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DocViewModel>.reactive(
      viewModelBuilder: () => locator<DocViewModel>(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          model.getDoctorsAppointment();
        });
      },
      disposeViewModel: false,
      builder: (_, DocViewModel model, __) {
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
                  label: 'Search for appointments by name or date sort',
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
                if (model.getListOfDoctorsAppointmentModelList != null &&
                    model
                        .getListOfDoctorsAppointmentModelList!
                        .getListOfDoctorsAppointments!
                        .isNotEmpty)
                  Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        await model.getDoctorsAppointmentReload();
                      },
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            if (tab == 'Upcoming')
                              if (model.query != '')
                                ...model.getListOfScheduledAppointmentModelList!
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
                                        doc: model,
                                      ),
                                    )
                              else
                                ...model.getListOfScheduledAppointmentModelList!
                                    .map(
                                      (o) => appointMentCard(
                                        appointmentStatus: 'Upcoming',
                                        appointment: o,
                                        doc: model,
                                      ),
                                    )
                            else if (tab == 'Completed')
                              if (model.query != '')
                                ...model.getListOfCompletedAppointmentModelList!
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
                                ...model.getListOfCompletedAppointmentModelList!
                                    .map(
                                      (o) => appointMentCard(
                                        appointmentStatus: 'Completed',
                                        appointment: o,
                                      ),
                                    )
                            else if (tab == 'Cancelled')
                              if (model.query != '')
                                ...model.getListOfCancelledAppointmentModelList!
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
                                ...model.getListOfCancelledAppointmentModelList!
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
    } else if (app == 'Canceled') {
      return AppColor.red;
    }
    return AppColor.darkindgrey;
  }

  appointMentCard({
    String? appointmentStatus,
    GetListOfDoctorsAppointmentModel? appointment,
    DocViewModel? doc,
  }) => GestureDetector(
    onTap:
        () => navigate.navigateTo(
          Routes.doctorAppointmentDetailSceen,
          arguments: DoctorAppointmentDetailSceenArguments(
            appointment: appointment,
          ),
        ),
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
                    text: appointment?.consultation?.name ?? '',
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
                          size: const Size.fromRadius(24),
                          child: Image.network(
                            appointment?.user?.profileImage!.contains('https')
                                ? '${appointment?.user?.profileImage}'
                                : 'https://res.cloudinary.com/dnv6yelbr/image/upload/v1747827538/${appointment?.user?.profileImage}',
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

                  SizedBox(width: 12.20.w),
                  appointmentStatus == 'Upcoming'
                      ? GestureDetector(
                        child: PopupMenuButton<String>(
                          onSelected: (String item) {},
                          itemBuilder: (BuildContext context) {
                            return [
                              PopupMenuItem<String>(
                                value: 'complete',
                                child: TextView(
                                  text: 'Complete',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.darkindgrey,
                                    fontSize: 15.40.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                onTap:
                                    () => doc!.doctorsAppointmentCompleteUpdate(
                                      context,
                                      id: appointment!.id.toString(),
                                      update: UpdateStatusReasonEntityModel(
                                        reason:
                                            'Appointment Completed Succesfully',
                                        status: 'completed',
                                      ),
                                    ),
                              ),
                            ];
                          },
                          child: SvgPicture.asset(AppImage.more_circle),
                        ),
                      )
                      : SizedBox.shrink(),
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
                      DateTime.parse(
                        appointment!.slot!.availableDate!.toString(),
                      ).toLocal(),
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
                    text: convertTo12Hour(
                      appointment.slot?.availableTime ?? '',
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
                          () => doc?.cancelAppointmentDialogBox(
                            context,
                            id: appointment.id.toString(),
                          ),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 8.w,
                          horizontal: 46.0.w,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.primary1.withOpacity(.7),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextView(
                          text: 'Cancel',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.darkindgrey,
                            fontSize: 13.20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: GestureDetector(
                      onTap:
                          () => doc?.rescheduleAppointmentDialogBox(
                            context,
                            id: appointment.id.toString(),
                            slotId: appointment.slot!.id.toString(),
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
                          text: 'Reschedule',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.white,
                            fontSize: 13.20.sp,
                            fontWeight: FontWeight.w500,
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
