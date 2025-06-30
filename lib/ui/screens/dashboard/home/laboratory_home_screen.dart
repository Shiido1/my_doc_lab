// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/constant.dart';
import 'package:my_doc_lab/ui/screens/dashboard/notification/notification_screen.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/view_model/med_lab_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../app_assets/app_image.dart';
import '../../../widget/text_form_widget.dart';
import '../../../widget/text_widget.dart';
import '../laboratory/lab_attendant_appointment_screen.dart';

class LaboratoryHomeScreen extends StatefulWidget {
  const LaboratoryHomeScreen({super.key});

  @override
  State<LaboratoryHomeScreen> createState() => _LaboratoryHomeScreenState();
}

class _LaboratoryHomeScreenState extends State<LaboratoryHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    return ViewModelBuilder<LabTechViewModel>.reactive(
      viewModelBuilder: () => locator<LabTechViewModel>(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await model.getLabTechDetail(context);
          await model.getLabTechStats();
          model.getRecentAppointmentList();
          model.getMostRecentAppointmentList();
        });
      },
      disposeViewModel: false,
      builder: (_, LabTechViewModel model, __) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: RefreshIndicator(
            onRefresh: () async {
              await model.getLabTechDetail(context);
              await model.getLabTechStats();
              model.getRecentAppointmentList();
              model.getMostRecentAppointmentList();
            },
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 50.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.w),
                  Row(
                    children: [
                      model
                                  .getLabTechDetailResponseModel
                                  ?.original
                                  ?.profileImage !=
                              null
                          ? ClipOval(
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(24),
                              child: Image.network(
                                model
                                        .getLabTechDetailResponseModel!
                                        .original!
                                        .profileImage!
                                        .contains('https')
                                    ? '${model.getLabTechDetailResponseModel?.original?.profileImage}'
                                    : 'https://res.cloudinary.com/dnv6yelbr/image/upload/v1747827538/${model.getLabTechDetailResponseModel?.original?.profileImage}',
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
                                'Dr. ${model.getLabTechDetailResponseModel?.original?.firstName?.capitalize() ?? ''}',
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
                  TextFormWidget(
                    label: 'Search for Appointments with name',
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
                    suffixWidget: Padding(
                      padding: EdgeInsets.all(14.w),
                      child: SvgPicture.asset(
                        AppImage.filter,
                        height: 20.h,
                        width: 20.w,
                      ),
                    ),
                    onChange: (p0) {
                      model.queryAppointment = p0;
                      model.notifyListeners();
                    },
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: pharmContainer(
                          context,
                          image: AppImage.thick_appoint,
                          text1: 'Appointments',
                          text2:
                              '${model.getLabTechStaResponseModel?.appointment ?? '0'}',
                          color: AppColor.primary1,
                        ),
                      ),
                      SizedBox(width: 12.0.w),

                      Expanded(
                        flex: 3,
                        child: pharmContainer(
                          context,
                          image: AppImage.consultancy,
                          text1: 'Patients',
                          text2:
                              '${model.getLabTechStaResponseModel?.patients ?? '0'}',
                          color: AppColor.darkindgrey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  pharmContainer(
                    context,
                    image: AppImage.carty,
                    text1: 'Total Diagnosis',
                    text2:
                        '${model.getLabTechStaResponseModel?.totalDiagnosis ?? '0'}',
                    color: AppColor.primary1,
                  ),
                  SizedBox(height: 20.h),
                  TextView(
                    text: 'Appointments',
                    textAlign: TextAlign.start,
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.darkindgrey,
                      fontSize: 16.30.sp,
                      letterSpacing: -1,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        if (model.labTechRecentAppointmentModel != null &&
                            model
                                .labTechRecentAppointmentModel!
                                .labTechRecentAppointmentModelList!
                                .isNotEmpty)
                          if (model.queryAppointment != '')
                            ...model
                                .labTechRecentAppointmentModel!
                                .labTechRecentAppointmentModelList!
                                .where(
                                  (w) =>
                                      w.user!.firstName!.toLowerCase().contains(
                                        model.queryAppointment.toLowerCase(),
                                      ) ||
                                      w.user!.lastName!.toLowerCase().contains(
                                        model.queryAppointment.toLowerCase(),
                                      ),
                                )
                                .map(
                                  (o) => Container(
                                    width: 240.w,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 8.w,
                                      horizontal: 10.w,
                                    ),
                                    margin: EdgeInsets.only(right: 10.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColor.primary1,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            o.user?.profileImage != null
                                                ? ClipOval(
                                                  child: SizedBox.fromSize(
                                                    size: const Size.fromRadius(
                                                      24,
                                                    ),
                                                    child: Image.network(
                                                      o.user!.profileImage!
                                                              .contains('https')
                                                          ? '${o.user?.profileImage}'
                                                          : 'https://res.cloudinary.com/dnv6yelbr/image/upload/v1747827538/${o.user?.profileImage}',
                                                      fit: BoxFit.cover,
                                                      errorBuilder:
                                                          (
                                                            context,
                                                            error,
                                                            stackTrace,
                                                          ) =>
                                                              shimmerViewPharm(),
                                                    ),
                                                  ),
                                                )
                                                : Container(
                                                  padding: EdgeInsets.all(
                                                    17.2.w,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: AppColor.white,
                                                  ),
                                                ),
                                            SizedBox(width: 10.w),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 160.w,
                                                  child: TextView(
                                                    text:
                                                        '${o.user?.firstName?.capitalize() ?? ''} ${o.user?.lastName?.capitalize() ?? ''}',
                                                    textAlign: TextAlign.start,
                                                    maxLines: 1,
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    textStyle:
                                                        GoogleFonts.gabarito(
                                                          color: AppColor.white,
                                                          fontSize: 16.30.sp,
                                                          letterSpacing: -1,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                                TextView(
                                                  text: o.time ?? '',
                                                  textAlign: TextAlign.start,
                                                  textStyle:
                                                      GoogleFonts.gabarito(
                                                        color: AppColor.white,
                                                        fontSize: 12.30.sp,
                                                        letterSpacing: -1,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20.h),
                                        Padding(
                                          padding: EdgeInsets.only(left: 40.w),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextView(
                                                text:
                                                    o.diagnosis?.name
                                                        ?.capitalize() ??
                                                    '',
                                                textAlign: TextAlign.start,
                                                textStyle: GoogleFonts.gabarito(
                                                  color: AppColor.white,
                                                  fontSize: 16.30.sp,
                                                  letterSpacing: -1,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          vertical: 1.4.w,
                                                          horizontal: 8.w,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          AppColor.darkindgrey,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            22,
                                                          ),
                                                    ),
                                                    child: TextView(
                                                      text: 'Sample',
                                                      textAlign:
                                                          TextAlign.center,
                                                      textStyle:
                                                          GoogleFonts.gabarito(
                                                            color:
                                                                AppColor.white,
                                                            fontSize: 11.30.sp,
                                                            letterSpacing: 0,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          vertical: 1.4.w,
                                                          horizontal: 8.w,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color: model
                                                          .statusAppColor(
                                                            o.status,
                                                          )
                                                          .withOpacity(.2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            22,
                                                          ),
                                                    ),
                                                    child: TextView(
                                                      text: model.statusValue(
                                                        o.status,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      textStyle:
                                                          GoogleFonts.gabarito(
                                                            color: model
                                                                .statusAppColor(
                                                                  o.status,
                                                                ),
                                                            fontSize: 11.30.sp,
                                                            letterSpacing: 0,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),

                                        SizedBox(height: 10.h),
                                      ],
                                    ),
                                  ),
                                )
                          else
                            ...model
                                .labTechRecentAppointmentModel!
                                .labTechRecentAppointmentModelList!
                                .map(
                                  (o) => Container(
                                    width: 240.w,
                                    padding: EdgeInsets.symmetric(
                                      vertical: 8.w,
                                      horizontal: 10.w,
                                    ),
                                    margin: EdgeInsets.only(right: 10.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColor.primary1,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            o.user?.profileImage != null
                                                ? ClipOval(
                                                  child: SizedBox.fromSize(
                                                    size: const Size.fromRadius(
                                                      24,
                                                    ),
                                                    child: Image.network(
                                                      o.user!.profileImage!
                                                              .contains('https')
                                                          ? '${o.user?.profileImage}'
                                                          : 'https://res.cloudinary.com/dnv6yelbr/image/upload/v1747827538/${o.user?.profileImage}',
                                                      fit: BoxFit.cover,
                                                      errorBuilder:
                                                          (
                                                            context,
                                                            error,
                                                            stackTrace,
                                                          ) =>
                                                              shimmerViewPharm(),
                                                    ),
                                                  ),
                                                )
                                                : Container(
                                                  padding: EdgeInsets.all(
                                                    17.2.w,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: AppColor.white,
                                                  ),
                                                ),
                                            SizedBox(width: 10.w),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 160.w,
                                                  child: TextView(
                                                    text:
                                                        '${o.user?.firstName?.capitalize() ?? ''} ${o.user?.lastName?.capitalize() ?? ''}',
                                                    textAlign: TextAlign.start,
                                                    maxLines: 1,
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    textStyle:
                                                        GoogleFonts.gabarito(
                                                          color: AppColor.white,
                                                          fontSize: 16.30.sp,
                                                          letterSpacing: -1,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                  ),
                                                ),
                                                TextView(
                                                  text: o.time ?? '',
                                                  textAlign: TextAlign.start,
                                                  textStyle:
                                                      GoogleFonts.gabarito(
                                                        color: AppColor.white,
                                                        fontSize: 12.30.sp,
                                                        letterSpacing: -1,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20.h),
                                        Padding(
                                          padding: EdgeInsets.only(left: 40.w),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextView(
                                                text:
                                                    o.diagnosis?.name
                                                        ?.capitalize() ??
                                                    '',
                                                textAlign: TextAlign.start,
                                                textStyle: GoogleFonts.gabarito(
                                                  color: AppColor.white,
                                                  fontSize: 16.30.sp,
                                                  letterSpacing: -1,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          vertical: 1.4.w,
                                                          horizontal: 8.w,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color:
                                                          AppColor.darkindgrey,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            22,
                                                          ),
                                                    ),
                                                    child: TextView(
                                                      text: 'Sample',
                                                      textAlign:
                                                          TextAlign.center,
                                                      textStyle:
                                                          GoogleFonts.gabarito(
                                                            color:
                                                                AppColor.white,
                                                            fontSize: 11.30.sp,
                                                            letterSpacing: 0,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                    ),
                                                  ),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          vertical: 1.4.w,
                                                          horizontal: 8.w,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color: model
                                                          .statusAppColor(
                                                            o.status,
                                                          )
                                                          .withOpacity(.2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            22,
                                                          ),
                                                    ),
                                                    child: TextView(
                                                      text: model.statusValue(
                                                        o.status,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,
                                                      textStyle:
                                                          GoogleFonts.gabarito(
                                                            color: model
                                                                .statusAppColor(
                                                                  o.status,
                                                                ),
                                                            fontSize: 11.30.sp,
                                                            letterSpacing: 0,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),

                                        SizedBox(height: 10.h),
                                      ],
                                    ),
                                  ),
                                ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: 'Appointment Request',
                        textAlign: TextAlign.start,
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.darkindgrey,
                          fontSize: 16.30.sp,
                          letterSpacing: -1,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder:
                                  (context) => LabAttendantAppointmentScreen(),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            TextView(
                              text: 'View all',
                              textAlign: TextAlign.start,
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.darkindgrey,
                                fontSize: 12.30.sp,
                                letterSpacing: -1,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Icon(
                              Icons.keyboard_arrow_right_rounded,
                              size: 16.sp,
                              color: AppColor.darkindgrey,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),

                  Container(
                    padding: EdgeInsets.only(
                      bottom: 16.w,
                      left: 16.w,
                      right: 10.w,
                      top: 16.w,
                    ),
                    // margin: EdgeInsets.only(right: 10.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.primary1.withOpacity(.15),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              text: 'Patient Name',
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.primary1,
                                fontSize: 14.30.sp,
                                letterSpacing: -1,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextView(
                              text: 'Dates',
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.primary1,
                                fontSize: 14.30.sp,
                                letterSpacing: -1,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextView(
                              text: 'Time',
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.primary1,
                                fontSize: 14.30.sp,
                                letterSpacing: -1,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 14.w),
                              child: TextView(
                                text: 'Action',
                                textStyle: GoogleFonts.gabarito(
                                  color: AppColor.primary1,
                                  fontSize: 14.30.sp,
                                  letterSpacing: -1,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        if (model.labTechMostRecentAppointmentModel != null &&
                            model
                                .labTechMostRecentAppointmentModel!
                                .labTechRecentAppointmentModelList!
                                .isNotEmpty)
                          ...model
                              .labTechMostRecentAppointmentModel!
                              .labTechRecentAppointmentModelList!
                              .take(5)
                              .map(
                                (o) => Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,

                                  children: [
                                    SizedBox(
                                      width: isTablet ? 200 : 100,
                                      child: TextView(
                                        text:
                                            '${o.user?.firstName?.capitalize() ?? ""} ${o.user?.lastName?.capitalize() ?? ""}',
                                        textAlign: TextAlign.start,
                                        textOverflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        textStyle: GoogleFonts.gabarito(
                                          color: AppColor.primary1,
                                          fontSize: 14.sp,
                                          letterSpacing: -1,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 6.10.w),
                                    SizedBox(
                                      width: 80.w,
                                      child: TextView(
                                        text: DateFormat(
                                          'dd MMM,  yyyy',
                                        ).format(
                                          DateTime.parse(
                                            o.date.toString(),
                                          ).toLocal(),
                                        ),
                                        textAlign: TextAlign.start,
                                        textOverflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        textStyle: GoogleFonts.gabarito(
                                          color: AppColor.primary1,
                                          fontSize: 14.sp,
                                          letterSpacing: -1,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 70.w,
                                      child: TextView(
                                        text: o.time ?? "",
                                        textAlign: TextAlign.start,

                                        textOverflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        textStyle: GoogleFonts.gabarito(
                                          color: AppColor.primary1,
                                          fontSize: 14.sp,
                                          letterSpacing: -1,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          width: 20.w,
                                          child: Checkbox(
                                            value:
                                                o.status?.toLowerCase() ==
                                                        'completed'
                                                    ? true
                                                    : false,
                                            onChanged: (isChecked) {},
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            model.cancelAppointmentDialogBox(
                                              context,
                                              id: o.orderId.toString(),
                                            );
                                          },
                                          icon: Icon(
                                            Icons.cancel_outlined,
                                            color: AppColor.fineRed,
                                            size: 20.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  pharmContainer(context, {image, text1, text2, color}) => GestureDetector(
    onTap: () {},
    child: Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 12.0.w),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Container(
            padding: EdgeInsets.all(9.2.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.white,
            ),
            child: SvgPicture.asset(image, height: 22.h, width: 22.w),
          ),
          SizedBox(height: 10.h),
          TextView(
            text: text1,

            textAlign: TextAlign.start,
            textStyle: GoogleFonts.gabarito(
              color: AppColor.white,
              fontSize: 16.30.sp,
              letterSpacing: -1,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10.h),
          TextView(
            text: text2,
            textAlign: TextAlign.start,
            textStyle: GoogleFonts.gabarito(
              color: AppColor.white,
              fontSize: 28.20.sp,
              fontWeight: FontWeight.w700,
              letterSpacing: -1,
            ),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    ),
  );
}
