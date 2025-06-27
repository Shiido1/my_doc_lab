// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/widget/text_form_widget.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../app_assets/app_image.dart';
import '../../../app_assets/constant.dart';
import '../../../widget/text_widget.dart';
import 'lab_attendant_detail_profile_screen.dart';

// ignore: must_be_immutable
class LaboratoryScreen extends StatefulWidget {
  const LaboratoryScreen({super.key});

  @override
  State<LaboratoryScreen> createState() => _LaboratoryScreenState();
}

class _LaboratoryScreenState extends State<LaboratoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => AuthViewModel(),
        onViewModelReady: (model) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            model.getAllLabTech(context);
          });
        },
        disposeViewModel: false,
        builder: (_, AuthViewModel model, __) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 20.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      text: 'Laboratories',
                      textStyle: GoogleFonts.gabarito(
                        color: AppColor.black,
                        fontSize: 20.0.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 24.w, height: 24.w),
                  ],
                ),
                SizedBox(height: 20.h),
                Column(
                  children: [
                    TextFormWidget(
                      label: 'Search here',
                      border: 10,
                      isFilled: true,
                      fillColor: AppColor.transparent,
                      prefixWidget: Padding(
                        padding: EdgeInsets.all(14.w),
                        child: SvgPicture.asset(AppImage.search),
                      ),
                      suffixWidget: Padding(
                        padding: EdgeInsets.all(14.w),
                        child: SvgPicture.asset(AppImage.filter),
                      ),
                      onChange: (p0) {
                        model.queryLab = p0;
                        model.notifyListeners();
                      },
                    ),
                    SizedBox(height: 10.h),

                    Align(
                      alignment: Alignment.topLeft,
                      child: TextView(
                        text: 'Top-Rated Health Care Experts',
                        textAlign: TextAlign.start,
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.primary1,
                          fontSize: 18.20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 550.h,
                      child:
                          model.isLoadingAllLabTech
                              ? GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      crossAxisCount: 2,
                                      mainAxisExtent: 220, // Number of columns
                                    ),
                                itemBuilder: (context, index) {
                                  return shimmerView();
                                },
                                itemCount: 10,
                              )
                              : GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      crossAxisCount: 2,
                                      mainAxisExtent:
                                          Platform.isIOS
                                              ? 230
                                              : 200, // Number of columns
                                    ),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap:
                                        () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder:
                                                (
                                                  context,
                                                ) => LaboratoryDetailScreen(
                                                  getAllLabTechResponseModel:
                                                      model
                                                          .getAllLabTechResponseModelList!
                                                          .getAllLabTechResponseModelList![index],
                                                ),
                                          ),
                                        ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: AppColor.funnyLookingGrey
                                              .withOpacity(.3),
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                const BorderRadius.vertical(
                                                  top: Radius.circular(10),
                                                ),
                                            child: Image.network(
                                              model
                                                      .getAllLabTechResponseModelList!
                                                      .getAllLabTechResponseModelList![index]
                                                      .profileImage ??
                                                  '',
                                              height: 110.h,
                                              width: double.infinity,
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (
                                                    context,
                                                    error,
                                                    stackTrace,
                                                  ) => shimmerViewPharm(),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8.w),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                SizedBox(
                                                  width: 120.w,
                                                  child: TextView(
                                                    text:
                                                        'Dr ${model.getAllLabTechResponseModelList!.getAllLabTechResponseModelList![index].firstName?.capitalize() ?? ''} ${model.getAllLabTechResponseModelList!.getAllLabTechResponseModelList![index].lastName?.capitalize() ?? ''}',
                                                    maxLines: 1,
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    textStyle:
                                                        GoogleFonts.gabarito(
                                                          color:
                                                              AppColor
                                                                  .darkindgrey,
                                                          fontSize: 16.0.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 120.w,
                                                  child: TextView(
                                                    text:
                                                        '${model.getAllLabTechResponseModelList!.getAllLabTechResponseModelList![index].businessName ?? ''}'
                                                            .capitalize(),
                                                    maxLines: 1,
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    textStyle:
                                                        GoogleFonts.gabarito(
                                                          color: AppColor.grey,
                                                          fontSize: 12.0.sp,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                  ),
                                                ),
                                                SizedBox(height: 14.0.h),
                                                Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                            vertical: 1.w,
                                                            horizontal: 4.w,
                                                          ),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              4,
                                                            ),
                                                        color: AppColor.primary,
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                                AppColor.white,
                                                            size: 15.0.sp,
                                                          ),
                                                          SizedBox(width: 2.w),
                                                          TextView(
                                                            text: '4.8',
                                                            textStyle:
                                                                GoogleFonts.dmSans(
                                                                  color:
                                                                      AppColor
                                                                          .white,
                                                                  fontSize:
                                                                      12.0.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(width: 20.h),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                itemCount:
                                    model.getAllLabTechResponseModelList != null
                                        ? model
                                            .getAllLabTechResponseModelList!
                                            .getAllLabTechResponseModelList!
                                            .length
                                        : 0, // Number of items in the grid
                              ),
                    ),
                  ],
                ),
                SizedBox(height: 40.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
