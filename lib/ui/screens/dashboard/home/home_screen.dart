import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/core/core_folder/app/app.router.dart';
import 'package:my_doc_lab/main.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/constant.dart';
import 'package:my_doc_lab/ui/screens/dashboard/home/diagnosis_cate_screen.dart/doctor_test_screen.dart';
import 'package:my_doc_lab/ui/screens/dashboard/patient/medicine_screen.dart';
import 'package:my_doc_lab/ui/screens/dashboard/notification/notification_screen.dart';
import 'package:my_doc_lab/ui/widget/text_form_widget.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../app_assets/app_image.dart';
import '../../../widget/text_widget.dart';
import '../laboratory/lab_screen.dart';

double _value = 350;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    final double? mainAxisExtent = isTablet ? null : 220.h;
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => locator<AuthViewModel>(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          model.getPatientDetail(context);
          model.getAllDoctors(context);
        });
      },
      disposeViewModel: false,
      builder: (_, AuthViewModel model, __) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 17.2.w, vertical: 50.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.w),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(20.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.oneKindgrey,
                      ),
                    ),
                    SizedBox(width: 20.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200.w,
                          child: Row(
                            children: [
                              TextView(
                                text: 'Hello '.capitalize(),
                                textStyle: GoogleFonts.dmSans(
                                  color: AppColor.black,
                                  fontSize: 19.20.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                              ),
                              TextView(
                                text:
                                    '${model.getUserResponseModel?.data?.firstName ?? ''}!'
                                        .capitalize(),
                                textStyle: GoogleFonts.dmSans(
                                  color: AppColor.black,
                                  fontSize: 19.20.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        TextView(
                          text: 'How can we help you today?',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.greyIt,
                            fontSize: 14.20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    SvgPicture.asset(AppImage.cart, width: 24.w, height: 24.w),
                    SizedBox(width: 20.w),
                    GestureDetector(
                      onTap:
                          () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => NotificationScreen(),
                            ),
                          ),
                      child: SvgPicture.asset(
                        AppImage.notification,
                        width: 24.w,
                        height: 24.w,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.w),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 14.w,
                    horizontal: 18.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.primary1.withOpacity(.6),
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColor.white),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextView(
                            text: 'Available Balance',
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.white,
                              fontSize: 13.20.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppImage.wallet,
                                width: 20.w,
                                height: 20.w,
                                color: AppColor.white,
                              ),
                              SizedBox(width: 10.w),
                              TextView(
                                text:
                                    !_isTapped
                                        ? '*******'
                                        : '${getCurrency()}${oCcy.format(double.parse('${model.getUserResponseModel?.data?.wallets?.balance}'))}',
                                textStyle: GoogleFonts.gabarito(
                                  color: AppColor.white,
                                  fontSize: _isTapped ? 21.2.sp : 24.0.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => setState(() => _isTapped = !_isTapped),
                        child: SvgPicture.asset(
                          !_isTapped ? AppImage.close_eye : AppImage.opened_eye,
                          width: !_isTapped ? 22.w : 15.0.w,
                          height: !_isTapped ? 22.w : 15.0.h,
                          color: AppColor.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                TextFormWidget(
                  label: 'Search for doctors, specialties, or tests...',
                  border: 10,
                  isFilled: true,
                  fillColor: AppColor.transparent,
                  // controller: fullnameTextController,
                  prefixWidget: Padding(
                    padding: EdgeInsets.all(14.w),
                    child: SvgPicture.asset(
                      AppImage.search,
                      height: 20.h,
                      width: 20.w,
                    ),
                  ),
                  suffixWidget: Padding(
                    padding: EdgeInsets.all(14.w),
                    child: GestureDetector(
                      onTap: () => modalBottomSheetFilter(context),
                      child: SvgPicture.asset(
                        AppImage.filter,
                        height: 20.h,
                        width: 20.w,
                      ),
                    ),
                  ),
                  // validator: AppValidator.validateEmail(),
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    fourthContainer(context),
                    SizedBox(width: 10.w),

                    secondContainer(context),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  children: [
                    firstContainer(context),
                    SizedBox(width: 10.w),
                    thirdContainer(context),
                  ],
                ),
                SizedBox(height: 20.h),
                TextView(
                  text: 'Upcoming Appointments',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.primary1,
                    fontSize: 16.20.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      text: 'Our Doctors',
                      textStyle: GoogleFonts.dmSans(
                        color: AppColor.black,
                        fontSize: 16.20.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    GestureDetector(
                      onTap:
                          () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DoctorTestScreen(tap: true),
                            ),
                          ),
                      child: TextView(
                        text: 'See all',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.primary,
                          fontSize: 14.0.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 370.h,
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
                            itemCount: 20, // Number of items in the grid
                          )
                          : GridView.builder(
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
                              return GestureDetector(
                                onTap:
                                    () => navigate.navigateTo(
                                      Routes.profileScreen,
                                      arguments: ProfileScreenArguments(
                                        id:
                                            model
                                                .getAllDoctorsResponseModelList!
                                                .getAllDoctorsResponseModelList![index]
                                                .id
                                                .toString(),
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
                                        child: Image.network(
                                          model
                                                  .getAllDoctorsResponseModelList!
                                                  .getAllDoctorsResponseModelList![index]
                                                  .profileImage ??
                                              '',
                                          height: 120.h,
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
                                            TextView(
                                              text:
                                                  'Dr ${model.getAllDoctorsResponseModelList!.getAllDoctorsResponseModelList![index].firstName ?? ''} ${model.getAllDoctorsResponseModelList!.getAllDoctorsResponseModelList![index].lastName ?? ''}',
                                              textStyle: GoogleFonts.gabarito(
                                                color: AppColor.black,
                                                fontSize: 16.0.sp,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            TextView(
                                              text:
                                                  model
                                                      .getAllDoctorsResponseModelList!
                                                      .getAllDoctorsResponseModelList![index]
                                                      .speciality ??
                                                  '',
                                              textStyle: GoogleFonts.gabarito(
                                                color: AppColor.grey,
                                                fontSize: 12.0.sp,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            SizedBox(height: 14.0.h),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: 1.w,
                                                    horizontal: 4.w,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          4,
                                                        ),
                                                    color: AppColor.primary,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        color: AppColor.white,
                                                        size: 15.0.sp,
                                                      ),
                                                      SizedBox(width: 2.w),
                                                      TextView(
                                                        text: '4.8',
                                                        textStyle:
                                                            GoogleFonts.dmSans(
                                                              color:
                                                                  AppColor
                                                                      .white,
                                                              fontSize: 12.0.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      AppImage.location,
                                                      height: 15.2.h,
                                                      width: 16.2.w,
                                                    ),
                                                    SizedBox(width: 2.w),
                                                    TextView(
                                                      text: '800m away',
                                                      textStyle:
                                                          GoogleFonts.gabarito(
                                                            color:
                                                                AppColor.black,
                                                            fontSize: 12.0.sp,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount:
                                model.getAllDoctorsResponseModelList != null
                                    ? model
                                        .getAllDoctorsResponseModelList!
                                        .getAllDoctorsResponseModelList!
                                        .length
                                    : 0, // Number of items in the grid
                          ),
                ),
                // SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextView(
                      text: 'Tests',
                      textStyle: GoogleFonts.dmSans(
                        color: AppColor.black,
                        fontSize: 16.20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    GestureDetector(
                      onTap:
                          () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder:
                                  (context) => DoctorTestScreen(tap: false),
                            ),
                          ),
                      child: TextView(
                        text: 'See all',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.primary,
                          fontSize: 14.0.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Row(
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
                            fontSize: 18.20.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 10.w),
                        SizedBox(
                          width: 240.w,
                          child: TextView(
                            text:
                                'A blood test helps assess your overall health and detect a wide range of conditions, such as infections, anemia, and more. Common tests include Complete Blood Count (CBC) and Blood Sugar Analysis.',
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.black.withOpacity(.7),
                              fontSize: 15.20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            textOverflow: TextOverflow.ellipsis,
                            maxLines: 6,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  firstContainer(context) => Expanded(
    child: Stack(
      clipBehavior: Clip.none,
      children: [
        GestureDetector(
          onTap:
              () => Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => MedicineScreen())),
          child: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.w),
            margin: EdgeInsets.only(top: 4.w),
            decoration: BoxDecoration(
              color: AppColor.white,

              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColor.darkindgrey.withOpacity(.2)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // SizedBox(height: 6.0.h),
                TextView(
                  text: 'Medicine',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.darkindgrey,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 10.h),
                TextView(
                  text:
                      'Get in touch with top pharmacists, order Drugs, have them delivered right to your doorstep.',
                  textAlign: TextAlign.end,
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.darkindgrey,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 4.8.w,
                    horizontal: 10.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.darkindgrey,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextView(
                    text: 'Book Now',
                    textStyle: GoogleFonts.dmSans(
                      color: AppColor.white,
                      fontSize: 12.20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),

        Positioned(
          bottom: 1.7,
          left: -10,
          child: Image.asset(AppImage.doctor, height: 80.0.h, width: 100.w),
        ),
      ],
    ),
  );

  secondContainer(context) => Expanded(
    child: Stack(
      fit: StackFit.passthrough,
      children: [
        GestureDetector(
          onTap:
              () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DoctorTestScreen(tap: false),
                ),
              ),
          child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.w),
            decoration: BoxDecoration(
              color: AppColor.darkindgrey,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColor.white),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: 10.h),
                TextView(
                  text: 'Schedule Home Test',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.white,
                    fontSize: 13.60.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 10.h),
                TextView(
                  text:
                      'Book diagnostic tests, have them don at the comfort of your\nhome.',
                  textAlign: TextAlign.start,
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.white,
                    fontSize: 11.60.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 4.8.w,
                    horizontal: 4.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextView(
                    text: 'Schedule Test',
                    textStyle: GoogleFonts.dmSans(
                      color: AppColor.darkindgrey,
                      fontSize: 11.80.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 18.h),
              ],
            ),
          ),
        ),

        Positioned(
          right: -39,
          bottom: -10,
          child: Image.asset(AppImage.femdoc, height: 140.h, width: 140.w),
        ),
      ],
    ),
  );

  thirdContainer(context) => Expanded(
    child: Stack(
      children: [
        GestureDetector(
          onTap:
              () => Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => LaboratoryScreen()),
              ),
          child: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.w),
            decoration: BoxDecoration(
              color: AppColor.primary1,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 5.0.h),
                TextView(
                  text: 'Laboratories',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.white,
                    fontSize: 13.60.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 10.h),
                TextView(
                  text:
                      'Connect with tops labs, schedule your tests, and have your results delivered with ease.',
                  textAlign: TextAlign.end,
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 13.20.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 4.8.w,
                    horizontal: 10.0.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextView(
                    text: 'Book Now',
                    textStyle: GoogleFonts.dmSans(
                      color: AppColor.primary1,
                      fontSize: 12.0.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),

        Positioned(
          bottom: -14,
          left: -24.0,
          child: Image.asset(AppImage.lab_sci, height: 100.h, width: 100.w),
        ),
      ],
    ),
  );

  fourthContainer(context) => Expanded(
    child: Stack(
      children: [
        GestureDetector(
          onTap:
              () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DoctorTestScreen(tap: true),
                ),
              ),
          child: Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 12.w),
            decoration: BoxDecoration(
              color: AppColor.blue,
              borderRadius: BorderRadius.circular(10),
              // border: Border.all(color: AppColor.white),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(height: 10.h),
                TextView(
                  text: 'Book Appointment',
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.white,
                    fontSize: 13.30.sp,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(height: 10.h),
                TextView(
                  text:
                      'Connect with top doctors and get expert care at your convenience.',
                  textAlign: TextAlign.end,
                  textStyle: GoogleFonts.dmSans(
                    color: AppColor.white,
                    fontSize: 11.6.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 4.8.w,
                    horizontal: 10.0.w,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextView(
                    text: 'Book Now',
                    textStyle: GoogleFonts.dmSans(
                      color: AppColor.blue,
                      fontSize: 12.20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),

        Positioned(
          bottom: 1.7,
          left: -1.2,
          child: Image.asset(AppImage.doc, height: 80.h, width: 100.w),
        ),
      ],
    ),
  );

  void modalBottomSheetFilter(contxt) {
    String selectPreferredCare = '';
    String selectPreferredCenter = '';
    String selectPreferredDoctor = '';
    showModalBottomSheet(
      context: contxt,
      isScrollControlled: true, // Enables full-screen dragging
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (builder) {
        final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(contxt).viewInsets.bottom,
              ),
              child: DraggableScrollableSheet(
                expand: false,
                initialChildSize: 0.7, // 50% of screen height
                minChildSize: 0.5, // Can be dragged to 30% of screen height
                maxChildSize: 0.9, // Can be dragged to 90% of screen height
                builder: (context, scrollController) {
                  return SingleChildScrollView(
                    padding: EdgeInsets.only(left: 12.w, right: 24.w),
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 6.0.h),
                        Center(
                          child: Container(
                            width: 30.w,
                            height: 3.5.h,
                            margin: EdgeInsets.only(top: 10.w),
                            decoration: BoxDecoration(
                              color: AppColor.grey2.withOpacity(.4),
                              borderRadius: BorderRadius.circular(22),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0.h),
                        TextView(
                          text: 'Filter by:',
                          textStyle: TextStyle(
                            color: AppColor.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),

                        SizedBox(height: 26.0.h),
                        TextView(
                          text: 'Search by distance',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.primary1,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 14.0.h),
                        CustomSlider(),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              text: 'Near me',
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.primary1,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextView(
                              text: '${_value.toStringAsFixed(2)}km',
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.primary1,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        TextView(
                          text: 'Preferred care?',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.primary1,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 6.0.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              text: 'Doctor',
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.primary1,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                              child: Radio<String>(
                                value: 'doctor',
                                groupValue: selectPreferredCare,
                                fillColor: WidgetStateProperty.all(
                                  AppColor.primary1,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    selectPreferredCare = value!;
                                    print(selectPreferredCare);
                                  });
                                }, // Autofocus is optional, depending on the app's needs.
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              text: 'Nurse',
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.primary1,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                              child: Radio<String>(
                                value: 'nurse',
                                groupValue: selectPreferredCare,
                                fillColor: WidgetStateProperty.all(
                                  AppColor.primary1,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    selectPreferredCare = value!;
                                    print(selectPreferredCare);
                                  });
                                }, // Autofocus is optional, depending on the app's needs.
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 10.h),
                        TextView(
                          text: 'Where do you want care?',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.primary1,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 6.0.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              text: 'Physical Consultation',
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.primary1,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                              child: Radio<String>(
                                value: 'physical',
                                groupValue: selectPreferredCenter,
                                fillColor: WidgetStateProperty.all(
                                  AppColor.primary1,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    selectPreferredCenter = value!;
                                    print(selectPreferredCenter);
                                  });
                                }, // Autofocus is optional, depending on the app's needs.
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              text: 'Virtual Consultation',
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.primary1,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                              child: Radio<String>(
                                value: 'virtual',
                                groupValue: selectPreferredCenter,
                                fillColor: WidgetStateProperty.all(
                                  AppColor.primary1,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    selectPreferredCenter = value!;
                                    print(selectPreferredCenter);
                                  });
                                }, // Autofocus is optional, depending on the app's needs.
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 10.h),
                        TextView(
                          text: 'What doctor would you like to see?',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.primary1,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 6.0.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              text: 'Any',
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.primary1,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 20.h,
                              child: Radio<String>(
                                value: 'any',
                                groupValue: selectPreferredDoctor,
                                fillColor: WidgetStateProperty.all(
                                  AppColor.primary1,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    selectPreferredDoctor = value!;
                                    print(selectPreferredDoctor);
                                  });
                                }, // Autofocus is optional, depending on the app's needs.
                              ),
                            ),
                          ],
                        ),
                        Divider(color: AppColor.greyIt.withOpacity(.2)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              text: 'General Practice &\nGeneral medical care',
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.primary1,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                              child: Radio<String>(
                                value: 'gpgmc',
                                groupValue: selectPreferredDoctor,
                                fillColor: WidgetStateProperty.all(
                                  AppColor.primary1,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    selectPreferredDoctor = value!;
                                    print(selectPreferredDoctor);
                                  });
                                }, // Autofocus is optional, depending on the app's needs.
                              ),
                            ),
                          ],
                        ),
                        Divider(color: AppColor.greyIt.withOpacity(.2)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              text: 'Dermatology: skin care',
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.primary1,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                              child: Radio<String>(
                                value: 'skincare',
                                groupValue: selectPreferredDoctor,
                                fillColor: WidgetStateProperty.all(
                                  AppColor.primary1,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    selectPreferredDoctor = value!;
                                    print(selectPreferredDoctor);
                                  });
                                }, // Autofocus is optional, depending on the app's needs.
                              ),
                            ),
                          ],
                        ),
                        Divider(color: AppColor.greyIt.withOpacity(.2)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              text: 'Plastic surgery',
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.primary1,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                              child: Radio<String>(
                                value: 'plastic-surgery',
                                groupValue: selectPreferredDoctor,
                                fillColor: WidgetStateProperty.all(
                                  AppColor.primary1,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    selectPreferredDoctor = value!;
                                    print(selectPreferredDoctor);
                                  });
                                }, // Autofocus is optional, depending on the app's needs.
                              ),
                            ),
                          ],
                        ),
                        Divider(color: AppColor.greyIt.withOpacity(.2)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              text: 'Haematology: Blood\ndisease',
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.primary1,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                              child: Radio<String>(
                                value: 'blood-disease',
                                groupValue: selectPreferredDoctor,
                                fillColor: WidgetStateProperty.all(
                                  AppColor.primary1,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    selectPreferredDoctor = value!;
                                    print(selectPreferredDoctor);
                                  });
                                }, // Autofocus is optional, depending on the app's needs.
                              ),
                            ),
                          ],
                        ),
                        Divider(color: AppColor.greyIt.withOpacity(.2)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              text: 'Cardilogy: Child health',
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.primary1,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                              child: Radio<String>(
                                value: 'child-health',
                                groupValue: selectPreferredDoctor,
                                fillColor: WidgetStateProperty.all(
                                  AppColor.primary1,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    selectPreferredDoctor = value!;
                                    print(selectPreferredDoctor);
                                  });
                                }, // Autofocus is optional, depending on the app's needs.
                              ),
                            ),
                          ],
                        ),
                        Divider(color: AppColor.greyIt.withOpacity(.2)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextView(
                              text: 'Opthalomolgy: Eye care',
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.primary1,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 30.h,
                              child: Radio<String>(
                                value: 'eye-care',
                                groupValue: selectPreferredDoctor,
                                fillColor: WidgetStateProperty.all(
                                  AppColor.primary1,
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    selectPreferredDoctor = value!;
                                    print(selectPreferredDoctor);
                                  });
                                }, // Autofocus is optional, depending on the app's needs.
                              ),
                            ),
                          ],
                        ),

                        Divider(color: AppColor.greyIt.withOpacity(.2)),

                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              // onTap:
                              //     () => Navigator.of(context).push(
                              //       MaterialPageRoute(
                              //         builder: (context) => ConsultationScreen(),
                              //       ),
                              //     ),
                              child: Container(
                                padding:
                                    isTablet
                                        ? EdgeInsets.all(12.0.w)
                                        : EdgeInsets.all(20.0.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),

                                  color: const Color.fromARGB(
                                    255,
                                    208,
                                    234,
                                    222,
                                  ),
                                ),
                                child: TextView(
                                  text: 'Reset All',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.primary1,
                                    fontSize: 16.0.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              // onTap:
                              //     () => Navigator.of(context).push(
                              //       MaterialPageRoute(
                              //         builder: (context) => ConsultationScreen(),
                              //       ),
                              //     ),
                              child: Container(
                                padding:
                                    isTablet
                                        ? EdgeInsets.all(10.w)
                                        : EdgeInsets.all(20.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColor.primary1,
                                ),
                                child: TextView(
                                  text: 'Apply Filters',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.white,
                                    fontSize: 16.0.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 60.h),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        padding: EdgeInsets.zero,
        activeTrackColor: AppColor.primary1,
        inactiveTrackColor: Colors.green.shade100,
        trackHeight: 4.0,
        thumbColor: AppColor.primary1,
        overlayColor: AppColor.primary1.withAlpha(32),
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 8.0),
        trackShape: RoundedRectSliderTrackShape(),
      ),
      child: Slider(
        min: 0,
        max: 500,
        value: _value,
        onChanged: (newValue) {
          setState(() {
            _value = newValue;
          });
          print('1:$_value');
        },
      ),
    );
  }
}
