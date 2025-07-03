// ignore_for_file: must_be_immutable, deprecated_member_use
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/widget/text_form_widget.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/model/search_doctor_entity_model.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../app_assets/app_image.dart';
import '../../../app_assets/constant.dart';
import '../../../widget/text_widget.dart';
import 'med_profile_screen.dart';

class ProfileScreen1 extends StatefulWidget {
  ProfileScreen1({super.key});
  @override
  State<ProfileScreen1> createState() => _ProfileScreen1State();
}

class _ProfileScreen1State extends State<ProfileScreen1> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    final double? mainAxisExtent = isTablet ? null : 220.h;
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => locator<AuthViewModel>(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          model.getAllMedicine(context);
        });
      },
      disposeViewModel: false,
      builder: (_, AuthViewModel model, __) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                Divider(color: AppColor.grey, thickness: .3),
                TextView(
                  text: 'Medicine',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4.0.w),
                TextFormWidget(
                  label: 'Search for Medicine',
                  // hint: 'Email Address',
                  border: 10,
                  isFilled: true,
                  fillColor: AppColor.transparent,
                  prefixWidget: Padding(
                    padding: EdgeInsets.all(14.w),
                    child: SvgPicture.asset(AppImage.search),
                  ),

                  onChange: (p0) {
                    if (p0.length > 1) {
                      model.debouncer.run(() {
                        model.getSearchedMed(
                          context,
                          searchEntity: SearchDoctorEntityModel(query: p0),
                        );
                      });
                    }
                    model.queryMed = p0;
                    model.notifyListeners();
                  },
                ),
                SizedBox(height: 10.w),
                TextView(
                  text: 'Service',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .64,
                  child:
                      model.isLoading
                          ? GridView.builder(
                            padding: EdgeInsets.only(top: 14.w),
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
                            padding: EdgeInsets.only(top: 16.w),
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
                            itemCount:
                                model.queryMed == '' &&
                                        model.getAllMedicineResponseModelList !=
                                            null
                                    ? model
                                        .getAllMedicineResponseModelList!
                                        .getAllMedicineResponseModelList!
                                        .length
                                    : model.searchedMedResponseModelList != null
                                    ? model
                                        .searchedMedResponseModelList!
                                        .searchedMedicineResponseModelList!
                                        .length
                                    : 0,
                            itemBuilder: (context, index) {
                              // Build each grid item based on the index
                              return GestureDetector(
                                onTap:
                                    () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder:
                                            (context) => MedProfileScreen(
                                              id:
                                                  model.queryMed != '' &&
                                                          model.searchedMedResponseModelList !=
                                                              null &&
                                                          model
                                                              .searchedMedResponseModelList!
                                                              .searchedMedicineResponseModelList!
                                                              .isNotEmpty
                                                      ? model
                                                          .searchedMedResponseModelList!
                                                          .searchedMedicineResponseModelList![index]
                                                          .id
                                                          .toString()
                                                      : model
                                                          .getAllMedicineResponseModelList!
                                                          .getAllMedicineResponseModelList![index]
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
                                        child: Image.asset(
                                          AppImage.medicine,
                                          height: 130.h,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
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
                                              width: 150.w,
                                              child: TextView(
                                                text:
                                                    model.queryMed != '' &&
                                                            model.searchedMedResponseModelList !=
                                                                null &&
                                                            model
                                                                .searchedMedResponseModelList!
                                                                .searchedMedicineResponseModelList!
                                                                .isNotEmpty
                                                        ? model
                                                                .searchedMedResponseModelList!
                                                                .searchedMedicineResponseModelList![index]
                                                                .name ??
                                                            ''
                                                        : model.getAllMedicineResponseModelList !=
                                                            null
                                                        ? model
                                                                .getAllMedicineResponseModelList!
                                                                .getAllMedicineResponseModelList![index]
                                                                .name ??
                                                            ''
                                                        : '',
                                                textStyle: GoogleFonts.gabarito(
                                                  color: AppColor.darkindgrey,
                                                  fontSize: 16.0.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),

                                                maxLines: 1,
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 120.w,
                                              child: TextView(
                                                text:
                                                    model.queryMed != '' &&
                                                            model.searchedMedResponseModelList !=
                                                                null &&
                                                            model
                                                                .searchedMedResponseModelList!
                                                                .searchedMedicineResponseModelList!
                                                                .isNotEmpty
                                                        ? model
                                                                .searchedMedResponseModelList!
                                                                .searchedMedicineResponseModelList![index]
                                                                .volume ??
                                                            ''
                                                        : model.getAllMedicineResponseModelList !=
                                                            null
                                                        ? model
                                                                .getAllMedicineResponseModelList!
                                                                .getAllMedicineResponseModelList![index]
                                                                .volume ??
                                                            ''
                                                        : '',
                                                textStyle: GoogleFonts.gabarito(
                                                  color: AppColor.darkindgrey,
                                                  fontSize: 14.90.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),

                                                maxLines: 1,
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 100.w,
                                              child: TextView(
                                                text:
                                                    model.queryMed != '' &&
                                                            model.searchedMedResponseModelList !=
                                                                null &&
                                                            model
                                                                .searchedMedResponseModelList!
                                                                .searchedMedicineResponseModelList!
                                                                .isNotEmpty
                                                        ? '${getCurrency()}${oCcy.format(double.parse('${model.searchedMedResponseModelList!.searchedMedicineResponseModelList![index].price}'))}'
                                                        : model.getAllMedicineResponseModelList !=
                                                            null
                                                        ? '${getCurrency()}${oCcy.format(double.parse('${model.getAllMedicineResponseModelList!.getAllMedicineResponseModelList![index].price}'))}'
                                                        : '',
                                                textStyle: TextStyle(
                                                  color: AppColor.darkindgrey,
                                                  fontSize: 15.0.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                maxLines: 1,
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
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
}
