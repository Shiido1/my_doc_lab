import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/constant.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/view_model/doc_view_model.dart';
import '../../../app_assets/app_image.dart';
import '../../../widget/text_form_widget.dart';
import '../../../widget/text_widget.dart';
import 'patient_detail_doctor_screen.dart';

class PatientSceen extends StatelessWidget {
  const PatientSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DocViewModel>.reactive(
      viewModelBuilder: () => DocViewModel(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          model.hasLoadedIndexConversation = false;
          model.getPatientsList();
        });
      },
      disposeViewModel: false,
      onDispose: (viewModel) {
        viewModel.hasLoadedIndexConversation = false;
      },
      builder: (_, DocViewModel model, __) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: SingleChildScrollView(
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
                  label: 'Search for Patients',
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
                    model.queryPatient = p0;
                    model.notifyListeners();
                  },
                ),
                SizedBox(height: 30.h),
                if (model.docPatientListResponseModelList != null &&
                    model
                        .docPatientListResponseModelList!
                        .docPatientListResponseModelList!
                        .isEmpty)
                  TextView(
                    text: 'No Patient',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.darkindgrey,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                if (model.docPatientListResponseModelList != null &&
                    model
                        .docPatientListResponseModelList!
                        .docPatientListResponseModelList!
                        .isNotEmpty)
                  if (model.queryPatient != '')
                    ...model
                        .docPatientListResponseModelList!
                        .docPatientListResponseModelList!
                        .where(
                          (o) =>
                              o.user!.firstName!.toLowerCase().contains(
                                model.queryPatient,
                              ) ||
                              o.user!.lastName!.toLowerCase().contains(
                                model.queryPatient,
                              ),
                        )
                        .map(
                          (i) => GestureDetector(
                            onTap:
                                () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder:
                                        (context) => PatientDetailDoctorScreen(
                                          id: i.user?.id,
                                        ),
                                  ),
                                ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 8.w,
                                horizontal: 8.w,
                              ),
                              margin: EdgeInsets.only(bottom: 14.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: AppColor.oneKindgrey),
                              ),
                              child: Row(
                                children: [
                                  i.user?.profileImage != null
                                      ? Container(
                                        decoration: BoxDecoration(
                                          color: AppColor.oneKindgrey,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ), // Outer container radius
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ), // Apply to the image as well
                                          child: SizedBox.fromSize(
                                            size: const Size.fromRadius(40),
                                            child: Image.network(
                                              i.user!.profileImage!.contains(
                                                    'https',
                                                  )
                                                  ? '${i.user?.profileImage}'
                                                  : 'https://res.cloudinary.com/dnv6yelbr/image/upload/v1747827538/${i.user?.profileImage}',
                                              fit: BoxFit.cover,
                                              errorBuilder:
                                                  (
                                                    context,
                                                    error,
                                                    stackTrace,
                                                  ) => shimmerViewPharm(),
                                            ),
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
                                      TextView(
                                        text:
                                            '${i.user?.firstName?.capitalize()} ${i.user?.lastName?.capitalize()}',
                                        textStyle: GoogleFonts.gabarito(
                                          color: AppColor.darkindgrey,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 4.w),
                                      TextView(
                                        text:
                                            '${i.user?.age} years • ${i.user?.gender?.capitalize() ?? ''}',
                                        textStyle: GoogleFonts.gabarito(
                                          color: AppColor.greyIt,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(height: 10.w),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppImage.task,
                                            height: 16.h,
                                            width: 16.w,
                                          ),
                                          SizedBox(width: 6.w),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 2.w,
                                              horizontal: 6.w,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppColor.friendlyPrimary,
                                              borderRadius:
                                                  BorderRadius.circular(22),
                                            ),
                                            child: TextView(
                                              text:
                                                  'Appointment: ${DateFormat('dd/MM/yyyy').format(DateTime.parse(i.slot!.availableDate.toString()).toLocal())}',
                                              textStyle: GoogleFonts.gabarito(
                                                color: AppColor.primary1,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
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
                        .docPatientListResponseModelList!
                        .docPatientListResponseModelList!
                        .map(
                          (i) => GestureDetector(
                            onTap:
                                () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder:
                                        (context) => PatientDetailDoctorScreen(
                                          id: i.user?.id,
                                        ),
                                  ),
                                ),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 8.w,
                                horizontal: 8.w,
                              ),
                              margin: EdgeInsets.only(bottom: 14.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: AppColor.oneKindgrey),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  i.user?.profileImage != null
                                      ? ClipOval(
                                        child: SizedBox.fromSize(
                                          size: const Size.fromRadius(28.6),
                                          child: Image.network(
                                            i.user!.profileImage!.contains(
                                                  'https',
                                                )
                                                ? '${i.user?.profileImage}'
                                                : 'https://res.cloudinary.com/dnv6yelbr/image/upload/v1747827538/${i.user?.profileImage}',
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    shimmerViewPharm(),
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
                                      TextView(
                                        text:
                                            '${i.user?.firstName?.capitalize()} ${i.user?.lastName?.capitalize()}',
                                        textStyle: GoogleFonts.gabarito(
                                          color: AppColor.darkindgrey,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 4.w),
                                      TextView(
                                        text:
                                            '${i.user?.age ?? ''} years • ${i.user?.gender?.capitalize() ?? ''}',
                                        textStyle: GoogleFonts.gabarito(
                                          color: AppColor.greyIt,
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(height: 10.w),
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            AppImage.task,
                                            height: 16.h,
                                            width: 16.w,
                                          ),
                                          SizedBox(width: 6.w),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 2.w,
                                              horizontal: 6.w,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppColor.friendlyPrimary,
                                              borderRadius:
                                                  BorderRadius.circular(22),
                                            ),
                                            child: TextView(
                                              text:
                                                  'Appointment: ${DateFormat('dd/MM/yyyy').format(DateTime.parse(i.slot!.availableDate.toString()).toLocal())}',
                                              textStyle: GoogleFonts.gabarito(
                                                color: AppColor.primary1,
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.w400,
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
        );
      },
    );
  }
}
