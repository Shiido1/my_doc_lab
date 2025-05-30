// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_utils.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/model/get_doc_detail_response_model/get_doc_detail_response_model.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../app_assets/app_image.dart';
import '../../../app_assets/constant.dart';
import '../../../widget/text_widget.dart';
import '../appointment/consultation_screen.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key, required this.id});
  String? id;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Availabilities? v;
  AvailableSlots? t;

  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => AuthViewModel(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          model.getSpecificDoctor(context, widget.id);
        });
      },
      disposeViewModel: false,
      builder: (_, AuthViewModel model, __) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 0.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.keyboard_arrow_left, size: 30.sp),
                ),
                SizedBox(height: 10.h),
                surround_padding(
                  value: 20.w,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      model.getDocDetailResponseModel?.original?.profileImage !=
                              null
                          ? Expanded(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.network(
                                model
                                        .getDocDetailResponseModel!
                                        .original!
                                        .profileImage!
                                        .contains('https')
                                    ? '${model.getDocDetailResponseModel?.original?.profileImage}'
                                    : 'https://res.cloudinary.com/dnv6yelbr/image/upload/v1747827538/${model.getDocDetailResponseModel?.original?.profileImage}',

                                height: 156.h,
                                width: 120.w,
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (context, error, stackTrace) =>
                                        shimmerViewDoc(),
                              ),
                            ),
                          )
                          : shimmerViewDoc(),
                      SizedBox(width: 15.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200.w,
                              child: TextView(
                                text:
                                    'Dr ${model.getDocDetailResponseModel?.original?.firstName?.capitalize() ?? ''} ${model.getDocDetailResponseModel?.original?.lastName?.capitalize() ?? ''}',
                                textStyle: GoogleFonts.gabarito(
                                  color: AppColor.black,
                                  fontSize: 20.0.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            TextView(
                              text:
                                  model
                                      .getDocDetailResponseModel
                                      ?.original
                                      ?.speciality ??
                                  '',
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.grey,
                                fontSize: 14.0.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 10.h),

                            Container(
                              width: 50.w,
                              padding: EdgeInsets.symmetric(
                                vertical: 2.h,
                                horizontal: 6.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4.r),
                                color: AppColor.primary,
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: AppColor.white,
                                    size: 14.sp,
                                  ),
                                  SizedBox(width: 3.w),
                                  TextView(
                                    text: '4.8',
                                    textStyle: GoogleFonts.dmSans(
                                      color: AppColor.white,
                                      fontSize: 12.0.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.w),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AppImage.location,
                                  height: 14.h,
                                  width: 14.w,
                                ),
                                SizedBox(width: 4.w),
                                TextView(
                                  text: '800m away',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.black,
                                    fontSize: 12.0.sp,
                                    fontWeight: FontWeight.w500,
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
                SizedBox(height: 20.w),
                surround_padding(
                  value: 20.w,
                  child: TextView(
                    text: 'About',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.black,
                      fontSize: 16.0.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 10.w),
                !isTapped
                    ? surround_padding(
                      value: 20.w,
                      child: Wrap(
                        children: [
                          SizedBox(
                            width: 350.w,
                            child: TextView(
                              text:
                                  model
                                      .getDocDetailResponseModel
                                      ?.original
                                      ?.about ??
                                  '',
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.black,
                                fontSize: 14.60.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              maxLines: 3,
                              textOverflow: TextOverflow.ellipsis,
                            ),
                          ),

                          SizedBox(height: 10.w),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isTapped = true;
                              });
                            },
                            child: TextView(
                              text: 'Read More',
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.green,
                                fontSize: 14.60.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    : surround_padding(
                      value: 20.w,
                      child: Wrap(
                        children: [
                          SizedBox(
                            child: TextView(
                              text:
                                  model
                                      .getDocDetailResponseModel
                                      ?.original
                                      ?.about ??
                                  '',
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.black,
                                fontSize: 14.60.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isTapped = false;
                              });
                            },
                            child: TextView(
                              text: 'Read Less',
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.green,
                                fontSize: 14.60.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                SizedBox(height: 20.w),
                surround_padding(
                  value: 20.w,
                  child: TextView(
                    text: 'Time Availability',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.black,
                      fontSize: 16.0.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 10.w),
                surround_padding(
                  value: 20.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (model.getDocDetailResponseModel != null &&
                          model
                              .getDocDetailResponseModel!
                              .original!
                              .availabilities!
                              .isNotEmpty)
                        ...model
                            .getDocDetailResponseModel!
                            .original!
                            .availabilities!
                            .map(
                              (e) => Padding(
                                padding: EdgeInsets.only(bottom: 4.4.w),
                                child: TextView(
                                  text:
                                      '${e.dayOfWeek?.capitalize()} :  ${formTime(e.startTime)} - ${formTime(e.endTime)}',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.black,
                                    fontSize: 15.20.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
                SizedBox(height: 20.w),
                surround_padding(
                  value: 20.w,
                  child: TextView(
                    text: 'Certification',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.black,
                      fontSize: 16.0.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 20.w),
                surround_padding(
                  value: 20.w,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        AppImage.gradcap,
                        height: 20.h,
                        width: 20.w,
                      ),
                      SizedBox(width: 18.20.w),
                      SizedBox(
                        width: 290.w,
                        child: Html(
                          data:
                              model
                                  .getDocDetailResponseModel
                                  ?.original
                                  ?.certifications ??
                              '',
                          shrinkWrap: true,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.w),
                surround_padding(
                  value: 20.w,
                  child: TextView(
                    text: 'Experience',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.black,
                      fontSize: 16.0.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 20.w),
                surround_padding(
                  value: 20.w,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset(AppImage.exp, height: 20.h, width: 20.w),
                      SizedBox(width: 18.20.w),
                      SizedBox(
                        width: 300.w,
                        child: TextView(
                          text:
                              model
                                  .getDocDetailResponseModel
                                  ?.original
                                  ?.experience ??
                              '',
                          maxLines: 4,
                          textOverflow: TextOverflow.ellipsis,
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.black,
                            fontSize: 14.60.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.w),
                surround_padding(
                  value: 20.w,
                  child: TextView(
                    text: 'Available Dates',
                    textStyle: GoogleFonts.dmSans(
                      color: AppColor.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                surround_padding(
                  value: 20.w,
                  child: Divider(color: AppColor.grey, thickness: .5),
                ),
                SizedBox(height: 10.h),
                SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      if (model.getDocDetailResponseModel != null &&
                          model
                              .getDocDetailResponseModel!
                              .original!
                              .availabilities!
                              .isNotEmpty)
                        ...model
                            .getDocDetailResponseModel!
                            .original!
                            .availabilities!
                            .map(
                              (o) => GestureDetector(
                                onTap: () => setState(() => v = o),

                                child: Container(
                                  margin: EdgeInsets.only(right: 20.w),
                                  padding: EdgeInsets.symmetric(
                                    vertical: 6.w,
                                    horizontal: 6.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color:
                                        v == o
                                            ? AppColor.primary1
                                            : AppColor.transparent,
                                    border: Border.all(
                                      color: AppColor.funnyLookingGrey,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      TextView(
                                        text: o.dayOfWeek!
                                            .capitalize()
                                            .substring(0, 3),
                                        textStyle: GoogleFonts.dmSans(
                                          color:
                                              v == o
                                                  ? AppColor.white
                                                  : AppColor.grey,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      TextView(
                                        text: availDateForm(o.date ?? ''),
                                        textStyle: GoogleFonts.dmSans(
                                          color:
                                              v == o
                                                  ? AppColor.white
                                                  : AppColor.grey,
                                          fontSize: 24.sp,
                                          fontWeight: FontWeight.w500,
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
                SizedBox(height: 20.h),
                surround_padding(
                  value: 20.w,
                  child: Divider(color: AppColor.grey, thickness: .2),
                ),
                SizedBox(height: 10.h),
                surround_padding(
                  value: 4.w,
                  child: Wrap(
                    spacing: 6.20,
                    runSpacing: 10,
                    alignment: WrapAlignment.start,
                    children: [
                      if (model.getDocDetailResponseModel != null &&
                          model
                              .getDocDetailResponseModel!
                              .original!
                              .availableSlots!
                              .isNotEmpty)
                        if (v != null)
                          ...model
                              .getDocDetailResponseModel!
                              .original!
                              .availableSlots!
                              .where(
                                (t) =>
                                    t.availabilityId.toString() ==
                                    v?.id.toString(),
                              )
                              .map(
                                (o) => GestureDetector(
                                  onTap:
                                      o.isBooked == true
                                          ? () {}
                                          : () {
                                            setState(() {
                                              t = o;
                                            });
                                          },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 5.4.w,
                                      // horizontal: 14.w,
                                    ),
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(22),
                                      color:
                                          t == o
                                              ? AppColor.primary1
                                              : AppColor.transparent,
                                      border: Border.all(
                                        color: selectFadeTimeContainer(o),
                                      ),
                                    ),
                                    child: Center(
                                      child: TextView(
                                        text: o.availableTime ?? '',
                                        textStyle: GoogleFonts.dmSans(
                                          color: selectFadeTimeText(o),
                                          fontSize: 16.2.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                        else
                          ...model
                              .getDocDetailResponseModel!
                              .original!
                              .availableSlots!
                              .map(
                                (o) => GestureDetector(
                                  onTap:
                                      o.isBooked == true
                                          ? () {}
                                          : () {
                                            setState(() {
                                              t = o;
                                            });
                                          },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 5.4.w,
                                      // horizontal: 14.w,
                                    ),
                                    width: 80.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(22),
                                      color:
                                          t == o
                                              ? AppColor.primary1
                                              : AppColor.transparent,
                                      border: Border.all(
                                        color: selectFadeTimeContainer(o),
                                      ),
                                    ),
                                    child: Center(
                                      child: TextView(
                                        text: o.availableTime ?? '',
                                        textStyle: GoogleFonts.dmSans(
                                          color: selectFadeTimeText(o),
                                          fontSize: 16.2.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                    ],
                  ),
                ),
                SizedBox(height: 40.h),
                surround_padding(
                  value: 20.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (v != null) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder:
                                    (context) => ConsultationScreen(
                                      bookTyoe: 'book',
                                      docId: widget.id,
                                      slotId: t,
                                      doctor:
                                          '${model.getDocDetailResponseModel?.original?.firstName ?? ''} ${model.getDocDetailResponseModel?.original?.lastName ?? ''}',
                                    ),
                              ),
                            );
                          } else {
                            AppUtils.snackbar(
                              context,
                              message: 'Kindly select a date and time',
                              error: true,
                            );
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 7.2.w,
                            horizontal: 14.0.w,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.primary1,
                          ),
                          child: TextView(
                            text: 'Book Appointment',
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.white,
                              fontSize: 14.0.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (v != null) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder:
                                    (context) => ConsultationScreen(
                                      bookTyoe: 'book-friend',
                                      slotId: t,
                                      docId: widget.id,
                                      doctor:
                                          '${model.getDocDetailResponseModel?.original?.firstName ?? ''} ${model.getDocDetailResponseModel?.original?.lastName ?? ''}',
                                    ),
                              ),
                            );
                          } else {
                            AppUtils.snackbar(
                              context,
                              message: 'Kindly select a date and time',
                              error: true,
                            );
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 7.2.w,
                            horizontal: 14.0.w,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color.fromARGB(255, 181, 222, 204),
                          ),
                          child: TextView(
                            text: 'Book for Someone else',
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.darkindgrey,
                              fontSize: 14.0.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 60.h),
              ],
            ),
          ),
        );
      },
    );
  }

  // ignore: non_constant_identifier_names
  surround_padding({child, value}) => Padding(
    padding: EdgeInsetsGeometry.symmetric(horizontal: value),
    child: child,
  );

  Color selectFadeContainer(AvailableSlots? isBooked) {
    if (isBooked!.isBooked == true) {
      return AppColor.funnyLookingGrey.withOpacity(.4);
    }
    return AppColor.funnyLookingGrey;
  }

  Color selectFadeDayText(AvailableSlots? isBooked) {
    if (isBooked!.isBooked == true) {
      return AppColor.funnyLookingGrey.withOpacity(.4);
    } else if (v == isBooked) {
      return AppColor.white;
    }
    return AppColor.grey;
  }

  Color selectFadeDateText(AvailableSlots? isBooked) {
    if (isBooked!.isBooked == true) {
      return AppColor.funnyLookingGrey.withOpacity(.4);
    } else if (v == isBooked) {
      return AppColor.white;
    }
    return AppColor.black;
  }

  Color selectFadeTimeContainer(AvailableSlots? isBooked) {
    if (isBooked!.isBooked == true) {
      return AppColor.funnyLookingGrey.withOpacity(.4);
    }
    return AppColor.funnyLookingGrey;
  }

  Color selectFadeTimeText(AvailableSlots? isBooked) {
    if (isBooked!.isBooked == true) {
      return AppColor.funnyLookingGrey.withOpacity(.4);
    } else if (t == isBooked) {
      return AppColor.white;
    }
    return AppColor.black;
  }
}
