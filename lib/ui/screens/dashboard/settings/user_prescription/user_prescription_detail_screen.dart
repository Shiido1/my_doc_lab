// ignore_for_file: must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:doc_lab_pharm/ui/app_assets/constant.dart';
import '../../../../../core/connect_end/model/view_doctors_prescription_model/view_doctors_prescription_model.dart';
import '../../../../app_assets/app_color.dart';
import '../../../../widget/text_widget.dart';

class UserPrescriptionDetailScreen extends StatelessWidget {
  UserPrescriptionDetailScreen({super.key, required this.view});
  ViewDoctorsPrescriptionModel? view;

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
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

            Divider(color: AppColor.greylight, thickness: 1),
            SizedBox(height: 10.h),
            TextView(
              text:
                  'Prescribed By: ${view?.doctor?.firstName?.capitalize() ?? ''} ${view?.doctor?.lastName?.capitalize() ?? ''}',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.darkindgrey,
                fontSize: 18.40.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20.h),
            TextView(
              text:
                  '${view?.user?.firstName?.capitalize() ?? ''} ${view?.user?.lastName?.capitalize() ?? ''}',
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
              text: view?.notes?.capitalize() ?? '',
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
                constraints: BoxConstraints(maxHeight: isTablet ? 600 : 560),
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
                                  padding: EdgeInsets.symmetric(vertical: 4),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 20.h),
                                    if (view != null && view!.drugs!.isNotEmpty)
                                      ...view!.drugs!.map(
                                        (o) => Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: 10.w,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                          textStyle:
                                                              GoogleFonts.gabarito(
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
                                                          text: o.dosage ?? '',
                                                          textStyle:
                                                              GoogleFonts.gabarito(
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
                                                              o.frequency ?? '',
                                                          textStyle:
                                                              GoogleFonts.gabarito(
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
                                                          textStyle:
                                                              GoogleFonts.gabarito(
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
                                                              FontWeight.w600,
                                                        ),
                                                      ),

                                                      SizedBox(width: 20.h),
                                                      SizedBox(
                                                        width: 200,
                                                        child: TextView(
                                                          text:
                                                              'Dr. ${view?.doctor?.firstName?.capitalize() ?? ''} ${view?.doctor?.lastName?.capitalize() ?? ''}',
                                                          textStyle:
                                                              GoogleFonts.gabarito(
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
                                                          AppColor.darkindgrey,
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
  }
}
