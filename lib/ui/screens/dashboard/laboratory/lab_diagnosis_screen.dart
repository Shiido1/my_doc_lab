import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:doc_lab_pharm/ui/app_assets/app_color.dart';
import 'package:doc_lab_pharm/ui/app_assets/constant.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/connect_end/view_model/med_lab_view_model.dart';
import '../../../app_assets/app_image.dart';
import '../../../widget/text_form_widget.dart';
import '../../../widget/text_widget.dart';
import 'lab_order_detail_screen.dart';

class LaboratoryDiagnosisScreen extends StatefulWidget {
  const LaboratoryDiagnosisScreen({super.key});

  @override
  State<LaboratoryDiagnosisScreen> createState() =>
      _LaboratoryDiagnosisScreenState();
}

class _LaboratoryDiagnosisScreenState extends State<LaboratoryDiagnosisScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LabTechViewModel>.reactive(
      viewModelBuilder: () => LabTechViewModel(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          model.getAllDiagnosis(context);
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
                    text: 'Diagnosis',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 20.w),
                Row(
                  children: [
                    Expanded(
                      child: TextFormWidget(
                        label: 'Search for Diagnosis...',
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
                          query = p0;
                          setState(() {});
                        },
                      ),
                    ),
                    SizedBox(width: 2.w),
                    IconButton(
                      onPressed:
                          () => model.modalBottomSheetAddCategory(context),
                      icon: Icon(
                        Icons.add,
                        size: 25.50.sp,
                        color: AppColor.darkindgrey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => model.modalBottomSheetLabDiagnosis(context),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 4.w,
                        vertical: 3.4.w,
                      ),
                      width: 160.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: AppColor.primary1,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add,
                            color: AppColor.white,
                            size: 17.20.sp,
                          ),
                          SizedBox(width: 2.4.w),
                          TextView(
                            text: 'Add New Service',
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.white,
                              fontSize: 14.8.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),

                SizedBox(
                  height: 550.h,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        if (model.getAllDiagnosisListResponseModel != null &&
                            model
                                .getAllDiagnosisListResponseModel!
                                .getAllDiagnosisListResponseModelList!
                                .isNotEmpty)
                          if (query != '')
                            ...model
                                .getAllDiagnosisListResponseModel!
                                .getAllDiagnosisListResponseModelList!
                                .where(
                                  (o) => o.name!.toLowerCase().contains(
                                    query.toLowerCase(),
                                  ),
                                )
                                .map(
                                  (i) => GestureDetector(
                                    onTap:
                                        () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder:
                                                (context) =>
                                                    LabOrderPatientDetailSceen(),
                                          ),
                                        ),
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 8.w,
                                        horizontal: 12.w,
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
                                                  maxLines: 1,
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                  text:
                                                      'Diagnosis: ${i.name ?? ''}',
                                                  textStyle:
                                                      GoogleFonts.gabarito(
                                                        color:
                                                            AppColor
                                                                .darkindgrey,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),

                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 2.w,
                                                  horizontal: 6.w,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: AppColor.primary1
                                                      .withOpacity(.2),
                                                  borderRadius:
                                                      BorderRadius.circular(22),
                                                ),
                                                child: TextView(
                                                  text:
                                                      i.status?.capitalize() ??
                                                      '',
                                                  textStyle:
                                                      GoogleFonts.gabarito(
                                                        color: model
                                                            .statusValueColor(
                                                              i.status,
                                                            ),
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 4.h),
                                          SizedBox(
                                            width: 400.w,
                                            child: TextView(
                                              text:
                                                  'Detail: ${i.details ?? ''}',

                                              maxLines: 5,
                                              textOverflow:
                                                  TextOverflow.ellipsis,

                                              textStyle: GoogleFonts.gabarito(
                                                color: AppColor.greyIt,
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 6.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextView(
                                                text:
                                                    '${getCurrency()}${oCcy.format(double.parse('${i.price}'))}',
                                                textStyle: TextStyle(
                                                  color: AppColor.darkindgrey,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              TextView(
                                                text:
                                                    'Turnaround: ${i.turnaround ?? ''}',
                                                textStyle: GoogleFonts.gabarito(
                                                  color: AppColor.greyIt,
                                                  fontSize: 15.8.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10.w),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  model
                                                      .modalBottomSheetLabDiagnosis(
                                                        context,
                                                        update: true,
                                                        id: i.id.toString(),
                                                      );
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 4.w,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          4,
                                                        ),
                                                    border: Border.all(
                                                      color: AppColor.grey,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.edit_square,
                                                        color:
                                                            AppColor
                                                                .darkindgrey,
                                                        size: 14.20.sp,
                                                      ),
                                                      SizedBox(width: 2.4.w),
                                                      TextView(
                                                        text: 'Edit',
                                                        textStyle:
                                                            GoogleFonts.gabarito(
                                                              color:
                                                                  AppColor
                                                                      .darkindgrey,
                                                              fontSize: 14.8.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap:
                                                    () => model
                                                        .deleteProductMedDialogBox(
                                                          context,
                                                          id: i.id.toString(),
                                                        ),
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 4.w,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          4,
                                                        ),
                                                    border: Border.all(
                                                      color: AppColor.grey,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .delete_outline_rounded,
                                                        color: AppColor.red,
                                                        size: 14.20.sp,
                                                      ),
                                                      SizedBox(width: 2.4.w),
                                                      TextView(
                                                        text: 'Delete',
                                                        textStyle:
                                                            GoogleFonts.gabarito(
                                                              color:
                                                                  AppColor.red,
                                                              fontSize: 14.8.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
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
                                .getAllDiagnosisListResponseModel!
                                .getAllDiagnosisListResponseModelList!
                                .map(
                                  (i) => GestureDetector(
                                    onTap:
                                        () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder:
                                                (context) =>
                                                    LabOrderPatientDetailSceen(),
                                          ),
                                        ),
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 8.w,
                                        horizontal: 12.w,
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
                                                  maxLines: 1,
                                                  textOverflow:
                                                      TextOverflow.ellipsis,
                                                  text:
                                                      'Diagnosis: ${i.name ?? ''}',
                                                  textStyle:
                                                      GoogleFonts.gabarito(
                                                        color:
                                                            AppColor
                                                                .darkindgrey,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),

                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                  vertical: 2.w,
                                                  horizontal: 6.w,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: AppColor.primary1
                                                      .withOpacity(.2),
                                                  borderRadius:
                                                      BorderRadius.circular(22),
                                                ),
                                                child: TextView(
                                                  text:
                                                      i.status?.capitalize() ??
                                                      '',
                                                  textStyle:
                                                      GoogleFonts.gabarito(
                                                        color: model
                                                            .statusValueColor(
                                                              i.status,
                                                            ),
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 4.h),
                                          SizedBox(
                                            width: 400.w,
                                            child: TextView(
                                              text:
                                                  'Detail: ${i.details ?? ''}',

                                              maxLines: 5,
                                              textOverflow:
                                                  TextOverflow.ellipsis,

                                              textStyle: GoogleFonts.gabarito(
                                                color: AppColor.greyIt,
                                                fontSize: 13.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 6.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              TextView(
                                                text:
                                                    '${getCurrency()}${oCcy.format(double.parse('${i.price}'))}',
                                                textStyle: TextStyle(
                                                  color: AppColor.darkindgrey,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              TextView(
                                                text:
                                                    'Turnaround: ${i.turnaround ?? ''}',
                                                textStyle: GoogleFonts.gabarito(
                                                  color: AppColor.greyIt,
                                                  fontSize: 15.8.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10.w),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  model
                                                      .modalBottomSheetLabDiagnosis(
                                                        context,
                                                        update: true,
                                                        id: i.id.toString(),
                                                      );
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 4.w,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          4,
                                                        ),
                                                    border: Border.all(
                                                      color: AppColor.grey,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.edit_square,
                                                        color:
                                                            AppColor
                                                                .darkindgrey,
                                                        size: 14.20.sp,
                                                      ),
                                                      SizedBox(width: 2.4.w),
                                                      TextView(
                                                        text: 'Edit',
                                                        textStyle:
                                                            GoogleFonts.gabarito(
                                                              color:
                                                                  AppColor
                                                                      .darkindgrey,
                                                              fontSize: 14.8.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap:
                                                    () => model
                                                        .deleteProductMedDialogBox(
                                                          context,
                                                          id: i.id.toString(),
                                                        ),
                                                child: Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 4.w,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          4,
                                                        ),
                                                    border: Border.all(
                                                      color: AppColor.grey,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .delete_outline_rounded,
                                                        color: AppColor.red,
                                                        size: 14.20.sp,
                                                      ),
                                                      SizedBox(width: 2.4.w),
                                                      TextView(
                                                        text: 'Delete',
                                                        textStyle:
                                                            GoogleFonts.gabarito(
                                                              color:
                                                                  AppColor.red,
                                                              fontSize: 14.8.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
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
