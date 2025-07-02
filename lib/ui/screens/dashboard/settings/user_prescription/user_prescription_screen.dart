// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_doc_lab/ui/app_assets/constant.dart';
import 'package:stacked/stacked.dart';
import '../../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../../core/core_folder/app/app.locator.dart';
import '../../../../../core/core_folder/app/app.router.dart';
import '../../../../../main.dart';
import '../../../../app_assets/app_color.dart';
import '../../../../app_assets/app_image.dart';
import '../../../../widget/text_form_widget.dart';
import '../../../../widget/text_widget.dart';

class UserPrescriptionScreen extends StatelessWidget {
  const UserPrescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => locator<AuthViewModel>(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          model.viewDoctorsPrescription(context);
        });
      },
      disposeViewModel: false,
      builder: (_, AuthViewModel model, __) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 50.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                TextView(
                  text: 'Prescriptions',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.darkindgrey,
                    fontSize: 22.40.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Divider(color: AppColor.greylight, thickness: 1),
                SizedBox(height: 16.20.h),
                TextFormWidget(
                  label: 'Search prescriptions',
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
                if (model.isLoading)
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * .66,
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 20.w,
                        horizontal: 20.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.primary1.withOpacity(.24),
                      ),
                      child: RefreshIndicator(
                        onRefresh: model.viewDoctorsPrescriptionReload,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ...List.generate(10, (i) => shimmerPresView()),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                else
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * .66,
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        vertical: 20.w,
                        horizontal: 20.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.primary1.withOpacity(.24),
                      ),
                      child: RefreshIndicator(
                        onRefresh: model.viewDoctorsPrescriptionReload,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // if (model.isLoading)
                              //   ...List.generate(10, (i) => shimmerPresView())
                              // else
                              if (model.viewDoctorsPrescriptionModel != null &&
                                  model
                                      .viewDoctorsPrescriptionModel!
                                      .viewDoctorsPrescriptionModelList!
                                      .isEmpty)
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                    vertical: 20.w,
                                    horizontal: 20.w,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.white,
                                  ),
                                  child: Center(
                                    child: TextView(
                                      text: 'No Prescriptions',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.darkindgrey,
                                        fontSize: 16.10.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                )
                              else if (model.viewDoctorsPrescriptionModel !=
                                      null &&
                                  model
                                      .viewDoctorsPrescriptionModel!
                                      .viewDoctorsPrescriptionModelList!
                                      .isNotEmpty)
                                if (model.query != '')
                                  ...model
                                      .viewDoctorsPrescriptionModel!
                                      .viewDoctorsPrescriptionModelList!
                                      .reversed
                                      .where(
                                        (w) =>
                                            w.doctor!.firstName!
                                                .toLowerCase()
                                                .contains(
                                                  model.query.toLowerCase(),
                                                ) ||
                                            w.doctor!.lastName!
                                                .toLowerCase()
                                                .contains(
                                                  model.query.toLowerCase(),
                                                ),
                                      )
                                      .map(
                                        (o) => GestureDetector(
                                          onTap:
                                              () => navigate.navigateTo(
                                                Routes
                                                    .userPrescriptionDetailScreen,
                                                arguments:
                                                    UserPrescriptionDetailScreenArguments(
                                                      view: o,
                                                    ),
                                              ),
                                          child: Container(
                                            width: double.infinity,
                                            margin: EdgeInsets.only(
                                              bottom: 10.w,
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              vertical: 10.w,
                                              horizontal: 12.20.w,
                                            ),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: AppColor.white,
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                o.doctor?.profileImage != null
                                                    ? Padding(
                                                      padding: EdgeInsets.only(
                                                        top: 10.w,
                                                      ),
                                                      child: ClipOval(
                                                        child: SizedBox.fromSize(
                                                          size:
                                                              const Size.fromRadius(
                                                                24,
                                                              ),
                                                          child: Image.network(
                                                            o
                                                                    .doctor!
                                                                    .profileImage!
                                                                    .contains(
                                                                      'https',
                                                                    )
                                                                ? '${o.doctor?.profileImage}'
                                                                : 'https://res.cloudinary.com/dnv6yelbr/image/upload/v1747827538/${o.doctor?.profileImage}',
                                                            fit: BoxFit.cover,
                                                            errorBuilder:
                                                                (
                                                                  context,
                                                                  error,
                                                                  stackTrace,
                                                                ) =>
                                                                    shimmerViewPharm(),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                    : Container(
                                                      padding: EdgeInsets.all(
                                                        22.w,
                                                      ),
                                                      margin: EdgeInsets.only(
                                                        top: 10.w,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color:
                                                            AppColor
                                                                .oneKindgrey,
                                                      ),
                                                    ),
                                                SizedBox(width: 10.w),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 130.w,
                                                      child: TextView(
                                                        text:
                                                            '${o.doctor?.firstName?.capitalize() ?? ''} ${o.doctor?.lastName?.capitalize() ?? ''}',
                                                        maxLines: 1,
                                                        textOverflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                        textStyle:
                                                            GoogleFonts.gabarito(
                                                              color:
                                                                  AppColor
                                                                      .darkindgrey,
                                                              fontSize:
                                                                  15.20.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 4.2.h),
                                                    SizedBox(
                                                      width: 130.w,
                                                      child: TextView(
                                                        text:
                                                            o.drugs!.isNotEmpty
                                                                ? '${o.drugs![0].medicine?.name ?? ''}.${o.drugs![0].medicine?.volume ?? ''}'
                                                                : 'No Drug',
                                                        maxLines: 3,
                                                        textOverflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                        textStyle:
                                                            GoogleFonts.gabarito(
                                                              color:
                                                                  AppColor.grey,
                                                              fontSize: 12.0.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 4.2.h),

                                                    o.drugs!.isEmpty
                                                        ? SizedBox.shrink()
                                                        : SizedBox(
                                                          width: 130.w,
                                                          child: TextView(
                                                            text:
                                                                o
                                                                    .drugs![0]
                                                                    .dosage ??
                                                                '',

                                                            maxLines: 3,
                                                            textOverflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            textStyle:
                                                                GoogleFonts.gabarito(
                                                                  color:
                                                                      AppColor
                                                                          .grey,
                                                                  fontSize:
                                                                      12.0.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                ),
                                                          ),
                                                        ),
                                                    SizedBox(height: 4.2.h),
                                                    TextView(
                                                      text: DateFormat(
                                                        'MMM dd, yyyy',
                                                      ).format(
                                                        DateTime.parse(
                                                          o.updatedAt
                                                              .toString(),
                                                        ).toLocal(),
                                                      ),
                                                      textStyle:
                                                          GoogleFonts.gabarito(
                                                            color:
                                                                AppColor
                                                                    .darkindgrey,
                                                            fontSize: 12.0.sp,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                                Spacer(),
                                                TextView(
                                                  text:
                                                      '${o.status?.capitalize()}',
                                                  textStyle:
                                                      GoogleFonts.gabarito(
                                                        color:
                                                            AppColor
                                                                .darkindgrey,
                                                        fontSize: 12.40.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                else
                                  ...model.viewDoctorsPrescriptionModel!.viewDoctorsPrescriptionModelList!.reversed.map(
                                    (o) => GestureDetector(
                                      onTap:
                                          () => navigate.navigateTo(
                                            Routes.userPrescriptionDetailScreen,
                                            arguments:
                                                UserPrescriptionDetailScreenArguments(
                                                  view: o,
                                                ),
                                          ),
                                      child: Container(
                                        width: double.infinity,
                                        margin: EdgeInsets.only(bottom: 10.w),
                                        padding: EdgeInsets.symmetric(
                                          vertical: 10.w,
                                          horizontal: 12.20.w,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          color: AppColor.white,
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            o.doctor?.profileImage != null
                                                ? Padding(
                                                  padding: EdgeInsets.only(
                                                    top: 10.w,
                                                  ),
                                                  child: ClipOval(
                                                    child: SizedBox.fromSize(
                                                      size:
                                                          const Size.fromRadius(
                                                            24,
                                                          ),
                                                      child: Image.network(
                                                        o.doctor!.profileImage!
                                                                .contains(
                                                                  'https',
                                                                )
                                                            ? '${o.doctor?.profileImage}'
                                                            : 'https://res.cloudinary.com/dnv6yelbr/image/upload/v1747827538/${o.doctor?.profileImage}',
                                                        fit: BoxFit.cover,
                                                        errorBuilder:
                                                            (
                                                              context,
                                                              error,
                                                              stackTrace,
                                                            ) =>
                                                                shimmerViewPharm(),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                                : Container(
                                                  padding: EdgeInsets.all(22.w),
                                                  margin: EdgeInsets.only(
                                                    top: 10.w,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: AppColor.oneKindgrey,
                                                  ),
                                                ),
                                            SizedBox(width: 10.w),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: 130.w,
                                                  child: TextView(
                                                    text:
                                                        '${o.doctor?.firstName?.capitalize() ?? ''} ${o.doctor?.lastName?.capitalize() ?? ''}',
                                                    maxLines: 1,
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    textStyle:
                                                        GoogleFonts.gabarito(
                                                          color:
                                                              AppColor
                                                                  .darkindgrey,
                                                          fontSize: 15.20.sp,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                                SizedBox(height: 4.2.h),
                                                SizedBox(
                                                  width: 130.w,
                                                  child: TextView(
                                                    text:
                                                        o.drugs!.isNotEmpty
                                                            ? '${o.drugs![0].medicine?.name ?? ''}.${o.drugs![0].medicine?.volume ?? ''}'
                                                            : 'No Drug',
                                                    maxLines: 3,
                                                    textOverflow:
                                                        TextOverflow.ellipsis,
                                                    textStyle:
                                                        GoogleFonts.gabarito(
                                                          color: AppColor.grey,
                                                          fontSize: 12.0.sp,
                                                          fontWeight:
                                                              FontWeight.w300,
                                                        ),
                                                  ),
                                                ),
                                                SizedBox(height: 4.2.h),

                                                o.drugs!.isEmpty
                                                    ? SizedBox.shrink()
                                                    : SizedBox(
                                                      width: 130.w,
                                                      child: TextView(
                                                        text:
                                                            o
                                                                .drugs![0]
                                                                .dosage ??
                                                            '',

                                                        maxLines: 3,
                                                        textOverflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                        textStyle:
                                                            GoogleFonts.gabarito(
                                                              color:
                                                                  AppColor.grey,
                                                              fontSize: 12.0.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                      ),
                                                    ),
                                                SizedBox(height: 4.2.h),
                                                TextView(
                                                  text: DateFormat(
                                                    'MMM dd, yyyy',
                                                  ).format(
                                                    DateTime.parse(
                                                      o.updatedAt.toString(),
                                                    ).toLocal(),
                                                  ),
                                                  textStyle:
                                                      GoogleFonts.gabarito(
                                                        color:
                                                            AppColor
                                                                .darkindgrey,
                                                        fontSize: 12.0.sp,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            TextView(
                                              text: '${o.status?.capitalize()}',
                                              textStyle: GoogleFonts.gabarito(
                                                color: AppColor.darkindgrey,
                                                fontSize: 12.40.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),

                                            // Column(
                                            //   mainAxisAlignment:
                                            //       MainAxisAlignment.end,
                                            //   children: [
                                            //     SizedBox(height: 10.h),
                                            //     PopupMenuButton<String>(
                                            //       onSelected: (String item) {
                                            //         // Handle the selected menu item
                                            //       },
                                            //       itemBuilder: (
                                            //         BuildContext context,
                                            //       ) {
                                            //         return [
                                            //           PopupMenuItem<String>(
                                            //             value: 'add',
                                            //             child: TextView(
                                            //               text: 'Add Prescription',
                                            //               textStyle:
                                            //                   GoogleFonts.gabarito(
                                            //                     color:
                                            //                         AppColor
                                            //                             .darkindgrey,
                                            //                     fontSize: 12.40.sp,
                                            //                     fontWeight:
                                            //                         FontWeight.w600,
                                            //                   ),
                                            //             ),
                                            //             onTap:
                                            //                 () => model
                                            //                     .modalBottomSheetAddMedsPrescription(
                                            //                       context,
                                            //                       id: o.id.toString(),
                                            //                     ),
                                            //           ),
                                            //           PopupMenuItem<String>(
                                            //             value: 'view',
                                            //             child: TextView(
                                            //               text: 'View Prescription',
                                            //               textStyle:
                                            //                   GoogleFonts.gabarito(
                                            //                     color:
                                            //                         AppColor
                                            //                             .darkindgrey,
                                            //                     fontSize: 12.40.sp,
                                            //                     fontWeight:
                                            //                         FontWeight.w600,
                                            //                   ),
                                            //             ),
                                            //             onTap:
                                            //                 () => navigate.navigateTo(
                                            //                   Routes
                                            //                       .prescriptionDetailScreen,
                                            //                   arguments:
                                            //                       PrescriptionDetailScreenArguments(
                                            //                         id:
                                            //                             o.id.toString(),
                                            //                       ),
                                            //                 ),
                                            //           ),
                                            //         ];
                                            //       },
                                            //       child: Icon(
                                            //         Icons.more_vert,
                                            //       ), // Optional: Customize the button's icon
                                            //     ),
                                            //     SizedBox(height: 20.h),
                                            //     TextView(
                                            //       text: '${o.status?.capitalize()}',
                                            //       textStyle: GoogleFonts.gabarito(
                                            //         color: AppColor.darkindgrey,
                                            //         fontSize: 12.40.sp,
                                            //         fontWeight: FontWeight.w500,
                                            //       ),
                                            //     ),
                                            //   ],
                                            // ),
                                          ],
                                        ),
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
