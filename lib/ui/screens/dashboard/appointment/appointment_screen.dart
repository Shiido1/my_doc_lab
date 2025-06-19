import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_doc_lab/core/connect_end/model/get_users_appointment_model/get_users_appointment_model.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_image.dart';
import 'package:my_doc_lab/ui/app_assets/constant.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../widget/text_form_widget.dart';
import '../../../widget/text_widget.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  String tab = 'Upcoming';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => locator<AuthViewModel>(),
      onViewModelReady: (model) {},
      disposeViewModel: false,
      fireOnViewModelReadyOnce: true,
      builder: (_, AuthViewModel model, __) {
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
                  label: 'Search for appointments by name or date sortttt',
                  // hint: 'Email Address',
                  border: 10,
                  isFilled: true,
                  fillColor: AppColor.transparent,
                  // controller: fullnameTextController,
                  prefixWidget: Padding(
                    padding: EdgeInsets.all(14.w),
                    child: SvgPicture.asset(AppImage.search),
                  ),
                  // validator: AppValidator.validateEmail(),
                ),
                SizedBox(height: 20.h),
                Container(
                  decoration: BoxDecoration(
                    // ignore: deprecated_member_use
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
                            // ignore: deprecated_member_use
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
                            // ignore: deprecated_member_use
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
                        onTap: () => setState(() => tab = 'Canceled'),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 11.w,
                            horizontal: 20.w,
                          ),
                          decoration: BoxDecoration(
                            // ignore: deprecated_member_use
                            color:
                                tab == 'Canceled'
                                    ? AppColor.primary1
                                    : AppColor.transparent,

                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextView(
                            text: 'Canceled',
                            textStyle: GoogleFonts.dmSans(
                              color:
                                  tab == 'Canceled'
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
                Expanded(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await model.getUsersAppointment(context);
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          if (tab == 'Upcoming')
                            if (model.getUsersAppointmentModelList != null &&
                                model
                                    .getUsersAppointmentModelList!
                                    .getUsersAppointmentModelList!
                                    .isNotEmpty)
                              ...model
                                  .getUsersAppointmentModelList!
                                  .getUsersAppointmentModelList!
                                  .where(
                                    (w) =>
                                        w.status?.toLowerCase() == 'scheduled',
                                  )
                                  .map(
                                    (o) => appointMentCard(
                                      getUsersAppointmentModel: o,
                                      appointmentStatus: 'Upcoming',
                                    ),
                                  )
                            else if (tab == 'Completed')
                              if (model.getUsersAppointmentModelList != null &&
                                  model
                                      .getUsersAppointmentModelList!
                                      .getUsersAppointmentModelList!
                                      .isNotEmpty)
                                ...model
                                    .getUsersAppointmentModelList!
                                    .getUsersAppointmentModelList!
                                    .where(
                                      (w) =>
                                          w.status?.toLowerCase() ==
                                          'scheduled',
                                    )
                                    .map(
                                      (o) => appointMentCard(
                                        getUsersAppointmentModel: o,
                                        appointmentStatus: 'Completed',
                                      ),
                                    )
                              else if (model.getUsersAppointmentModelList !=
                                      null &&
                                  model
                                      .getUsersAppointmentModelList!
                                      .getUsersAppointmentModelList!
                                      .isNotEmpty)
                                ...model
                                    .getUsersAppointmentModelList!
                                    .getUsersAppointmentModelList!
                                    .where(
                                      (w) =>
                                          w.status?.toLowerCase() ==
                                          'scheduled',
                                    )
                                    .map(
                                      (o) => appointMentCard(
                                        getUsersAppointmentModel: o,
                                        appointmentStatus: 'Canceled',
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
    GetUsersAppointmentModel? getUsersAppointmentModel,
  }) => Container(
    padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.w),
    margin: EdgeInsets.only(bottom: 20.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: const Color.fromARGB(218, 208, 208, 208)),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextView(
                  text:
                      'Dr ${getUsersAppointmentModel?.doctor?.firstName?.capitalize()} ${getUsersAppointmentModel?.doctor?.lastName?.capitalize()}',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.darkindgrey,
                    fontSize: 18.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextView(
                  text: 'Doctor',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.darkindgrey,
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            getUsersAppointmentModel?.doctor?.profileImage != null ||
                    getUsersAppointmentModel!.doctor!.profileImage!.contains(
                      'https',
                    )
                ? ClipOval(
                  child: SizedBox.fromSize(
                    size: const Size.fromRadius(24),
                    child: Image.network(
                      getUsersAppointmentModel!.doctor!.profileImage!.contains(
                            'https',
                          )
                          ? '${getUsersAppointmentModel.doctor!.profileImage}'
                          : 'https://res.cloudinary.com/dnv6yelbr/image/upload/v1747827538/${getUsersAppointmentModel.doctor?.profileImage}',
                      fit: BoxFit.cover,
                      errorBuilder:
                          (context, error, stackTrace) => shimmerViewPharm(),
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
                      getUsersAppointmentModel.slot!.availableDate.toString(),
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
                  text: '${getUsersAppointmentModel.slot!.availableTime}',
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
      ],
    ),
  );
}
