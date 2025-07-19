// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:doc_lab_pharm/ui/app_assets/app_color.dart';
import 'package:doc_lab_pharm/ui/app_assets/constant.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/connect_end/view_model/med_lab_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../app_assets/app_image.dart';
import '../../../widget/text_form_widget.dart';
import '../../../widget/text_widget.dart';

class LaboratoryReportScreen extends StatefulWidget {
  const LaboratoryReportScreen({super.key});

  @override
  State<LaboratoryReportScreen> createState() => _LaboratoryReportScreenState();
}

class _LaboratoryReportScreenState extends State<LaboratoryReportScreen> {
  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    return ViewModelBuilder<LabTechViewModel>.reactive(
      viewModelBuilder: () => locator<LabTechViewModel>(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          model.getLabTechReport();
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
                    text: 'Report',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 20.w),
                TextFormWidget(
                  label: 'Search for Report...',
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
                    model.queryReport = p0;
                    model.notifyListeners();
                  },
                ),
                SizedBox(height: 30.h),

                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight:
                        isTablet
                            ? 630.h
                            : 500.h, // ✅ set your maximum width here
                  ),
                  child: RefreshIndicator(
                    onRefresh: () async {
                      await model.getLabTechReportReload();
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          if (model.getLabTechReportResponseModel != null &&
                              model
                                  .getLabTechReportResponseModel!
                                  .data!
                                  .isNotEmpty)
                            if (model.queryReport != '')
                              ...model.getLabTechReportResponseModel!.data!
                                  .where(
                                    (w) =>
                                        w.user!.firstName!
                                            .toLowerCase()
                                            .contains(
                                              model.queryReport.toLowerCase(),
                                            ) ||
                                        w.user!.lastName!
                                            .toLowerCase()
                                            .contains(
                                              model.queryReport.toLowerCase(),
                                            ),
                                  )
                                  .map(
                                    (i) => Container(
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
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: 250.w,
                                                child: TextView(
                                                  text:
                                                      '${i.user?.firstName?.capitalize()} ${i.user?.lastName?.capitalize()}',
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
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 2.10.w,
                                                ),
                                                child: Row(
                                                  children: [
                                                    GestureDetector(
                                                      onTap:
                                                          () => model
                                                              .modalBottomSheetReport(
                                                                context,
                                                                onEdit: true,
                                                                reportId:
                                                                    i.id.toString(),
                                                                dtReport: i,
                                                              ),
                                                      child: SvgPicture.asset(
                                                        AppImage.edit,
                                                        height: 20.50.h,
                                                        width: 20.50.w,
                                                      ),
                                                    ),
                                                    SizedBox(width: 3.10.h),
                                                    IconButton(
                                                      onPressed:
                                                          () => model
                                                              .deleteReportDialogBox(
                                                                context,
                                                                reportId:
                                                                    i.id.toString(),
                                                              ),
                                                      icon: Icon(
                                                        Icons
                                                            .delete_forever_outlined,
                                                        size: 24.30.sp,
                                                        color: AppColor.fineRed,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10.h),

                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 2.w,
                                                  horizontal: 6.w,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: model
                                                      .statusValuePatientsColor(
                                                        i.status,
                                                      )
                                                      .withOpacity(.2),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        6.2,
                                                      ),
                                                ),
                                                child: TextView(
                                                  text:
                                                      '${i.status?.capitalize()}',
                                                  textStyle: GoogleFonts.gabarito(
                                                    color: model
                                                        .statusValuePatientsColor(
                                                          i.status,
                                                        ),
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.all(4.w),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: AppColor.primary1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        6.10,
                                                      ),
                                                ),
                                                child: SizedBox(
                                                  width: 90.w,
                                                  child: TextView(
                                                    text:
                                                        i.diagnosis?.name ?? '',
                                                    maxLines: 1,
                                                    textAlign: TextAlign.center,
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    textStyle:
                                                        GoogleFonts.gabarito(
                                                          color:
                                                              AppColor.primary1,
                                                          fontSize: 13.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                            else
                              ...model.getLabTechReportResponseModel!.data!.map(
                                (i) => Container(
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
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 250.w,
                                            child: TextView(
                                              text:
                                                  '${i.user?.firstName?.capitalize()} ${i.user?.lastName?.capitalize()}',
                                              textStyle: GoogleFonts.gabarito(
                                                color: AppColor.darkindgrey,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              maxLines: 1,
                                              textOverflow:
                                                  TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 2.10.w,
                                            ),
                                            child: Row(
                                              children: [
                                                GestureDetector(
                                                  onTap:
                                                      () => model
                                                          .modalBottomSheetReport(
                                                            context,
                                                            onEdit: true,
                                                            reportId:
                                                                i.id.toString(),
                                                            dtReport: i,
                                                          ),
                                                  child: SvgPicture.asset(
                                                    AppImage.edit,
                                                    height: 20.50.h,
                                                    width: 20.50.w,
                                                  ),
                                                ),
                                                SizedBox(width: 3.10.h),
                                                IconButton(
                                                  onPressed:
                                                      () => model
                                                          .deleteReportDialogBox(
                                                            context,
                                                            reportId:
                                                                i.id.toString(),
                                                          ),
                                                  icon: Icon(
                                                    Icons
                                                        .delete_forever_outlined,
                                                    size: 24.30.sp,
                                                    color: AppColor.fineRed,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10.h),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 2.w,
                                              horizontal: 6.w,
                                            ),
                                            decoration: BoxDecoration(
                                              color: model
                                                  .statusValuePatientsColor(
                                                    i.status,
                                                  )
                                                  .withOpacity(.2),
                                              borderRadius:
                                                  BorderRadius.circular(6.2),
                                            ),
                                            child: TextView(
                                              text: '${i.status?.capitalize()}',
                                              textStyle: GoogleFonts.gabarito(
                                                color: model
                                                    .statusValuePatientsColor(
                                                      i.status,
                                                    ),
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(4.w),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: AppColor.primary1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(6.10),
                                            ),
                                            child: SizedBox(
                                              width: 90.w,
                                              child: TextView(
                                                text: i.diagnosis?.name ?? '',
                                                maxLines: 1,
                                                textAlign: TextAlign.center,
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                textStyle: GoogleFonts.gabarito(
                                                  color: AppColor.primary1,
                                                  fontSize: 13.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 6.10.h),
                                    ],
                                  ),
                                ),
                              ),
                          SizedBox(height: 30.h),
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
}
