// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_image.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/model/get_doc_detail_response_model/get_doc_detail_response_model.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../app_assets/constant.dart';
import '../../../widget/text_widget.dart';
import '../patient/patient_complaint_screen.dart';

class ConsultationScreen extends StatelessWidget {
  ConsultationScreen({
    super.key,
    required this.bookTyoe,
    required this.docId,
    required this.slotId,
    required this.doctor,
  });
  String? bookTyoe;
  String? docId;
  String? doctor;
  AvailableSlots? slotId;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => locator<AuthViewModel>(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((o) {
          model.getAllConsultants(context);
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
                SizedBox(height: 20.h),
                TextView(
                  text: 'How do you wish to book?',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.grey,
                    fontSize: 16.40.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20.h),
                if (model.isLoading)
                  Padding(
                    padding: EdgeInsets.only(top: 10.w),
                    child: Center(
                      child: CircularProgressIndicator(
                        color: AppColor.primary1,
                      ),
                    ),
                  ),
                if (model.getAllConsultantResponseModelList != null &&
                    model
                        .getAllConsultantResponseModelList!
                        .getAllConsultantResponseModelList!
                        .isNotEmpty)
                  ...model
                      .getAllConsultantResponseModelList!
                      .getAllConsultantResponseModelList!
                      .map(
                        (o) => Container(
                          padding: EdgeInsets.only(
                            top: 10.w,
                            right: 14.w,
                            left: 24.w,
                            bottom: 10.w,
                          ),
                          margin: EdgeInsets.only(bottom: 20.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.primary1.withOpacity(.18),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(14.w),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColor.primary1.withOpacity(.2),
                                    ),
                                    child: SvgPicture.asset(AppImage.aidbox),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextView(
                                        text: o.name ?? '',
                                        textStyle: GoogleFonts.gabarito(
                                          color: AppColor.darkindgrey,
                                          fontSize: 16.40.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      SizedBox(height: 2.h),
                                      SizedBox(
                                        width: 200.w,
                                        child: TextView(
                                          text: o.details ?? '',
                                          maxLines: 3,
                                          textOverflow: TextOverflow.ellipsis,
                                          textStyle: GoogleFonts.gabarito(
                                            color: AppColor.darkindgrey,
                                            fontSize: 13.40.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              TextView(
                                text: 'Per Consultation',
                                textStyle: GoogleFonts.gabarito(
                                  color: AppColor.darkindgrey,
                                  fontSize: 12.40.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Html(data: o.includeDetails, shrinkWrap: true),
                              SizedBox(height: 10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    text:
                                        '${getCurrency()}${oCcy.format(double.parse('${o.price}'))}',
                                    textStyle: TextStyle(
                                      color: AppColor.darkindgrey,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap:
                                        () => Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder:
                                                (context) =>
                                                    PatientDetailComplaintScreen(
                                                      bookType: bookTyoe,
                                                      docId: docId,
                                                      serviceId: o.id,
                                                      slotId: slotId!,
                                                      doctor: doctor,
                                                      price: o.price.toString(),
                                                    ),
                                          ),
                                        ),
                                    child: Container(
                                      padding: EdgeInsets.all(10.w),
                                      decoration: BoxDecoration(
                                        color: AppColor.primary1,
                                        borderRadius: BorderRadius.circular(22),
                                      ),
                                      child: TextView(
                                        text: 'Book Now',
                                        textStyle: GoogleFonts.gabarito(
                                          color: AppColor.white,
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ),
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
