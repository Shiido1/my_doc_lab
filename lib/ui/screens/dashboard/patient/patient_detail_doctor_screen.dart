import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:doc_lab_pharm/core/core_folder/app/app.router.dart';
import 'package:doc_lab_pharm/ui/app_assets/app_color.dart';
import 'package:doc_lab_pharm/ui/app_assets/app_image.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/view_model/doc_view_model.dart';
import '../../../../main.dart';
import '../../../app_assets/constant.dart';
import '../../../widget/text_widget.dart';

// ignore: must_be_immutable
class PatientDetailDoctorScreen extends StatefulWidget {
  PatientDetailDoctorScreen({super.key, this.id});
  String? id;

  @override
  State<PatientDetailDoctorScreen> createState() =>
      _PatientDetailDoctorScreenState();
}

class _PatientDetailDoctorScreenState extends State<PatientDetailDoctorScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DocViewModel>.reactive(
      viewModelBuilder: () => DocViewModel(),
      onViewModelReady: (model) async {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          model.getUserDetail(context, id: widget.id);

          model.getDoctorsNote(context, id: widget.id);
        });
      },
      disposeViewModel: false,
      builder: (_, DocViewModel model, __) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Row(
                  children: [
                    model.getUserResponseModel?.data?.profileImage != null
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
                              size: const Size.fromRadius(50),
                              child: Image.network(
                                model.getUserResponseModel?.data!.profileImage!
                                        .contains('https')
                                    ? '${model.getUserResponseModel?.data?.profileImage}'
                                    : 'https://res.cloudinary.com/dnv6yelbr/image/upload/v1747827538/${model.getUserResponseModel?.data?.profileImage}',
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (context, error, stackTrace) =>
                                        shimmerViewPharm(),
                              ),
                            ),
                          ),
                        )
                        : Container(
                          padding: EdgeInsets.all(48.8.w),
                          decoration: BoxDecoration(
                            color: AppColor.oneKindgrey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                    SizedBox(width: 20.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text:
                              '${model.getUserResponseModel?.data?.firstName?.capitalize() ?? ''} ${model.getUserResponseModel?.data?.lastName?.capitalize() ?? ''}',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.darkindgrey,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 4.w),
                        TextView(
                          text:
                              'Account Id: ${model.getUserResponseModel?.data?.accountId ?? ''}',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.greyIt,
                            fontSize: 16.3.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10.w),
                        GestureDetector(
                          onTap:
                              () => navigate.navigateTo(
                                Routes.doctorChatScreen,
                                arguments: DoctorChatScreenArguments(
                                  id: '',
                                  messageModel: null,
                                  app: null,
                                  sender: null,
                                  data: model.getUserResponseModel!.data!,
                                ),
                              ),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 4.w,
                              horizontal: 8.w,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(color: AppColor.darkindgrey),
                            ),
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                  AppImage.chat,
                                  height: 14.h,
                                  width: 14.w,
                                  color: AppColor.darkindgrey,
                                ),
                                SizedBox(width: 4.w),
                                TextView(
                                  text: 'Message',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.darkindgrey,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
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
                SizedBox(height: 10.w),
                Divider(color: AppColor.greyIt, thickness: 1),
                SizedBox(height: 30.h),
                if (model.getUserResponseModel != null)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 4.w,
                              horizontal: 8.w,
                            ),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppColor.grey),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'Contact Information',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.darkindgrey,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    TextView(
                                      text: 'Status:',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.darkindgrey,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Spacer(),
                                    SizedBox(
                                      width: 240.w,
                                      child: TextView(
                                        text:
                                            model
                                                .getUserResponseModel
                                                ?.data
                                                ?.status
                                                ?.capitalize() ??
                                            '',
                                        maxLines: 4,
                                        textAlign: TextAlign.end,
                                        textStyle: GoogleFonts.gabarito(
                                          color: AppColor.darkindgrey,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 6.h),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    TextView(
                                      text: 'Address:',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.darkindgrey,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Spacer(),
                                    SizedBox(
                                      width: 200.w,
                                      child: TextView(
                                        text:
                                            '${model.getUserResponseModel?.data?.address?.capitalize() ?? ''} ${model.getUserResponseModel?.data?.address?.capitalize() ?? ''} ${model.getUserResponseModel?.data?.state?.capitalize() ?? ''}',
                                        maxLines: 4,
                                        textAlign: TextAlign.end,
                                        textStyle: GoogleFonts.gabarito(
                                          color: AppColor.darkindgrey,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 10.h),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,

                                  children: [
                                    TextView(
                                      text: 'Type:',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.darkindgrey,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Spacer(),
                                    SizedBox(
                                      width: 200.w,
                                      child: TextView(
                                        text: 'Patient',
                                        maxLines: 4,
                                        textAlign: TextAlign.end,
                                        textStyle: GoogleFonts.gabarito(
                                          color: AppColor.darkindgrey,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 30.h),
                          if (model.getDoctorsNoteModel != null &&
                              model.getDoctorsNoteModel!.notes!.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text: 'Doctor\'s Overview',
                                  textStyle: GoogleFonts.gabarito(
                                    color: const Color.fromARGB(255, 8, 27, 31),
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                ...model.getDoctorsNoteModel!.notes!.map(
                                  (n) => Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextView(
                                        text:
                                            'Dr. ${n.author?.firstName?.capitalize()} ${n.author?.lastName?.capitalize()}',
                                        textStyle: GoogleFonts.gabarito(
                                          color: AppColor.darkindgrey,
                                          fontSize: 18.8.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      SizedBox(height: 16.0.h),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.w),
                                        child: TextView(
                                          text: model.getAllDoctorsNotes(n),
                                          textStyle: GoogleFonts.gabarito(
                                            color: AppColor.black,
                                            fontSize: 15.4.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 12.0.h),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 6.0.h),
                              ],
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
