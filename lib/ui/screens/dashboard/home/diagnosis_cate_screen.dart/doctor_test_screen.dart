import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/screens/dashboard/home/diagnosis_cate_screen.dart/test_screen.dart';
import 'package:my_doc_lab/ui/widget/text_form_widget.dart';
import 'package:stacked/stacked.dart';

import '../../../../../core/connect_end/model/search_doctor_entity_model.dart';
import '../../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../app_assets/app_image.dart';
import '../../../../app_assets/constant.dart';
import '../../../../widget/text_widget.dart';

// ignore: must_be_immutable
class DoctorTestScreen extends StatefulWidget {
  DoctorTestScreen({super.key, required this.tap});

  bool tap = true;

  @override
  State<DoctorTestScreen> createState() => _DoctorTestScreenState();
}

class _DoctorTestScreenState extends State<DoctorTestScreen> {
  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    final double? mainAxisExtent = isTablet ? null : 220.h;
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => AuthViewModel(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          model.getAllDoctors(context);
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
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.keyboard_arrow_left, size: 30.sp),
                    ),
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
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormWidget(
                                label: 'Search for tests...',
                                // hint: 'Email Address',
                                border: 10,
                                isFilled: true,
                                fillColor: AppColor.transparent,
                                // controller: fullnameTextController,
                                prefixWidget: Padding(
                                  padding: EdgeInsets.all(14.w),
                                  child: SvgPicture.asset(AppImage.search),
                                ),
                                // validator: AppValidator.validateEmail(),
                              ),
                            ),
                            SizedBox(width: 20.w),
                            Container(
                              padding: EdgeInsets.all(16.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: AppColor.funnyLookingGrey,
                                ),
                              ),
                              child: SvgPicture.asset(AppImage.filter),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                        GestureDetector(
                          onTap:
                              () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => TestScreen(),
                                ),
                              ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(16.w),
                                decoration: BoxDecoration(
                                  color: AppColor.primary1.withOpacity(.7),
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: SvgPicture.asset(
                                  AppImage.blood,
                                  height: 40.h,
                                  width: 50.w,
                                ),
                              ),
                              SizedBox(width: 20.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextView(
                                    text: 'Blood Test',
                                    textStyle: GoogleFonts.gabarito(
                                      color: AppColor.primary1,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: 10.w),
                                  SizedBox(
                                    width: 260.w,
                                    child: TextView(
                                      text:
                                          'A blood test helps assess your overall health and detect a wide range of conditions, such as infections, anemia, and more. Common tests include Complete Blood Count (CBC) and Blood Sugar Analysis.',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.black.withOpacity(.7),
                                        fontSize: 13.0.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                      maxLines: 6,
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
