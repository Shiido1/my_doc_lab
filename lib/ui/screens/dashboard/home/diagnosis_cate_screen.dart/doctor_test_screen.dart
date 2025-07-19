import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:doc_lab_pharm/ui/app_assets/app_color.dart';
import 'package:doc_lab_pharm/ui/widget/text_form_widget.dart';
import 'package:stacked/stacked.dart';

import '../../../../../core/connect_end/model/checkoutentitymodel.dart';
import '../../../../../core/connect_end/model/get_list_of_lab_diagnosis_model/get_list_of_lab_diagnosis_model.dart';
import '../../../../../core/connect_end/model/search_doctor_entity_model.dart';
import '../../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../../main.dart';
import '../../../../app_assets/app_image.dart';
import '../../../../app_assets/app_utils.dart';
import '../../../../app_assets/constant.dart';
import '../../../../widget/text_widget.dart';
import '../cart_screen.dart';

// ignore: must_be_immutable
class DoctorTestScreen extends StatefulWidget {
  DoctorTestScreen({super.key, required this.tap});

  bool tap = true;

  @override
  State<DoctorTestScreen> createState() => _DoctorTestScreenState();
}

class _DoctorTestScreenState extends State<DoctorTestScreen> {
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
    final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    final double? mainAxisExtent = isTablet ? null : 220.h;
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => AuthViewModel(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          model.getAllDoctors(context);
          // model.getAllReport(context);

          model.getAllDiagnosisList(context, id: '1');
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
                      text: 'Doctors',
                      textStyle: GoogleFonts.gabarito(
                        color: AppColor.black,
                        fontSize: 20.0.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SvgPicture.asset(
                      AppImage.notification,
                      width: 24.w,
                      height: 24.w,
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap:
                          () => setState(() {
                            widget.tap = true;
                          }),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 12.w,
                          horizontal: 40.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              widget.tap
                                  ? AppColor.primary1
                                  : AppColor.grey.withOpacity(.2),
                        ),
                        child: Row(
                          children: [
                            TextView(
                              text: 'Doctors',
                              textStyle: GoogleFonts.gabarito(
                                color:
                                    widget.tap ? AppColor.white : AppColor.grey,
                                fontSize: 14.0.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            SvgPicture.asset(
                              AppImage.ddoc,
                              color:
                                  widget.tap ? AppColor.white : AppColor.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap:
                          () => setState(() {
                            widget.tap = false;
                          }),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 12.w,
                          horizontal: 42.0.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color:
                              widget.tap
                                  ? AppColor.grey.withOpacity(.2)
                                  : AppColor.primary1,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextView(
                              text: 'Tests',
                              textStyle: GoogleFonts.gabarito(
                                color:
                                    widget.tap ? AppColor.grey : AppColor.white,
                                fontSize: 14.0.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            SvgPicture.asset(
                              AppImage.vaccine,
                              color:
                                  widget.tap ? AppColor.grey : AppColor.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                widget.tap
                    ? Column(
                      children: [
                        TextFormWidget(
                          label: 'Search for doctors, specialties, or tests...',
                          border: 10,
                          isFilled: true,
                          fillColor: AppColor.transparent,
                          prefixWidget: Padding(
                            padding: EdgeInsets.all(14.w),
                            child: SvgPicture.asset(AppImage.search),
                          ),
                          // suffixWidget: Padding(
                          //   padding: EdgeInsets.all(14.w),
                          //   child: SvgPicture.asset(AppImage.filter),
                          // ),
                          onChange: (p0) {
                            if (p0.length > 1) {
                              model.debouncer.run(() {
                                model.getSearchedDoctor(
                                  context,
                                  searchEntity: SearchDoctorEntityModel(
                                    query: p0,
                                  ),
                                );
                              });
                            }
                            model.query = p0;
                            model.notifyListeners();
                          },
                        ),
                        SizedBox(
                          height: 500.h,
                          child:
                              model.isLoadingAllDoctors
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
                                    itemCount:
                                        10, // Number of items in the grid
                                  )
                                  : model.homeGridView(
                                    mainAxisExtent: mainAxisExtent,
                                  ),
                        ),
                      ],
                    )
                    : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(16.w),
                                            decoration: BoxDecoration(
                                              color: AppColor.primary1
                                                  .withOpacity(.7),
                                              borderRadius:
                                                  BorderRadius.circular(14),
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
                                                  textStyle:
                                                      GoogleFonts.gabarito(
                                                        color: AppColor.black,
                                                        fontSize: 14.8.sp,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w300,
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

                                      Divider(
                                        color: AppColor.grey,
                                        thickness: .5,
                                      ),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(16.w),
                                            decoration: BoxDecoration(
                                              color: AppColor.primary1
                                                  .withOpacity(.7),
                                              borderRadius:
                                                  BorderRadius.circular(14),
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
                                                  textStyle:
                                                      GoogleFonts.gabarito(
                                                        color: AppColor.black,
                                                        fontSize: 14.8.sp,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w300,
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

                                      Divider(
                                        color: AppColor.grey,
                                        thickness: .5,
                                      ),
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
                                    border: Border.all(
                                      color: AppColor.primary1,
                                    ),
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
                                      color:
                                          t == o
                                              ? AppColor.white
                                              : AppColor.black,
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
                                for (
                                  int i = 0;
                                  i < selectedOptions.length;
                                  i++
                                ) {
                                  await box.add(
                                    CheckoutEntityModel(
                                      serviceType: 'lab',
                                      serviceId: int.parse(
                                        selectedOptions[i].id.toString(),
                                      ),
                                      doctorId: int.parse('1'),
                                      slotId: 0,
                                      complaint: '',
                                      amount:
                                          selectedOptions[i].price!.toString(),
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
                                  MaterialPageRoute(
                                    builder: (context) => CartScreen(),
                                  ),
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
                SizedBox(height: 40.h),
              ],
            ),
          ),
        );
      },
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
