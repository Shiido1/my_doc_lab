// ignore_for_file: must_be_immutable, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_utils.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/model/checkoutentitymodel.dart';
import '../../../../core/connect_end/model/get_list_of_lab_diagnosis_model/get_list_of_lab_diagnosis_model.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../main.dart';
import '../../../app_assets/app_image.dart';
import '../../../app_assets/constant.dart';
import '../../../widget/text_form_widget.dart';
import '../../../widget/text_widget.dart';
import '../home/cart_screen.dart';

class LaboratoryDetailScreen extends StatefulWidget {
  const LaboratoryDetailScreen({super.key});

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
          model.getAllDiagnosisList(context, id: '1');
        },
        disposeViewModel: false,
        builder: (_, AuthViewModel model, __) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 26.0.h),
                TextView(
                  text: 'Available Services',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 22.sp,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20.h),
                TextFormWidget(
                  label: 'Search Service',
                  labelStyle: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColor.primary1,
                  ),
                  border: 10,
                  isFilled: true,
                  fillColor: AppColor.white,
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
                SizedBox(height: 20.h),
                Divider(color: AppColor.grey, thickness: .5),
                if (model.getListOfLabDiagnosisModelList != null &&
                    model
                        .getListOfLabDiagnosisModelList!
                        .getListOfLabDiagnosisModelList!
                        .isNotEmpty)
                  if (model.query != '')
                    ...model
                        .getListOfLabDiagnosisModelList!
                        .getListOfLabDiagnosisModelList!
                        .where(
                          (w) => w.name!.toLowerCase().contains(
                            model.query.toLowerCase(),
                          ),
                        )
                        .map(
                          (o) => Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(16.w),
                                    decoration: BoxDecoration(
                                      color: AppColor.primary1.withOpacity(.7),
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: SvgPicture.asset(
                                      AppImage.blood,
                                      height: 20.40.h,
                                      width: 20.50.w,
                                    ),
                                  ),
                                  SizedBox(width: 12.20.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextView(
                                        text: o.name!.capitalize(),
                                        textStyle: GoogleFonts.gabarito(
                                          color: AppColor.black,
                                          fontSize: 17.6.sp,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 200.w,
                                        child: TextView(
                                          text: o.details!.capitalize(),
                                          textStyle: GoogleFonts.gabarito(
                                            color: AppColor.black,
                                            fontSize: 14.8.sp,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
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
                        )
                  else
                    ...model
                        .getListOfLabDiagnosisModelList!
                        .getListOfLabDiagnosisModelList!
                        .map(
                          (o) => Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(16.w),
                                    decoration: BoxDecoration(
                                      color: AppColor.primary1.withOpacity(.7),
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: SvgPicture.asset(
                                      AppImage.blood,
                                      height: 20.40.h,
                                      width: 20.50.w,
                                    ),
                                  ),
                                  SizedBox(width: 12.20.w),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextView(
                                        text: o.name!.capitalize(),
                                        textStyle: GoogleFonts.gabarito(
                                          color: AppColor.black,
                                          fontSize: 17.6.sp,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 200.w,
                                        child: TextView(
                                          text: o.details!.capitalize(),
                                          textStyle: GoogleFonts.gabarito(
                                            color: AppColor.black,
                                            fontSize: 14.8.sp,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
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
                              doctorId: int.parse('1'),
                              slotId: 0,
                              complaint: '',
                              amount: selectedOptions[i].price!.toString(),
                              date: model.selectLabDate,
                              time: t,
                              doctor: 'Lab',
                              productId: 0,
                              qty: 0,
                              name: selectedOptions[i].name!,
                            ),
                          );
                        }
                        await AppUtils.snackbar(
                          context,
                          message: 'Lab test request added to Cart..!',
                        );
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => CartScreen()),
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
