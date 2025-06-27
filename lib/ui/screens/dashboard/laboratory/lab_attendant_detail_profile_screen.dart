// ignore_for_file: must_be_immutable, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_utils.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/model/checkoutentitymodel.dart';
import '../../../../core/connect_end/model/get_all_lab_tech_response_model/get_all_lab_tech_response_model.dart';
import '../../../../core/connect_end/model/get_list_of_lab_diagnosis_model/get_list_of_lab_diagnosis_model.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../main.dart';
import '../../../app_assets/app_image.dart';
import '../../../app_assets/constant.dart';
import '../../../widget/text_widget.dart';

class LaboratoryDetailScreen extends StatefulWidget {
  LaboratoryDetailScreen({super.key, required this.getAllLabTechResponseModel});
  GetAllLabTechResponseModel? getAllLabTechResponseModel;

  @override
  State<LaboratoryDetailScreen> createState() => _LaboratoryDetailScreenState();
}

class _LaboratoryDetailScreenState extends State<LaboratoryDetailScreen> {
  List timeList = [
    '8:00 AM',
    '8:30 AM',
    '9:00 AM',
    '9:30 AM',
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
    '12:00 PM',
    '12:30 PM',
    '1:00 PM',
    '1:30 PM',
    '2:00 PM',
    '2:30 PM',
    '3:00 PM',
    '3:30 PM',
    '4:00 PM',
    '4:30 PM',
    '5:00 PM',
    '5:30 PM',
    '6:00 PM',
  ];
  var t;

