import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_image.dart';
import 'package:my_doc_lab/ui/app_assets/constant.dart';
import 'package:my_doc_lab/ui/screens/dashboard/notification/notification_screen.dart';
import 'package:my_doc_lab/ui/screens/dashboard/settings/results/results_screen.dart';
import 'package:my_doc_lab/ui/widget/text_widget.dart';
import 'package:stacked/stacked.dart';
import '../../../../../core/connect_end/view_model/med_lab_view_model.dart';
import '../../../../../core/core_folder/app/app.locator.dart';
import '../../../../../core/core_folder/manager/shared_preference.dart';
import '../../../authentication/lab_edit_profile_screen.dart';
import '../../laboratory/lab_diagnosis_screen.dart';
import '../help_and_support_screen.dart';
import '../wallet/lab_tech_wallet_screen.dart';

class LabSettingsScreen extends StatelessWidget {
  const LabSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LabTechViewModel>.reactive(
      viewModelBuilder: () => locator<LabTechViewModel>(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          model.getLabTechDetail(context);
        });
      },
      disposeViewModel: false,
      builder: (_, LabTechViewModel model, __) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 50.w),
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Center(
                  child: TextView(
                    text: 'Settings',
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Divider(color: AppColor.grey.withOpacity(.3)),
                SizedBox(height: 30.h),
                Center(
                  child: Column(
                    children: [
                      model
                                  .getLabTechDetailResponseModel
                                  ?.original
                                  ?.profileImage !=
                              null
                          ? ClipOval(
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(68),
                              child: Image.network(
                                model
                                        .getLabTechDetailResponseModel!
                                        .original!
                                        .profileImage!
                                        .contains('https')
                                    ? '${model.getLabTechDetailResponseModel?.original?.profileImage}'
                                    : 'https://res.cloudinary.com/dnv6yelbr/image/upload/v1747827538/${model.getLabTechDetailResponseModel?.original?.profileImage}',
                                fit: BoxFit.cover,
                                errorBuilder:
                                    (context, error, stackTrace) =>
                                        shimmerViewPharm(),
                              ),
                            ),
                          )
                          : Stack(
                            fit: StackFit.loose,
                            children: [
                              Positioned(
                                bottom: 0,
                                right: 0,
                                left: 0,
                                child: SvgPicture.asset(AppImage.edit),
                              ),
                              Container(
                                padding: EdgeInsets.all(60.w),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColor.oneKindgrey,
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                left: 96.0,
                                child: SvgPicture.asset(
                                  AppImage.edit,
                                  width: 20.w,
                                  height: 20.h,
                                ),
                              ),
                            ],
                          ),
                      SizedBox(height: 20.h),
                      TextView(
                        text:
                            '${model.getLabTechDetailResponseModel?.original?.firstName?.capitalize() ?? ''} ${model.getLabTechDetailResponseModel?.original?.lastName?.capitalize() ?? ''}',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextView(
                        text:
                            model
                                .getLabTechDetailResponseModel
                                ?.original
                                ?.email ??
                            '',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.grey,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                moreContainerWidget(
                  image: AppImage.person,
                  borderColor: AppColor.lightgrey,
                  color: AppColor.black,
                  text: 'Edit Profile',
                  onTap:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LabEditProfileScreen(),
                        ),
                      ),
                ),
                SizedBox(height: 20.h),

                // moreContainerWidget(
                //   image: AppImage.chat,
                //   borderColor: AppColor.lightgrey,
                //   color: AppColor.black,
                //   text: 'Chat',
                //   onTap:
                //       () => Navigator.of(context).push(
                //         MaterialPageRoute(
                //           builder: (context) => LabTechMessageListScreen(),
                //         ),
                //       ),
                // ),
                // SizedBox(height: 20.h),
                moreContainerWidget(
                  image: AppImage.diagnosis,
                  borderColor: AppColor.lightgrey,
                  color: AppColor.black,
                  text: 'Diagnosis',
                  onTap:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LaboratoryDiagnosisScreen(),
                        ),
                      ),
                ),
                SizedBox(height: 20.h),
                moreContainerWidget(
                  image: AppImage.walleta,
                  borderColor: AppColor.lightgrey,
                  color: AppColor.black,
                  text: 'Wallet',
                  onTap:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => LabTechWalletScreen(),
                        ),
                      ),
                ),
                SizedBox(height: 20.h),
                moreContainerWidget(
                  image: AppImage.results,
                  borderColor: AppColor.lightgrey,
                  color: AppColor.black,
                  text: 'Results',
                  onTap:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ResultsScreen(),
                        ),
                      ),
                ),
                SizedBox(height: 20.h),
                moreContainerWidget(
                  image: AppImage.notification,
                  borderColor: AppColor.lightgrey,
                  color: AppColor.black,
                  text: 'Notification',
                  onTap:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => NotificationScreen(),
                        ),
                      ),
                ),

                SizedBox(height: 20.h),
                moreContainerWidget(
                  image: AppImage.help,
                  borderColor: AppColor.lightgrey,
                  color: AppColor.black,
                  text: 'Help & Support',
                  onTap:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HelpAndSupportScreen(),
                        ),
                      ),
                ),
                SizedBox(height: 40.h),
                moreContainerWidget(
                  image: AppImage.help,
                  borderColor: AppColor.red,
                  color: AppColor.red,
                  text: 'Logout',
                  onTap: () {
                    SharedPreferencesService.instance.logOut('care-giver');
                  },
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        );
      },
    );
  }

  moreContainerWidget({
    required String image,
    required String text,
    required Function() onTap,
    required Color borderColor,
    required Color color,
  }) => GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          text == 'Logout'
              ? Icon(Icons.logout, color: AppColor.red, size: 22.sp)
              : SvgPicture.asset(
                image,
                color: AppColor.darkindgrey,
                width: 20.w,
                height: 20.h,
              ),
          SizedBox(width: 20.w),
          TextView(
            text: text,
            textStyle: GoogleFonts.gabarito(
              color: color,
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          Spacer(),
          text == 'Logout'
              ? SizedBox.shrink()
              : Icon(
                Icons.keyboard_arrow_right_sharp,
                color: AppColor.darkindgrey,
                size: 22.sp,
              ),
        ],
      ),
    ),
  );
}
