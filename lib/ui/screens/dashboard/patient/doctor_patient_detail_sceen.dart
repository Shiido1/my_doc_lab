import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:doc_lab_pharm/core/connect_end/view_model/doc_view_model.dart';
import 'package:doc_lab_pharm/ui/app_assets/app_color.dart';
import 'package:doc_lab_pharm/ui/app_assets/app_image.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/model/get_list_of_doctors_appointment_model/get_list_of_doctors_appointment_model.dart';
import '../../../app_assets/constant.dart';
import '../../../widget/text_widget.dart';
import '../../../../../core/core_folder/app/app.router.dart';
import '../../../../../main.dart';

// ignore: must_be_immutable
class DoctorAppointmentDetailSceen extends StatefulWidget {
  DoctorAppointmentDetailSceen({super.key, this.appointment});
  GetListOfDoctorsAppointmentModel? appointment;

  @override
  State<DoctorAppointmentDetailSceen> createState() =>
      _DoctorAppointmentDetailSceenState();
}

class _DoctorAppointmentDetailSceenState
    extends State<DoctorAppointmentDetailSceen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DocViewModel>.reactive(
      viewModelBuilder: () => DocViewModel(),
      onViewModelReady: (model) {
        model.getDoctorsNote(context, id: widget.appointment!.user!.id);
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
                SizedBox(height: 20.h),
                Row(
                  children: [
                    widget.appointment!.user!.profileImage != null
                        ? Container(
                          decoration: BoxDecoration(
                            color: AppColor.oneKindgrey,
                            borderRadius: BorderRadius.circular(
                              10,
                            ), // Outer container radius
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              10,
                            ), // Apply to the image as well
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(50),
                              child: Image.network(
                                widget.appointment!.user!.profileImage!
                                        .contains('https')
                                    ? '${widget.appointment!.user!.profileImage}'
                                    : 'https://res.cloudinary.com/dnv6yelbr/image/upload/v1747827538/${widget.appointment!.user!.profileImage}',
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (context, error, stackTrace) =>
                                        shimmerViewPharm(),
                              ),
                            ),
                          ),
                        )
                        : Container(
                          padding: EdgeInsets.all(48.8.w),
                          decoration: BoxDecoration(
                            color: AppColor.oneKindgrey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                    SizedBox(width: 20.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text:
                              '${widget.appointment!.user?.firstName?.capitalize() ?? ''} ${widget.appointment!.user!.lastName?.capitalize() ?? ''}',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.darkindgrey,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10.w),

                        GestureDetector(
                          onTap:
                              () => navigate.navigateTo(
                                Routes.doctorChatScreen,
                                arguments: DoctorChatScreenArguments(
                                  id: '',
                                  messageModel: null,
                                  sender: null,
                                  app: widget.appointment,
                                  data: null,
                                ),
                              ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 4.w,
                              horizontal: 8.w,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: AppColor.darkindgrey),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppImage.chat,
                                  height: 14.h,
                                  width: 14.w,
                                  color: AppColor.darkindgrey,
                                ),
                                SizedBox(width: 4.w),
                                TextView(
                                  text: 'Message',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.darkindgrey,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 24.0.w),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.w),
                Divider(color: AppColor.greyIt, thickness: 1),
                SizedBox(height: 10.h),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 4.w,
                            horizontal: 8.w,
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColor.grey),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextView(
                                text: 'Appointment Type',
                                textStyle: GoogleFonts.gabarito(
                                  color: AppColor.darkindgrey,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),

                              SizedBox(height: 6.h),
                              TextView(
                                text:
                                    widget.appointment?.consultation?.name ??
                                    '',
                                textStyle: GoogleFonts.gabarito(
                                  color: AppColor.darkindgrey,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 20.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 4.w,
                            horizontal: 8.w,
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColor.grey),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: 10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    text: 'Status',
                                    textStyle: GoogleFonts.gabarito(
                                      color: AppColor.darkindgrey,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 2.w,
                                      horizontal: 8.w,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: model
                                          .getAppColor(
                                            widget.appointment?.status ?? '',
                                          )
                                          .withOpacity(.3),
                                    ),
                                    child: TextView(
                                      text: model.getAppStatusText(
                                        widget.appointment?.status ?? '',
                                      ),
                                      textStyle: GoogleFonts.gabarito(
                                        color: model.getAppColor(
                                          widget.appointment?.status ?? '',
                                        ),
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.20.h),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  TextView(
                                    text: 'Description: ',
                                    textStyle: GoogleFonts.gabarito(
                                      color: AppColor.darkindgrey,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      width: 250.w,
                                      child: TextView(
                                        text:
                                            widget.appointment?.message
                                                ?.capitalize() ??
                                            '',
                                        maxLines: 4,
                                        textOverflow: TextOverflow.ellipsis,
                                        textStyle: GoogleFonts.gabarito(
                                          color: AppColor.black,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 12.20.h),
                            ],
                          ),
                        ),

                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            SvgPicture.asset(
                              AppImage.pres,
                              height: 12.h,
                              width: 12.w,
                            ),
                            SizedBox(width: 6.w),
                            TextView(
                              text: 'Slot',
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.darkindgrey,
                                fontSize: 16.20.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12.h),
                        Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 4.w,
                            horizontal: 8.w,
                          ),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: AppColor.grey),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextView(
                                text:
                                    'Date: ${DateFormat('dd/MM/yyyy').format(DateTime.parse(widget.appointment!.slot!.availableDate.toString()).toLocal())}',
                                textStyle: GoogleFonts.gabarito(
                                  color: AppColor.darkindgrey,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 6.h),
                              TextView(
                                text:
                                    'Time: ${widget.appointment?.slot?.availableTime ?? ''}',
                                textStyle: GoogleFonts.gabarito(
                                  color: AppColor.darkindgrey,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 6.h),
                            ],
                          ),
                        ),
                        SizedBox(height: 30.h),
                        if (model.getDoctorsNoteModel != null &&
                            model.getDoctorsNoteModel!.notes!.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextView(
                                text: 'Doctor\'s Overview',
                                textStyle: GoogleFonts.gabarito(
                                  color: const Color.fromARGB(255, 8, 27, 31),
                                  fontSize: 22.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 20.h),
                              ...model.getDoctorsNoteModel!.notes!.map(
                                (n) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text:
                                          'Dr. ${n.author?.firstName?.capitalize()} ${n.author?.lastName?.capitalize()}',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.darkindgrey,
                                        fontSize: 18.8.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(height: 16.0.h),
                                    Padding(
                                      padding: EdgeInsets.only(left: 8.w),
                                      child: TextView(
                                        text: model.getAllDoctorsNotes(n),
                                        textStyle: GoogleFonts.gabarito(
                                          color: AppColor.black,
                                          fontSize: 15.4.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 12.0.h),
                                  ],
                                ),
                              ),
                              SizedBox(height: 6.0.h),
                            ],
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
