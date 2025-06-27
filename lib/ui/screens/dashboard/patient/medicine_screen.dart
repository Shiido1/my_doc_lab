// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/screens/dashboard/settings/profile_screen_one.dart';
import 'package:my_doc_lab/ui/widget/text_form_widget.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/connect_end/model/search_doctor_entity_model.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../app_assets/app_image.dart';
import '../../../app_assets/constant.dart';
import '../../../widget/text_widget.dart';

// ignore: must_be_immutable
class MedicineScreen extends StatefulWidget {
  const MedicineScreen({super.key});

  @override
  State<MedicineScreen> createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    final double? mainAxisExtent = isTablet ? null : 220.h;
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => locator<AuthViewModel>(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          model.getAllPharmacies(context);
        });
      },
      disposeViewModel: false,
      builder: (_, AuthViewModel model, __) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 20.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      text: 'Medicine',
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
                      label: 'Search for Medicine',
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
                        if (p0.length > 1) {
                          model.debouncer.run(() {
                            model.getSearchedPharm(
                              context,
                              searchEntity: SearchDoctorEntityModel(query: p0),
                            );
                          });
                        }
                        model.queryPharm = p0;
                        model.notifyListeners();
                      },
                    ),
                    SizedBox(height: 20.h),

                    Align(
                      alignment: Alignment.topLeft,
                      child: TextView(
                        text: 'Top Pharmacist',
                        textAlign: TextAlign.start,
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.primary1,
                          fontSize: 18.20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 500.h,
                      child:
                          model.isLoading
                              ? GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      crossAxisCount: 2,
                                      mainAxisExtent:
                                          Platform.isIOS
                                              ? mainAxisExtent
                                              : 200, // Number of columns
                                    ),
                                itemBuilder: (context, index) {
                                  // Build each grid item based on the index
                                  return shimmerView();
                                },
                                itemCount: 10, // Number of items in the grid
                              )
                              : GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      crossAxisCount: 2,
                                      mainAxisExtent:
                                          Platform.isIOS
                                              ? mainAxisExtent
                                              : 230, // Number of columns
                                    ),
                                itemBuilder: (context, index) {
                                  // Build each grid item based on the index
                                  return GestureDetector(
                                    onTap:
                                        () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder:
                                                (context) => ProfileScreen1(
                                                  id:
                                                      model.queryPharm != '' &&
                                                              model.searchedPharmResponseModelList !=
                                                                  null &&
                                                              model
                                                                  .searchedPharmResponseModelList!
                                                                  .searchedPharmacyResponseModelList!
                                                                  .isNotEmpty
                                                          ? model
                                                              .searchedPharmResponseModelList!
                                                              .searchedPharmacyResponseModelList![index]
                                                              .id
                                                              .toString()
                                                          : model
                                                              .getAllPharmaciesResponseModelList!
                                                              .getAllPharmaciesResponseModelList![index]
                                                              .id
                                                              .toString(),
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
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            ),
                                            child: Image.network(
                                              model.queryPharm != '' &&
                                                      model.searchedPharmResponseModelList !=
                                                          null &&
                                                      model
                                                          .searchedPharmResponseModelList!
                                                          .searchedPharmacyResponseModelList!
                                                          .isNotEmpty
                                                  ? model
                                                          .searchedPharmResponseModelList!
                                                          .searchedPharmacyResponseModelList![index]
                                                          .profileImage ??
                                                      ''
                                                  : model.getAllPharmaciesResponseModelList !=
                                                      null
                                                  ? model
                                                          .getAllPharmaciesResponseModelList!
                                                          .getAllPharmaciesResponseModelList![index]
                                                          .profileImage ??
                                                      ''
                                                  : '',
                                              height: 120.h,
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
                                                        model.queryPharm !=
                                                                    '' &&
                                                                model.searchedPharmResponseModelList !=
                                                                    null &&
                                                                model
                                                                    .searchedPharmResponseModelList!
                                                                    .searchedPharmacyResponseModelList!
                                                                    .isNotEmpty
                                                            ? 'Dr ${model.searchedPharmResponseModelList!.searchedPharmacyResponseModelList![index].firstName?.capitalize() ?? ''} ${model.searchedPharmResponseModelList!.searchedPharmacyResponseModelList![index].lastName ?? ''}'
                                                            : model.getAllPharmaciesResponseModelList !=
                                                                null
                                                            ? 'Dr ${model.getAllPharmaciesResponseModelList!.getAllPharmaciesResponseModelList![index].firstName ?? ''}'
                                                            : '',
                                                    textStyle:
                                                        GoogleFonts.gabarito(
                                                          color:
                                                              AppColor
                                                                  .darkindgrey,
                                                          fontSize: 16.0.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),

                                                    maxLines: 1,
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                TextView(
                                                  text: 'Pharmacist',
                                                  textStyle:
                                                      GoogleFonts.gabarito(
                                                        color: AppColor.grey,
                                                        fontSize: 12.0.sp,
                                                        fontWeight:
                                                            FontWeight.w400,
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
                                                    // SizedBox(width: 20.h),
                                                    // Row(
                                                    //   children: [
                                                    //     SvgPicture.asset(
                                                    //       AppImage.location,
                                                    //       height: 15.2.h,
                                                    //       width: 16.2.w,
                                                    //     ),
                                                    //     SizedBox(width: 2.w),
                                                    //     TextView(
                                                    //       text: '800m away',
                                                    //       textStyle:
                                                    //           GoogleFonts.gabarito(
                                                    //             color:
                                                    //                 AppColor
                                                    //                     .black,
                                                    //             fontSize:
                                                    //                 12.0.sp,
                                                    //             fontWeight:
                                                    //                 FontWeight
                                                    //                     .w500,
                                                    //           ),
                                                    //     ),
                                                    //   ],
                                                    // ),
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
                                    model.queryPharm == '' &&
                                            model.getAllPharmaciesResponseModelList !=
                                                null
                                        ? model
                                            .getAllPharmaciesResponseModelList!
                                            .getAllPharmaciesResponseModelList!
                                            .length
                                        : model.searchedPharmResponseModelList !=
                                            null
                                        ? model
                                            .searchedPharmResponseModelList!
                                            .searchedPharmacyResponseModelList!
                                            .length
                                        : 0, // Number of items in the grid
                              ),
                    ),
                  ],
                ),
                SizedBox(height: 40.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