  bool isTapped = false;
  List<GetListOfLabDiagnosisModel> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => AuthViewModel(),
        onViewModelReady: (model) {
          model.getAllDiagnosisList(
            context,
            id: widget.getAllLabTechResponseModel?.id.toString(),
          );
        },
        disposeViewModel: false,
        builder: (_, AuthViewModel model, __) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                      child: Image.network(
                        widget.getAllLabTechResponseModel?.profileImage ?? '',
                        height: 140.h,
                        width: 140.w,
                        fit: BoxFit.cover,
                        errorBuilder:
                            (context, error, stackTrace) => shimmerViewPharm(),
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 160.w,
                            child: TextView(
                              text:
                                  'Dr ${widget.getAllLabTechResponseModel?.firstName?.capitalize() ?? ''} ${widget.getAllLabTechResponseModel?.lastName?.capitalize() ?? ''}',
                              maxLines: 1,
                              textOverflow: TextOverflow.ellipsis,
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.black,
                                fontSize: 20.0.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          SizedBox(
                            width: 160.w,
                            child: TextView(
                              text:
                                  '${widget.getAllLabTechResponseModel?.businessName ?? ''}',
                              maxLines: 1,
                              textOverflow: TextOverflow.ellipsis,
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.grey,
                                fontSize: 14.0.sp,
                                fontWeight: FontWeight.w500,
                              ),
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
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                AppImage.location,
                                height: 14.h,
                                width: 14.w,
                              ),
                              SizedBox(width: 4.w),
                              SizedBox(
                                width: 160.w,
                                child: TextView(
                                  text:
                                      '${widget.getAllLabTechResponseModel?.address?.capitalize() ?? ''} ${widget.getAllLabTechResponseModel?.state?.capitalize() ?? ''}, ${widget.getAllLabTechResponseModel?.city?.capitalize() ?? ''}',
                                  maxLines: 4,
                                  textOverflow: TextOverflow.ellipsis,
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.black,
                                    fontSize: 12.0.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
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
                SizedBox(height: 10.w),
                !isTapped
                    ? Wrap(
                      children: [
                        SizedBox(
                          width: 350.w,
                          child: TextView(
                            text:
                                '${widget.getAllLabTechResponseModel?.about?.capitalize() ?? ''}',
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
                                '${widget.getAllLabTechResponseModel?.about?.capitalize() ?? ''}',
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

                SizedBox(height: 10.w),
                TextView(
                  text: 'Certification',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10.w),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8.w),
                      child: SvgPicture.asset(
                        AppImage.gradcap,
                        height: 20.h,
                        width: 20.w,
                      ),
                    ),
                    SizedBox(width: 10.20.w),
                    SizedBox(
                      width: 290.w,
                      child: Html(
                        data:
                            '${widget.getAllLabTechResponseModel?.certifications ?? ''}',
                        shrinkWrap: true,
                        style: {
                          "body": Style(
                            color: Colors.black,
                            fontSize: FontSize(18.0),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Gabarito',
                          ),
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.w),
                TextView(
                  text: 'Experience',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 6.10.w),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 8.w),
                      child: SvgPicture.asset(
                        AppImage.exp,
                        height: 20.h,
                        width: 20.w,
                      ),
                    ),
                    SizedBox(width: 10.20.w),
                    SizedBox(
                      width: 300.w,
                      child: Html(
                        data:
                            '${widget.getAllLabTechResponseModel?.experience ?? ''}',
                        shrinkWrap: true,
                        style: {
                          "body": Style(
                            color: Colors.black,
                            fontSize: FontSize(18.0),
                            fontWeight: FontWeight.w400,
                            fontFamily: 'Gabarito',
                          ),
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => model.openCalendarDialog(context),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 6.w,
                          horizontal: 8.w,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.primary1,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: TextView(
                          text: 'Select Date',
                          textStyle: GoogleFonts.dmSans(
                            color: AppColor.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    model.selectLabDate != ''
                        ? Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 6.w,
                            horizontal: 8.w,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            border: Border.all(color: AppColor.primary1),
                          ),
                          child: TextView(
                            text: model.selectLabDate,
                            textStyle: GoogleFonts.dmSans(
                              color: AppColor.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                        : SizedBox.shrink(),
                  ],
                ),
                Divider(color: AppColor.grey, thickness: .2),
                SizedBox(height: 10.h),
                Wrap(
                  spacing: 6.20,
                  runSpacing: 10,
                  alignment: WrapAlignment.start,
                  children: [
                    ...timeList.map(
                      (o) => GestureDetector(
                        onTap: () {
                          setState(() {
                            t = o;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 5.4.w,
                            horizontal: 6.w,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            color:
                                t == o
                                    ? AppColor.primary1
                                    : AppColor.transparent,
                            border: Border.all(
                              color: AppColor.funnyLookingGrey,
                            ),
                          ),
                          child: TextView(
                            text: o,
                            textStyle: GoogleFonts.dmSans(
                              color: t == o ? AppColor.white : AppColor.black,
                              fontSize: 15.6.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.w),
                TextView(
                  text: 'Available Services',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 16.sp,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Divider(color: AppColor.grey, thickness: .5),
                if (model.getListOfLabDiagnosisModelList != null &&
                    model
                        .getListOfLabDiagnosisModelList!
                        .getListOfLabDiagnosisModelList!
                        .isNotEmpty)
                  ...model
                      .getListOfLabDiagnosisModelList!
                      .getListOfLabDiagnosisModelList!
                      .map(
                        (o) => Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextView(
                                  text: o.name!.capitalize(),
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.black,
                                    fontSize: 16.sp,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Checkbox(
                                  value: selectedOptions.contains(o),
                                  onChanged: (isChecked) {
                                    setState(() {
                                      if (isChecked!) {
                                        selectedOptions.add(o);
                                      } else {
                                        selectedOptions.remove(o);
                                      }
                                    });
                                  },
                                ),
                              ],
                            ),

                            Divider(color: AppColor.grey, thickness: .5),
                          ],
                        ),
                      ),
                SizedBox(height: 40.h),
                GestureDetector(
                  onTap: () {
                    navPatientDetail(
                      context: context,
                      date: model.selectLabDate,
                      time: t,
                      selectedOptions: selectedOptions,
                      actions: () async {
                        for (int i = 0; i < selectedOptions.length; i++) {
                          await box.add(
                            CheckoutEntityModel(
                              serviceType: 'lab',
                              serviceId: int.parse(
                                selectedOptions[i].id.toString(),
                              ),
                              doctorId: int.parse(
                                widget.getAllLabTechResponseModel!.id
                                    .toString(),
                              ),
                              slotId: 0,
                              complaint: '',
                              amount: selectedOptions[i].price!.toString(),
                              date: model.selectLabDate,
                              time: t,
                              doctor:
                                  widget.getAllLabTechResponseModel!.firstName!
                                      .capitalize(),
                              productId: 0,
                              qty: 0,
                              name: selectedOptions[i].name!,
                            ),
                          );
                        }
                        AppUtils.snackbar(
                          context,
                          message: 'Lab test request added to Cart..!',
                        );
                      },
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      vertical: 10.w,
                      horizontal: 14.0.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.primary1,
                    ),
                    child: Center(
                      child: TextView(
                        text: 'Add To Cart',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.white,
                          fontSize: 18.0.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 60.h),
              ],
            ),
          );
        },
      ),
    );
  }

  navPatientDetail({
    BuildContext? context,
    String? date,
    String? time,
    List<GetListOfLabDiagnosisModel>? selectedOptions,
    Function()? actions,
  }) {
    if (date == '' || time == null || selectedOptions!.isEmpty) {
      AppUtils.snackbarTop(
        context,
        message: "Select Date, time and Available Services",
        error: true,
      );
    } else {
      actions!.call();
      setState(() {});
    }
  }
}
