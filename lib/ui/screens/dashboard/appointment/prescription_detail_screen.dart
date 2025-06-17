// ignore_for_file: must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/constant.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/view_model/doc_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../app_assets/app_color.dart';
import '../../../widget/text_widget.dart';

class PrescriptionDetailScreen extends StatelessWidget {
  PrescriptionDetailScreen({super.key, required this.id});
  String? id;

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    return ViewModelBuilder<DocViewModel>.reactive(
      viewModelBuilder: () => locator<DocViewModel>(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          model.getPrescriptionView(id!);
        });
      },
      disposeViewModel: false,
      builder: (_, DocViewModel model, __) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 50.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                TextView(
                  text: 'Prescription Details',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.darkindgrey,
                    fontSize: 22.40.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.h),
                TextView(
                  text:
                      '${model.prescriptionViewResponse?.user?.firstName?.capitalize() ?? ''} ${model.prescriptionViewResponse?.user?.lastName?.capitalize() ?? ''}',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.darkindgrey,
                    fontSize: 18.40.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10.h),
                TextView(
                  text: 'Patient\'s Condition:',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.funnyLookingGrey.withOpacity(.6),
                    fontSize: 18.40.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 10.h),
                TextView(
                  text:
                      model.prescriptionViewResponse?.notes?.capitalize() ?? '',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.funnyLookingGrey.withOpacity(.6),
                    fontSize: 18.40.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 20.h),
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      6,
                    ), // 👈 set the corner radius here
                  ),
                  color: AppColor.white,
                  shadowColor: AppColor.white,
                  child: Container(
                    constraints: BoxConstraints(
                      maxHeight: isTablet ? 600 : 560,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColor.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: CupertinoScrollbar(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            CupertinoScrollbar(
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20),
                                    Container(
                                      color: AppColor.primary1.withOpacity(.4),
                                      padding: EdgeInsets.symmetric(
                                        vertical: 4,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(width: 20),
                                          TextView(
                                            text: 'Medication',
                                            textOverflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            textStyle: GoogleFonts.gabarito(
                                              color: AppColor.darkindgrey,
                                              fontSize: 18.20,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(width: isTablet ? 200 : 100),
                                          TextView(
                                            text: 'Dosage',
                                            textOverflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            textStyle: GoogleFonts.gabarito(
                                              color: AppColor.darkindgrey,
                                              fontSize: 18.20,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(width: isTablet ? 160 : 80),
                                          TextView(
                                            text: 'Frequency',
                                            textOverflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            textStyle: GoogleFonts.gabarito(
                                              color: AppColor.darkindgrey,
                                              fontSize: 18.20,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(width: isTablet ? 120 : 100),
                                          TextView(
                                            text: 'Notes',
                                            textOverflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            textStyle: GoogleFonts.gabarito(
                                              color: AppColor.darkindgrey,
                                              fontSize: 18.20,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(width: 140),
                                          TextView(
                                            text: 'Prescribed by',
                                            textOverflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            textStyle: GoogleFonts.gabarito(
                                              color: AppColor.darkindgrey,
                                              fontSize: 18.20,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          SizedBox(width: 150),
                                        ],
                                      ),
                                    ),

                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 20.h),
                                        if (model.prescriptionViewResponse !=
                                                null &&
                                            model
                                                .prescriptionViewResponse!
                                                .drugs!
                                                .isNotEmpty)
                                          ...model.prescriptionViewResponse!.drugs!.map(
                                            (o) => Column(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    left: 10.w,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            width: 200.w,
                                                            child: TextView(
                                                              text:
                                                                  o
                                                                      .medicine
                                                                      ?.name ??
                                                                  '',
                                                              textStyle: GoogleFonts.gabarito(
                                                                color:
                                                                    AppColor
                                                                        .black,
                                                                fontSize: 16.20,

                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),

                                                              textOverflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                            ),
                                                          ),

                                                          SizedBox(
                                                            width: 80.w,
                                                            child: TextView(
                                                              text:
                                                                  o.dosage ??
                                                                  '',
                                                              textStyle: GoogleFonts.gabarito(
                                                                color:
                                                                    AppColor
                                                                        .black,
                                                                fontSize: 16.20,

                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                              textOverflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                            ),
                                                          ),
                                                          SizedBox(width: 40),
                                                          SizedBox(
                                                            width: 120.w,
                                                            child: TextView(
                                                              text:
                                                                  o.frequency ??
                                                                  '',
                                                              textStyle: GoogleFonts.gabarito(
                                                                color:
                                                                    AppColor
                                                                        .black,
                                                                fontSize: 16.20,

                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                              textOverflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                            ),
                                                          ),

                                                          SizedBox(
                                                            width: 200,
                                                            child: TextView(
                                                              text:
                                                                  o.instructions ??
                                                                  '',
                                                              textStyle: GoogleFonts.gabarito(
                                                                color:
                                                                    AppColor
                                                                        .black,
                                                                fontSize: 16.20,

                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                              textOverflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 4,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),

                                                          SizedBox(width: 20.h),
                                                          SizedBox(
                                                            width: 200,
                                                            child: TextView(
                                                              text:
                                                                  'Dr. ${model.prescriptionViewResponse?.doctor?.firstName?.capitalize() ?? ''} ${model.prescriptionViewResponse?.doctor?.lastName?.capitalize() ?? ''}',
                                                              textStyle: GoogleFonts.gabarito(
                                                                color:
                                                                    AppColor
                                                                        .black,
                                                                fontSize: 16.20,

                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                              ),
                                                              textOverflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              maxLines: 1,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: 900,
                                                        child: Divider(
                                                          color:
                                                              AppColor
                                                                  .darkindgrey,
                                                          thickness: .41,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        SizedBox(height: 40.h),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
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
