// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_image.dart';
import 'package:my_doc_lab/ui/app_assets/constant.dart';
import 'package:my_doc_lab/ui/widget/button_widget.dart';
import 'package:my_doc_lab/ui/widget/text_form_widget.dart';
import 'package:my_doc_lab/ui/widget/text_widget.dart';
import 'package:stacked/stacked.dart';

import '../../../core/connect_end/model/update_pharm_entity_model.dart';
import '../../../core/connect_end/view_model/pharm_view_model.dart';
import '../../../core/core_folder/app/app.locator.dart';
import '../../app_assets/app_validatiion.dart';

class PharmEditProfileScreen extends StatelessWidget {
  PharmEditProfileScreen({super.key});

  TextEditingController firstnameTextController = TextEditingController();
  TextEditingController lastnameTextController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController expController = TextEditingController();
  TextEditingController certificationController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  TextEditingController worktimeTextController = TextEditingController();
  TextEditingController addressTextController = TextEditingController();
  TextEditingController cityTextController = TextEditingController();
  TextEditingController stateTextController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PharmViewModel>.reactive(
      viewModelBuilder: () => locator<PharmViewModel>(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          model.getPharmacistDetail(context);
          firstnameTextController.text =
              model.getPharmacyDetailResponseModel?.original?.firstName ?? '';
          lastnameTextController.text =
              model.getPharmacyDetailResponseModel?.original?.lastName ?? '';
          aboutController.text =
              model.getPharmacyDetailResponseModel?.original?.about ?? '';
          worktimeTextController.text =
              model.getPharmacyDetailResponseModel?.original?.worktime ?? '';
          certificationController.text =
              model.getPharmacyDetailResponseModel?.original?.certifications ??
              '';
          phoneController.text =
              model.getPharmacyDetailResponseModel?.original?.phone ?? '';
          emailTextController.text =
              model.getPharmacyDetailResponseModel?.original?.email ?? '';
          cityTextController.text =
              model.getPharmacyDetailResponseModel?.original?.city ?? '';
          addressTextController.text =
              model.getPharmacyDetailResponseModel?.original?.address ?? '';
          stateTextController.text =
              model.getPharmacyDetailResponseModel?.original?.state ?? '';
        });
      },
      disposeViewModel: false,
      builder: (_, PharmViewModel model, __) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 50.w),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: 'Edit Profile',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 20.h, width: 20.w),
                    ],
                  ),
                  Divider(color: AppColor.grey.withOpacity(.3)),
                  SizedBox(height: 30.h),
                  GestureDetector(
                    onTap: () => model.pickImage(context),
                    child:
                        model.image != null
                            ? ClipOval(
                              child: Image.file(
                                model.image!,
                                width: 130,
                                height: 130,
                                fit: BoxFit.cover,
                              ),
                            )
                            : model
                                    .getPharmacyDetailResponseModel
                                    ?.original
                                    ?.profileImage !=
                                null
                            ? Stack(
                              children: [
                                ClipOval(
                                  child: SizedBox.fromSize(
                                    size: const Size.fromRadius(68),
                                    child: Image.network(
                                      model
                                              .getPharmacyDetailResponseModel!
                                              .original!
                                              .profileImage!
                                              .contains('https')
                                          ? model
                                                  .getPharmacyDetailResponseModel
                                                  ?.original
                                                  ?.profileImage ??
                                              ""
                                          : 'https://res.cloudinary.com/dnv6yelbr/image/upload/v1747827538/${model.getPharmacyDetailResponseModel?.original?.profileImage}',
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              shimmerViewPharm(),
                                    ),
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
                  ),

                  SizedBox(height: 20.h),

                  TextFormWidget(
                    hint: 'First name',
                    border: 10,
                    isFilled: true,
                    fillColor: AppColor.oneKindgrey,
                    borderColor: AppColor.transparent,
                    controller: firstnameTextController,
                    validator: AppValidator.validateString(),
                  ),
                  SizedBox(height: 20.h),
                  TextFormWidget(
                    hint: 'Last name',
                    border: 10,
                    isFilled: true,
                    fillColor: AppColor.oneKindgrey,
                    borderColor: AppColor.transparent,
                    controller: lastnameTextController,
                    validator: AppValidator.validateString(),
                  ),
                  SizedBox(height: 20.h),
                  TextFormWidget(
                    hint: 'Age',
                    border: 10,
                    isFilled: true,
                    fillColor: AppColor.oneKindgrey,
                    borderColor: AppColor.transparent,
                  ),
                  SizedBox(height: 20.h),
                  TextFormWidget(
                    hint: 'Email Address',
                    border: 10,
                    isFilled: true,
                    fillColor: AppColor.oneKindgrey,
                    borderColor: AppColor.transparent,
                    controller: emailTextController,
                    validator: AppValidator.validateEmail(),
                  ),
                  SizedBox(height: 20.h),
                  TextFormWidget(
                    hint: 'Phone',
                    border: 10,
                    isFilled: true,
                    fillColor: AppColor.oneKindgrey,
                    borderColor: AppColor.transparent,
                    controller: phoneController,
                    validator: AppValidator.validateInt(),
                  ),
                  SizedBox(height: 20.h),
                  TextFormWidget(
                    hint: 'Certification',
                    border: 10,
                    isFilled: true,
                    fillColor: AppColor.oneKindgrey,
                    borderColor: AppColor.transparent,
                    controller: certificationController,
                    validator: AppValidator.validateString(),
                  ),
                  SizedBox(height: 20.h),
                  TextFormWidget(
                    hint: 'Experience',
                    border: 10,
                    isFilled: true,
                    fillColor: AppColor.oneKindgrey,
                    borderColor: AppColor.transparent,
                    controller: expController,
                    validator: AppValidator.validateString(),
                  ),
                  SizedBox(height: 20.h),
                  TextFormWidget(
                    hint: 'Work Time',
                    border: 10,
                    isFilled: true,
                    fillColor: AppColor.oneKindgrey,
                    borderColor: AppColor.transparent,
                    controller: worktimeTextController,
                    validator: AppValidator.validateString(),
                  ),
                  SizedBox(height: 20.h),
                  TextFormWidget(
                    hint: 'City',
                    border: 10,
                    isFilled: true,
                    fillColor: AppColor.oneKindgrey,
                    borderColor: AppColor.transparent,
                    controller: cityTextController,
                    validator: AppValidator.validateString(),
                  ),
                  SizedBox(height: 20.h),
                  TextFormWidget(
                    hint: 'State',
                    border: 10,
                    isFilled: true,
                    fillColor: AppColor.oneKindgrey,
                    borderColor: AppColor.transparent,
                    controller: stateTextController,
                    validator: AppValidator.validateString(),
                  ),
                  SizedBox(height: 20.h),
                  TextFormWidget(
                    hint: 'Address',
                    border: 10,
                    isFilled: true,
                    fillColor: AppColor.oneKindgrey,
                    borderColor: AppColor.transparent,
                    controller: addressTextController,
                    validator: AppValidator.validateString(),
                  ),
                  SizedBox(height: 20.h),
                  TextFormWidget(
                    hint: 'About',
                    border: 10,
                    isFilled: true,
                    maxline: 5,
                    fillColor: AppColor.oneKindgrey,
                    borderColor: AppColor.transparent,
                    controller: aboutController,
                    validator: AppValidator.validateString(),
                  ),
                  SizedBox(height: 60.h),
                  ButtonWidget(
                    buttonText: 'Save',
                    buttonColor: AppColor.primary1,
                    buttonBorderColor: AppColor.transparent,
                    textStyle: GoogleFonts.dmSans(
                      color: AppColor.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate() &&
                              model
                                      .getPharmacyDetailResponseModel
                                      ?.original
                                      ?.profileImage !=
                                  null ||
                          model.postUserVerificationCloudResponse != null) {
                        model.updatePharmDetail(
                          context,
                          id:
                              model.getPharmacyDetailResponseModel?.original?.id
                                  .toString(),
                          update: UpdatePharmEntityModel(
                            firstName: firstnameTextController.text.trim(),
                            lastName: lastnameTextController.text.trim(),
                            phoneNumber: phoneController.text.trim(),
                            email: emailTextController.text.trim(),
                            certifications: certificationController.text.trim(),
                            experience: expController.text.trim(),
                            profileImage:
                                model
                                    .postUserVerificationCloudResponse
                                    ?.secureUrl,
                            address: addressTextController.text.trim(),
                            city: cityTextController.text.trim(),
                            worktime: worktimeTextController.text.trim(),
                            state: addressTextController.text.trim(),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
