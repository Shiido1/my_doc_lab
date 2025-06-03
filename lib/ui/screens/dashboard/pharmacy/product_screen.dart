import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/constant.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/view_model/pharm_view_model.dart';
import '../../../app_assets/app_image.dart';
import '../../../widget/text_form_widget.dart';
import '../../../widget/text_widget.dart';

class PharmacyProductScreen extends StatefulWidget {
  const PharmacyProductScreen({super.key});

  @override
  State<PharmacyProductScreen> createState() => _PharmacyProductScreenState();
}

class _PharmacyProductScreenState extends State<PharmacyProductScreen> {
  String tab = 'All';

  List<String> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    return ViewModelBuilder<PharmViewModel>.reactive(
      viewModelBuilder: () => PharmViewModel(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          model.getPharmMedicine();
        });
      },
      disposeViewModel: false,
      builder: (_, PharmViewModel model, __) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: Padding(
            padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 10.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  Center(
                    child: TextView(
                      text: 'Product List',
                      textStyle: GoogleFonts.gabarito(
                        color: AppColor.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Divider(color: AppColor.funnyLookingGrey.withOpacity(.4)),
                  SizedBox(height: 20.w),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormWidget(
                          label: 'Search for products',
                          // hint: 'Email Address',
                          border: 10,
                          isFilled: true,
                          fillColor: AppColor.transparent,
                          onChange: (p0) {
                            model.pharmMedQuery = p0;
                            print('print my  guy ${model.pharmMedQuery}');
                            model.notifyListeners();
                          },
                          prefixWidget: Padding(
                            padding: EdgeInsets.all(14.w),
                            child: SvgPicture.asset(
                              AppImage.search,
                              height: 20.h,
                              width: 20.w,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed:
                            () => model.modalBottomSheetAddCategory(context),
                        icon: Icon(
                          Icons.add,
                          size: 30.sp,
                          color: AppColor.primary1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: () => model.modalBottomSheetAddMedicine(context),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        width: 80.w,
                        padding: EdgeInsets.symmetric(
                          vertical: 5.w,
                          horizontal: 10.w,
                        ),
                        decoration: BoxDecoration(
                          // ignore: deprecated_member_use
                          color: AppColor.primary1,

                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.add_circle_outline_outlined,
                              color: AppColor.white,
                              size: 16.sp,
                            ),
                            SizedBox(width: 10.w),
                            TextView(
                              text: 'Add',
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.white,
                                fontSize: 13.0.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20.h),

                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: isTablet ? 380.h : 480.h,
                    ),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColor.greyIt.withOpacity(.05),
                        border: Border.all(
                          color: AppColor.greyIt.withOpacity(.3),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              right: 20.w,
                              left: 20.w,
                              top: 4.w,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                TextView(
                                  text: 'Name',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.grey2,
                                    fontSize: 16.8.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                TextView(
                                  text: 'Price',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.grey2,
                                    fontSize: 16.8.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                TextView(
                                  text: 'Qty',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.grey2,
                                    fontSize: 16.8.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextView(
                                  text: 'Action',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.grey2,
                                    fontSize: 16.8.sp,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(color: AppColor.greyIt.withOpacity(.3)),
                          Flexible(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  if (model.getPharmMedResponseModelList !=
                                          null &&
                                      model
                                          .getPharmMedResponseModelList!
                                          .getPharmMedResponseModelList!
                                          .isNotEmpty)
                                    if (model.pharmMedQuery != '')
                                      ...model
                                          .getPharmMedResponseModelList!
                                          .getPharmMedResponseModelList!
                                          .where(
                                            (w) =>
                                                w.name!.toLowerCase().contains(
                                                  model.pharmMedQuery
                                                      .toLowerCase(),
                                                ),
                                          )
                                          .map(
                                            (o) => Padding(
                                              padding: EdgeInsets.only(
                                                bottom: 10.w,
                                                left: 6.0.w,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  SizedBox(
                                                    width: 130.w,
                                                    child: TextView(
                                                      text: o.name ?? '',
                                                      maxLines: 1,
                                                      textOverflow:
                                                          TextOverflow.ellipsis,
                                                      textStyle:
                                                          GoogleFonts.gabarito(
                                                            color:
                                                                AppColor.grey2,
                                                            fontSize: 16.sp,
                                                            letterSpacing: 0,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 77.12.w,
                                                    child: TextView(
                                                      text:
                                                          '${getCurrency()}${oCcyMeds.format(double.parse('${o.price}'))}',
                                                      maxLines: 1,
                                                      textOverflow:
                                                          TextOverflow.ellipsis,
                                                      textStyle: TextStyle(
                                                        color: AppColor.grey2,
                                                        fontSize: 16.sp,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 20.w),
                                                  TextView(
                                                    text: '${o.quantity ?? ''}',
                                                    textStyle:
                                                        GoogleFonts.gabarito(
                                                          color: AppColor.grey2,
                                                          fontSize: 16.sp,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                  ),
                                                  SizedBox(width: 20.w),
                                                  Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          model.modalBottomSheetAddMedicine(
                                                            context,
                                                            update: true,
                                                            id: o.id.toString(),
                                                          );
                                                          model
                                                              .notifyListeners();
                                                        },
                                                        child: SvgPicture.asset(
                                                          AppImage.edit,
                                                          width: 20.w,
                                                          height: 20.h,
                                                          color: AppColor.black,
                                                        ),
                                                      ),
                                                      SizedBox(width: 10.w),
                                                      IconButton(
                                                        onPressed: () {
                                                          model.deleteProductMedDialogBox(
                                                            context,
                                                            prodId:
                                                                o.id.toString(),
                                                          );
                                                          model
                                                              .notifyListeners();
                                                        },
                                                        icon: Icon(
                                                          Icons
                                                              .remove_circle_outline_outlined,
                                                          color:
                                                              AppColor.fineRed,
                                                          size: 22.sp,
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  SizedBox(height: 5.0.w),
                                                ],
                                              ),
                                            ),
                                          )
                                    else
                                      ...model
                                          .getPharmMedResponseModelList!
                                          .getPharmMedResponseModelList!
                                          .map(
                                            (o) => Padding(
                                              padding: EdgeInsets.only(
                                                bottom: 10.w,
                                                left: 6.0.w,
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  SizedBox(
                                                    width: 130.w,
                                                    child: TextView(
                                                      text: o.name ?? '',
                                                      maxLines: 1,
                                                      textOverflow:
                                                          TextOverflow.ellipsis,
                                                      textStyle:
                                                          GoogleFonts.gabarito(
                                                            color:
                                                                AppColor.grey2,
                                                            fontSize: 16.sp,
                                                            letterSpacing: 0,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                          ),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 77.12.w,
                                                    child: TextView(
                                                      text:
                                                          '${getCurrency()}${oCcyMeds.format(double.parse('${o.price}'))}',
                                                      maxLines: 1,
                                                      textOverflow:
                                                          TextOverflow.ellipsis,
                                                      textStyle: TextStyle(
                                                        color: AppColor.grey2,
                                                        fontSize: 16.sp,
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 20.w),
                                                  TextView(
                                                    text: '${o.quantity ?? ''}',
                                                    textStyle:
                                                        GoogleFonts.gabarito(
                                                          color: AppColor.grey2,
                                                          fontSize: 16.sp,
                                                          letterSpacing: 0,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        ),
                                                  ),
                                                  SizedBox(width: 20.w),
                                                  Row(
                                                    children: [
                                                      GestureDetector(
                                                        onTap: () {
                                                          model.modalBottomSheetAddMedicine(
                                                            context,
                                                            update: true,
                                                            id: o.id.toString(),
                                                          );
                                                          model
                                                              .notifyListeners();
                                                        },
                                                        child: SvgPicture.asset(
                                                          AppImage.edit,
                                                          width: 20.w,
                                                          height: 20.h,
                                                          color: AppColor.black,
                                                        ),
                                                      ),
                                                      SizedBox(width: 10.w),
                                                      IconButton(
                                                        onPressed: () {
                                                          model.deleteProductMedDialogBox(
                                                            context,
                                                            prodId:
                                                                o.id.toString(),
                                                          );
                                                          model
                                                              .notifyListeners();
                                                        },
                                                        icon: Icon(
                                                          Icons
                                                              .remove_circle_outline_outlined,
                                                          color:
                                                              AppColor.fineRed,
                                                          size: 22.sp,
                                                        ),
                                                      ),
                                                    ],
                                                  ),

                                                  SizedBox(height: 5.0.w),
                                                ],
                                              ),
                                            ),
                                          ),
                                  SizedBox(height: 20.h),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
