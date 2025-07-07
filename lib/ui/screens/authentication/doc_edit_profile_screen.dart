// ignore_for_file: must_be_immutable, await_only_futures

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/core/connect_end/model/update_doctor_entity_model.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_validatiion.dart';
import 'package:my_doc_lab/ui/app_assets/constant.dart';
import 'package:my_doc_lab/ui/widget/button_widget.dart';
import 'package:my_doc_lab/ui/widget/text_form_widget.dart';
import 'package:my_doc_lab/ui/widget/text_widget.dart';
import 'package:stacked/stacked.dart';

import '../../../core/connect_end/view_model/doc_view_model.dart';
import '../../../core/core_folder/app/app.locator.dart';
import '../../app_assets/app_image.dart';

class DocEditProfileScreen extends StatelessWidget {
  DocEditProfileScreen({super.key});

  TextEditingController firstnameTextController = TextEditingController();
  TextEditingController lastnameTextController = TextEditingController();
  TextEditingController aboutController = TextEditingController();
  TextEditingController expController = TextEditingController();
  TextEditingController certificationController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailTextController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DocViewModel>.reactive(
      viewModelBuilder: () => locator<DocViewModel>(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await model.getDoctorsDetail(context);
          firstnameTextController.text =
              model.getDocDetailResponseModel?.original?.firstName ?? '';
          lastnameTextController.text =
              model.getDocDetailResponseModel?.original?.lastName ?? '';
          aboutController.text =
              model.getDocDetailResponseModel?.original?.about ?? '';
          expController.text =
              model.getDocDetailResponseModel?.original?.experience ?? '';
          certificationController.text =
              model.getDocDetailResponseModel?.original?.certifications ?? '';
          roleController.text =
              model.getDocDetailResponseModel?.original?.speciality ?? '';
          phoneController.text =
              model.getDocDetailResponseModel?.original?.phone ?? '';
          emailTextController.text =
              model.getDocDetailResponseModel?.original?.email ?? '';
        });
      },
      disposeViewModel: false,
      builder: (_, DocViewModel model, __) {
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
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back_ios_outlined, size: 20.sp),
                      ),
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
                                    .getDocDetailResponseModel
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
                                              .getDocDetailResponseModel!
                                              .original!
                                              .profileImage!
                                              .contains('https')
                                          ? model
                                                  .getDocDetailResponseModel
                                                  ?.original
                                                  ?.profileImage ??
                                              ""
                                          : 'https://res.cloudinary.com/dnv6yelbr/image/upload/v1747827538/${model.getDocDetailResponseModel?.original?.profileImage}',
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
                  // TextFormWidget(
                  //   hint: 'Age',
                  //   border: 10,
                  //   isFilled: true,
                  //   fillColor: AppColor.oneKindgrey,
                  //   borderColor: AppColor.transparent,
                  // ),
                  // SizedBox(height: 20.h),
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
                    hint: 'Specialization',
                    border: 10,
                    isFilled: true,
                    fillColor: AppColor.oneKindgrey,
                    borderColor: AppColor.transparent,
                    controller: roleController,
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
                                      .getDocDetailResponseModel
                                      ?.original
                                      ?.profileImage !=
                                  null ||
                          formKey.currentState!.validate() &&
                              model.postUserVerificationCloudResponse != null) {
                        model.updateDoctorsDetail(
                          context,
                          id:
                              model.getDocDetailResponseModel?.original?.id
                                  .toString(),
                          update: UpdateDoctorEntityModel(
                            firstName: firstnameTextController.text.trim(),
                            lastName: lastnameTextController.text.trim(),
                            phoneNumber: phoneController.text.trim(),
                            email: emailTextController.text.trim(),
                            speciality: roleController.text.trim(),
                            certifications: certificationController.text.trim(),
                            experience: expController.text.trim(),
                            profileImage:
                                model
                                    .postUserVerificationCloudResponse
                                    ?.secureUrl ??
                                model
                                    .getDocDetailResponseModel
                                    ?.original
                                    ?.profileImage,
                            about: aboutController.text.trim(),
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
