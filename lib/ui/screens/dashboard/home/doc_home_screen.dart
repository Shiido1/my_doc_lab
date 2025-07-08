import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/screens/dashboard/notification/notification_screen.dart';
import 'package:my_doc_lab/ui/screens/dashboard/patient/patient_sceen.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/view_model/doc_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../app_assets/app_image.dart';
import '../../../app_assets/constant.dart';
import '../../../widget/text_widget.dart';
import '../appointment/doctors_appointment/doctors_appointment_screen.dart';
import '../chat/doc_message_list_screen.dart';
import '../settings/wallet/doc_wallet_screen.dart';

class DocHomeScreen extends StatelessWidget {
  const DocHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DocViewModel>.reactive(
      viewModelBuilder: () => locator<DocViewModel>(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          model.getDoctorsDetail(context);
          model.getChatIndex();
          model.getDoctorsStatistic();
          model.getRecentAppointment();
        });
      },
      disposeViewModel: false,
      builder: (_, DocViewModel model, __) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 17.2.w, vertical: 50.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.w),
                Row(
                  children: [
                    model.getDocDetailResponseModel?.original?.profileImage !=
                            null
                        ? ClipOval(
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(24),
                            child: Image.network(
                              model
                                      .getDocDetailResponseModel!
                                      .original!
                                      .profileImage!
                                      .contains('https')
                                  ? '${model.getDocDetailResponseModel?.original?.profileImage}'
                                  : 'https://res.cloudinary.com/dnv6yelbr/image/upload/v1747827538/${model.getDocDetailResponseModel?.original?.profileImage}',
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
                    SizedBox(width: 20.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text: 'Welcome back',
                          textStyle: GoogleFonts.dmSans(
                            color: AppColor.black,
                            fontSize: 19.20.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextView(
                          text:
                              'Dr. ${model.getDocDetailResponseModel?.original?.firstName?.capitalize() ?? ''}',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.greyIt,
                            fontSize: 14.20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap:
                          () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => NotificationScreen(),
                            ),
                          ),
                      child: SvgPicture.asset(
                        AppImage.notification,
                        width: 24.w,
                        height: 24.w,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.w),

                Row(
                  children: [
                    dashContainer(
                      flex: 3,
                      image: AppImage.patient,
                      contColor: AppColor.primary1,
                      firstText: 'Patients',
                      secondText: 'Total Patients:',
                      thirdText:
                          '${model.getDoctorStatisticModel?.totalPatients ?? 0}',
                      onTap:
                          () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => PatientSceen(),
                            ),
                          ),
                    ),
                    SizedBox(width: 10.w),
                    dashContainer(
                      flex: 3,
                      image: AppImage.calendar,
                      contColor: AppColor.darkindgrey,
                      firstText: 'Calendar',
                      secondText: 'Today:',
                      thirdText:
                          '${model.getDoctorStatisticModel?.appointmentToday ?? 0}',
                      onTap:
                          () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DoctorsAppointmentScreen(),
                            ),
                          ),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Row(
                  children: [
                    dashContainer(
                      flex: 3,
                      image: AppImage.docMsg,
                      contColor: AppColor.primary1,
                      firstText: 'Message',
                      secondText: 'Unread:',
                      thirdText:
                          '${model.getDoctorStatisticModel?.unread ?? 0}',
                      onTap:
                          () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DoctorMessageListScreen(),
                            ),
                          ),
                    ),
                    SizedBox(width: 10.w),
                    dashContainer(
                      flex: 4,
                      image: AppImage.task,
                      contColor: AppColor.darkindgrey,
                      firstText: 'Balance',
                      secondText: 'Current:',
                      thirdText:
                          '${getCurrency()}${oCcy.format(model.getDoctorStatisticModel?.balance ?? 0.0)}',
                      onTap:
                          () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DoctorWalletScreen(),
                            ),
                          ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      text: 'Completded Appointments',
                      textStyle: GoogleFonts.dmSans(
                        color: AppColor.darkindgrey,
                        fontSize: 16.20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap:
                          () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DoctorsAppointmentScreen(),
                            ),
                          ),
                      child: TextView(
                        text: 'View all',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.primary,
                          fontSize: 14.0.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                if (model.recentAppointmentResponseModelList != null &&
                    model
                        .recentAppointmentResponseModelList!
                        .recentAppointmentResponseModelList!
                        .isEmpty)
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 14.w,
                      horizontal: 18.w,
                    ),
                    decoration: BoxDecoration(
                      color: AppColor.primary1.withOpacity(.6),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColor.white),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text: 'No appointments for today',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.white,
                            fontSize: 13.20.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(height: 12.h),
                        Row(
                          children: [
                            Icon(
                              Icons.add_circle_outline_rounded,
                              color: AppColor.white,
                            ),
                            SizedBox(width: 10.w),
                            TextView(
                              text: 'Schedule appointment',
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.white,
                                fontSize: 12.0.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                if (model.recentAppointmentResponseModelList != null &&
                    model
                        .recentAppointmentResponseModelList!
                        .recentAppointmentResponseModelList!
                        .isNotEmpty)
                  ...model
                      .recentAppointmentResponseModelList!
                      .recentAppointmentResponseModelList!
                      .map(
                        (recent) => Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            vertical: 14.w,
                            horizontal: 18.w,
                          ),
                          margin: EdgeInsets.only(bottom: 12.w),
                          decoration: BoxDecoration(
                            color: AppColor.finegrey2,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColor.white),
                          ),
                          child: Row(
                            children: [
                              recent.user?.profileImage != null
                                  ? ClipOval(
                                    child: SizedBox.fromSize(
                                      size: const Size.fromRadius(20),
                                      child: Image.network(
                                        recent.user!.profileImage!.contains(
                                              'https',
                                            )
                                            ? '${recent.user?.profileImage}'
                                            : 'https://res.cloudinary.com/dnv6yelbr/image/upload/v1747827538/${recent.user?.profileImage}',
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
                              SizedBox(width: 14.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextView(
                                    text:
                                        '${recent.user?.firstName?.capitalize() ?? ''} ${recent.user?.lastName?.capitalize() ?? ''}',
                                    textStyle: GoogleFonts.gabarito(
                                      color: AppColor.darkindgrey,
                                      fontSize: 15.20.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 4.2.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      TextView(
                                        text:
                                            '${DateFormat('hh:mm a').format(DateTime.parse(recent.updatedAt.toString()).toLocal())} - ',
                                        textStyle: GoogleFonts.gabarito(
                                          color: AppColor.darkindgrey,
                                          fontSize: 12.0.sp,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                      TextView(
                                        text: 'Follow-Up',
                                        textStyle: GoogleFonts.gabarito(
                                          color: AppColor.darkindgrey,
                                          fontSize: 12.0.sp,
                                          fontWeight: FontWeight.w300,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Spacer(),
                              TextView(
                                text: '${recent.status?.capitalize()}',
                                textStyle: GoogleFonts.gabarito(
                                  color: AppColor.darkindgrey,
                                  fontSize: 13.10.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        );
      },
    );
  }

  dashContainer({
    flex,
    contColor,
    image,
    firstText,
    secondText,
    thirdText,
    Function()? onTap,
  }) => Expanded(
    flex: flex,
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 12.w),
        decoration: BoxDecoration(
          color: contColor,
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(color: AppColor.white),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10.h),
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.white,
              ),
              child: SvgPicture.asset(
                image,
                color: contColor,
                height: 20.h,
                width: 20.w,
              ),
            ),
            SizedBox(height: 10.h),
            TextView(
              text: firstText,
              textStyle: GoogleFonts.dmSans(
                color: AppColor.white,
                fontSize: 20.sp,
                fontWeight: FontWeight.w900,
              ),
            ),
            SizedBox(height: 10.h),
            TextView(
              text: secondText,
              textAlign: TextAlign.start,
              textStyle: GoogleFonts.gabarito(
                color: AppColor.white,
                fontSize: 12.6.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              width: 200.w,
              child: TextView(
                text: thirdText,
                textOverflow: TextOverflow.ellipsis,
                maxLines: 1,
                textStyle: TextStyle(
                  color: AppColor.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    ),
  );
}
