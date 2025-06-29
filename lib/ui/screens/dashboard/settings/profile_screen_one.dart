// ignore_for_file: must_be_immutable, deprecated_member_use
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
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
  ProfileScreen1({super.key, required this.id});
  String? id;
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
          model.getSpecificPharmacist(context, widget.id);
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.r),
                      child: Image.network(
                        model
                                .getPharmacyDetailResponseModel
                                ?.original
                                ?.profileImage ??
                            '',
                        height: 156.h,
                        width: 120.w,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) => shimmerViewDoc(),
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            text:
                                'Dr ${model.getPharmacyDetailResponseModel?.original?.firstName ?? ''} ${model.getPharmacyDetailResponseModel?.original?.lastName ?? ''}',
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.black,
                              fontSize: 20.0.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          TextView(
                            text: 'Pharmacist',
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
                SizedBox(height: 20.w),
                TextView(
                  text: 'About',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20.w),
                !isTapped
                    ? Wrap(
                      children: [
                        SizedBox(
                          width: 350.w,
                          child: TextView(
                            text:
                                model
                                    .getPharmacyDetailResponseModel
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
                    )
                    : Wrap(
                      children: [
                        SizedBox(
                          child: TextView(
                            text:
                                model
                                    .getPharmacyDetailResponseModel
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
                SizedBox(height: 20.w),
                // TextView(
                //   text: 'Time Availability',
                //   textStyle: GoogleFonts.gabarito(
                //     color: AppColor.black,
                //     fontSize: 16.0.sp,
                //     fontWeight: FontWeight.w500,
                //   ),
                // ),
                // SizedBox(height: 10.w),
                // TextView(
                //   text: 'Mon - Sat : 10:00 am - 5:00 pm',
                //   textStyle: GoogleFonts.gabarito(
                //     color: AppColor.grey1,
                //     fontSize: 14.20.sp,
                //     fontWeight: FontWeight.w400,
                //   ),
                // ),
                // SizedBox(height: 20.w),
                TextView(
                  text: 'Certification',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20.w),
                Row(
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
                                .getPharmacyDetailResponseModel
                                ?.original
                                ?.certifications ??
                            '',
                        shrinkWrap: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.w),
                TextView(
                  text: 'Location',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20.w),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      AppImage.location,
                      height: 22.h,
                      width: 22.w,
                    ),
                    SizedBox(width: 16.20.w),
                    TextView(
                      text:
                          '${model.getPharmacyDetailResponseModel?.original?.address ?? ''}, ${model.getPharmacyDetailResponseModel?.original?.city ?? ''}, ${model.getPharmacyDetailResponseModel?.original?.state ?? ''}.',
                      textStyle: GoogleFonts.gabarito(
                        color: AppColor.black,
                        fontSize: 14.60.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.0.w),
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
                  // controller: fullnameTextController,
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
                  height: 270.h,
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
                                                textStyle: GoogleFonts.gabarito(
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
                SizedBox(height: 40.h),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     GestureDetector(
                //       onTap:
                //           () => Navigator.of(context).push(
                //             MaterialPageRoute(
                //               builder:
                //                   (context) => ConsultationScreen(
                //                     bookTyoe: 'book',
                //                     slotId: AvailableSlots(),
                //                     docId: widget.id,
                //                     doctor:
                //                         '${model.getDocDetailResponseModel?.original?.firstName ?? ''} ${model.getDocDetailResponseModel?.original?.lastName ?? ''}',
                //                   ),
                //             ),
                //           ),
                //       child: Container(
                //         padding: EdgeInsets.symmetric(
                //           vertical: 7.2.w,
                //           horizontal: 14.0.w,
                //         ),
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10),
                //           color: AppColor.primary1,
                //         ),
                //         child: TextView(
                //           text: 'Book Appointment',
                //           textStyle: GoogleFonts.gabarito(
                //             color: AppColor.white,
                //             fontSize: 14.0.sp,
                //             fontWeight: FontWeight.w600,
                //           ),
                //         ),
                //       ),
                //     ),
                //     GestureDetector(
                //       onTap:
                //           () => Navigator.of(context).push(
                //             MaterialPageRoute(
                //               builder:
                //                   (context) => ConsultationScreen(
                //                     bookTyoe: 'book-friend',

                //                     slotId: AvailableSlots(),
                //                     docId: widget.id,
                //                     doctor:
                //                         '${model.getDocDetailResponseModel?.original?.firstName ?? ''} ${model.getDocDetailResponseModel?.original?.lastName ?? ''}',
                //                   ),
                //             ),
                //           ),
                //       child: Container(
                //         padding: EdgeInsets.symmetric(
                //           vertical: 7.2.w,
                //           horizontal: 14.0.w,
                //         ),
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10),
                //           color: const Color.fromARGB(255, 181, 222, 204),
                //         ),
                //         child: TextView(
                //           text: 'Book for Someone else',
                //           textStyle: GoogleFonts.gabarito(
                //             color: AppColor.darkindgrey,
                //             fontSize: 14.0.sp,
                //             fontWeight: FontWeight.w600,
                //           ),
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                SizedBox(height: 60.h),
              ],
            ),
          ),
        );
      },
    );
  }
}
