// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:doc_lab_pharm/core/connect_end/model/checkoutentitymodel.dart';
import 'package:doc_lab_pharm/core/connect_end/model/get_doc_detail_response_model/get_doc_detail_response_model.dart';
import 'package:doc_lab_pharm/main.dart';
import 'package:doc_lab_pharm/ui/app_assets/app_color.dart';
import 'package:doc_lab_pharm/ui/app_assets/app_utils.dart';
import 'package:doc_lab_pharm/ui/app_assets/constant.dart';
import 'package:doc_lab_pharm/ui/screens/dashboard/home/cart_screen.dart';
import 'package:doc_lab_pharm/ui/widget/button_widget.dart';
import 'package:doc_lab_pharm/ui/widget/text_form_widget.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../app_assets/app_validatiion.dart';
import '../../../widget/text_widget.dart';

class PatientDetailComplaintScreen extends StatefulWidget {
  PatientDetailComplaintScreen({
    super.key,
    required this.bookType,
    required this.docId,
    required this.serviceId,
    required this.slotId,
    required this.doctor,
    required this.price,
  });
  String? bookType;
  String? price;
  String? doctor;
  String? docId;
  num? serviceId;
  AvailableSlots? slotId;

  @override
  State<PatientDetailComplaintScreen> createState() =>
      _PatientDetailComplaintScreenState();
}

class _PatientDetailComplaintScreenState
    extends State<PatientDetailComplaintScreen> {
  TextEditingController fullname = TextEditingController();

  TextEditingController age = TextEditingController();

  TextEditingController gender = TextEditingController();

  TextEditingController complaint = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool onTap = false;
  List<String> genderList = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => locator<AuthViewModel>(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          model.getPatientDetail(context);
          if (widget.bookType == 'book') {
            fullname.text =
                '${model.getUserResponseModel?.data?.firstName?.capitalize()} ${model.getUserResponseModel?.data?.lastName?.capitalize()}';
          }
        });
      },
      disposeViewModel: false,
      builder: (_, AuthViewModel model, __) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 20.w),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextView(
                        text: 'Patient Details',
                        textStyle: GoogleFonts.dmSans(
                          color: AppColor.black,
                          fontSize: 20.0.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 20.h, width: 20.w),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  TextFormWidget(
                    hint: 'Full name',
                    border: 10,
                    isFilled: true,
                    readOnly: widget.bookType == 'book' ? true : false,
                    fillColor: AppColor.oneKindgrey,
                    borderColor: AppColor.transparent,
                    controller: fullname,
                    validator: AppValidator.validateString(),
                  ),
                  SizedBox(height: 20.h),
                  TextFormWidget(
                    hint: 'Age',
                    border: 10,
                    isFilled: true,
                    controller: age,
                    fillColor: AppColor.oneKindgrey,
                    borderColor: AppColor.transparent,
                    keyboardType: TextInputType.number,
                    validator: AppValidator.validateString(),
                  ),
                  SizedBox(height: 20.h),
                  TextFormWidget(
                    hint: 'Gender',
                    border: 10,
                    isFilled: true,
                    controller: gender,
                    fillColor: AppColor.oneKindgrey,
                    borderColor: AppColor.transparent,
                    validator: AppValidator.validateString(),
                    suffixWidget: PopupMenuButton<String>(
                      onSelected: (String item) {
                        // Handle the selected menu item
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          ...genderList.map(
                            (list) => PopupMenuItem<String>(
                              value: list,
                              child: TextView(
                                text: list,
                                textStyle: GoogleFonts.gabarito(
                                  color: AppColor.darkindgrey,
                                  fontSize: 15.40.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              onTap: () {
                                gender.text = list;
                                setState(() {});
                              },
                            ),
                          ),
                        ];
                      },
                      child: Icon(
                        Icons.arrow_drop_down_sharp,
                        size: 24.30.sp,
                        color: AppColor.darkindgrey,
                      ), // Optional: Customize the button's icon
                    ),
                  ),
                  SizedBox(height: 20.h),
                  TextFormWidget(
                    hint: 'Write your complaint',
                    border: 10,
                    isFilled: true,
                    fillColor: AppColor.oneKindgrey,
                    borderColor: AppColor.transparent,
                    maxline: 4,
                    controller: complaint,
                    validator: AppValidator.validateString(),
                  ),
                  SizedBox(height: 140.h),
                  ButtonWidget(
                    buttonText: 'Add to Cart',
                    buttonColor:
                        !onTap
                            ? AppColor.primary1
                            : AppColor.primary1.withOpacity(.5),
                    buttonBorderColor: AppColor.transparent,
                    textStyle: GoogleFonts.dmSans(
                      color: AppColor.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    onPressed:
                        !onTap
                            ? () async {
                              if (formKey.currentState!.validate()) {
                                onTap = true;
                                setState(() {});
                                await box.add(
                                  CheckoutEntityModel(
                                    serviceType: 'consult',
                                    serviceId: widget.serviceId!,
                                    doctorId: int.parse(widget.docId!),
                                    slotId:
                                        widget.slotId == null
                                            ? 0
                                            : widget.slotId!.id!,
                                    complaint: complaint.text.trim(),
                                    amount: widget.price!,
                                    date: widget.slotId!.availableDate!,
                                    time: widget.slotId!.availableTime!,
                                    doctor: widget.doctor!,
                                    productId: 0,
                                    qty: 0,
                                    name: 'Book Doctor',
                                  ),
                                );
                                AppUtils.snackbar(
                                  context,
                                  message: 'Consultancy added to Cart..!',
                                );
                              }
                            }
                            : () {},
                  ),
                  SizedBox(height: 20.h),
                  ButtonWidget(
                    buttonText: 'Continue',
                    buttonColor: AppColor.primary1,
                    buttonBorderColor: AppColor.transparent,
                    textStyle: GoogleFonts.dmSans(
                      color: AppColor.white,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CartScreen()),
                      );
                    },
                  ),

                  SizedBox(height: 50.h),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
