// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:doc_lab_pharm/ui/app_assets/app_color.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/view_model/med_lab_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../app_assets/app_image.dart';
import '../../../app_assets/constant.dart';
import '../../../widget/text_form_widget.dart';
import '../../../widget/text_widget.dart';

class LaboratoryPatientScreen extends StatefulWidget {
  const LaboratoryPatientScreen({super.key});

  @override
  State<LaboratoryPatientScreen> createState() =>
      _LaboratoryPatientScreenState();
}

class _LaboratoryPatientScreenState extends State<LaboratoryPatientScreen> {
  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    return ViewModelBuilder<LabTechViewModel>.reactive(
      viewModelBuilder: () => locator<LabTechViewModel>(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          model.getLabTechPatients();
        });
      },
      disposeViewModel: false,
      builder: (_, LabTechViewModel model, __) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 22.w),
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Center(
                  child: TextView(
                    text: 'Patients',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 20.w),
                TextFormWidget(
                  label: 'Search for Patients...',
                  border: 10,
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
                  onChange: (p0) {
                    model.query = p0;
                    model.notifyListeners();
                  },
                ),
                SizedBox(height: 30.h),
                SizedBox(
                  height: isTablet ? 580.h : 500.h,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        if (model.getLabTechAllPatientsResponseModelList !=
                                null &&
                            model
                                .getLabTechAllPatientsResponseModelList!
                                .getLabTexhAllPatientsResponseModelList!
                                .isNotEmpty)
                          if (model.query != '')
                            ...model
                                .getLabTechAllPatientsResponseModelList!
                                .getLabTexhAllPatientsResponseModelList!
                                .where(
                                  (w) =>
                                      w.user!.firstName!.toLowerCase().contains(
                                        model.query.toLowerCase(),
                                      ) ||
                                      w.user!.lastName!.toLowerCase().contains(
                                        model.query.toLowerCase(),
                                      ),
                                )
                                .map(
                                  (e) => GestureDetector(
                                    onTap:
                                        () => model.showPatientDialogBox(
                                          context,
                                          patients: e,
                                        ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 8.w,
                                        horizontal: 8.w,
                                      ),
                                      margin: EdgeInsets.only(bottom: 14.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: AppColor.oneKindgrey,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          e.user?.profileImage != null
                                              ? ClipOval(
                                                child: SizedBox.fromSize(
                                                  size: const Size.fromRadius(
                                                    24,
                                                  ),
                                                  child: Image.network(
                                                    e.user!.profileImage!
                                                            .contains('https')
                                                        ? '${e.user?.profileImage}'
                                                        : 'https://res.cloudinary.com/dnv6yelbr/image/upload/v1747827538/${e.user?.profileImage}',
                                                    fit: BoxFit.cover,
                                                    errorBuilder:
                                                        (
                                                          context,
                                                          error,
                                                          stackTrace,
                                                        ) => shimmerViewPharm(),
                                                  ),
                                                ),
                                              )
                                              : Container(
                                                padding: EdgeInsets.all(28.8.w),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: AppColor.oneKindgrey,
                                                ),
                                              ),
                                          SizedBox(width: 20.w),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 280.w,
                                                child: TextView(
                                                  text:
                                                      '${e.user?.firstName?.capitalize()} ${e.user?.lastName?.capitalize()}',
                                                  textStyle:
                                                      GoogleFonts.gabarito(
                                                        color:
                                                            AppColor
                                                                .darkindgrey,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                  maxLines: 1,
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              SizedBox(height: 4.w),
                                              TextView(
                                                text:
                                                    'Gender: ${e.user?.gender?.capitalize() ?? ''}',
                                                textStyle: GoogleFonts.gabarito(
                                                  color: AppColor.greyIt,
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              SizedBox(height: 10.w),
                                              Row(
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          vertical: 2.w,
                                                          horizontal: 6.w,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color: model
                                                          .statusValuePatientsColor(
                                                            e.status,
                                                          )
                                                          .withOpacity(.2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            6.2,
                                                          ),
                                                    ),
                                                    child: TextView(
                                                      text:
                                                          '${e.status?.capitalize()}',
                                                      textStyle:
                                                          GoogleFonts.gabarito(
                                                            color: model
                                                                .statusValuePatientsColor(
                                                                  e.status,
                                                                ),
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 104.w),

                                                  GestureDetector(
                                                    onTap:
                                                        () => model
                                                            .modalBottomSheetReport(
                                                              context,
                                                              report: e,
                                                            ),
                                                    child: Container(
                                                      width: 90.w,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                            horizontal: 4.w,
                                                            vertical: 4.w,
                                                          ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              6.r,
                                                            ),
                                                        color: AppColor.fineRed
                                                            .withOpacity(.6),
                                                      ),
                                                      child: TextView(
                                                        text: 'Add Report',
                                                        textAlign:
                                                            TextAlign.center,
                                                        textStyle: TextStyle(
                                                          color: AppColor.white,
                                                          fontSize: 12.20.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                          else
                            ...model
                                .getLabTechAllPatientsResponseModelList!
                                .getLabTexhAllPatientsResponseModelList!
                                .map(
                                  (e) => GestureDetector(
                                    onTap:
                                        () => model.showPatientDialogBox(
                                          context,
                                          patients: e,
                                        ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 8.w,
                                        horizontal: 8.w,
                                      ),
                                      margin: EdgeInsets.only(bottom: 14.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all(
                                          color: AppColor.oneKindgrey,
                                        ),
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          e.user?.profileImage != null
                                              ? ClipOval(
                                                child: SizedBox.fromSize(
                                                  size: const Size.fromRadius(
                                                    24,
                                                  ),
                                                  child: Image.network(
                                                    e.user!.profileImage!
                                                            .contains('https')
                                                        ? '${e.user?.profileImage}'
                                                        : 'https://res.cloudinary.com/dnv6yelbr/image/upload/v1747827538/${e.user?.profileImage}',
                                                    fit: BoxFit.cover,
                                                    errorBuilder:
                                                        (
                                                          context,
                                                          error,
                                                          stackTrace,
                                                        ) => shimmerViewPharm(),
                                                  ),
                                                ),
                                              )
                                              : Container(
                                                padding: EdgeInsets.all(23.8.w),
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: AppColor.oneKindgrey,
                                                ),
                                              ),
                                          SizedBox(width: 20.w),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 240.w,
                                                child: TextView(
                                                  text:
                                                      '${e.user?.firstName?.capitalize()} ${e.user?.lastName?.capitalize()}',
                                                  textStyle:
                                                      GoogleFonts.gabarito(
                                                        color:
                                                            AppColor
                                                                .darkindgrey,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                  maxLines: 1,
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                              SizedBox(height: 4.w),
                                              TextView(
                                                text:
                                                    'Gender: ${e.user?.gender?.capitalize() ?? ''}',
                                                textStyle: GoogleFonts.gabarito(
                                                  color: AppColor.greyIt,
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                              SizedBox(height: 10.w),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                          vertical: 2.w,
                                                          horizontal: 6.w,
                                                        ),
                                                    decoration: BoxDecoration(
                                                      color: model
                                                          .statusValuePatientsColor(
                                                            e.status,
                                                          )
                                                          .withOpacity(.2),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            6.2,
                                                          ),
                                                    ),
                                                    child: TextView(
                                                      text:
                                                          '${e.status?.capitalize()}',
                                                      textStyle:
                                                          GoogleFonts.gabarito(
                                                            color: model
                                                                .statusValuePatientsColor(
                                                                  e.status,
                                                                ),
                                                            fontSize: 12.sp,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        e.status?.toLowerCase() ==
                                                                'abnormal'
                                                            ? 104.w
                                                            : 116.w,
                                                  ),

                                                  GestureDetector(
                                                    onTap:
                                                        () => model
                                                            .modalBottomSheetReport(
                                                              context,
                                                              report: e,
                                                            ),
                                                    child: Container(
                                                      width: 90.w,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                            horizontal: 4.w,
                                                            vertical: 4.w,
                                                          ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              6.r,
                                                            ),
                                                        color: AppColor.fineRed
                                                            .withOpacity(.6),
                                                      ),
                                                      child: TextView(
                                                        text: 'Add Report',
                                                        textAlign:
                                                            TextAlign.center,
                                                        textStyle: TextStyle(
                                                          color: AppColor.white,
                                                          fontSize: 12.20.sp,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
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
