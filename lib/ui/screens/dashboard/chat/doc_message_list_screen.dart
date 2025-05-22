import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/core/core_folder/app/app.locator.dart';
import 'package:my_doc_lab/core/core_folder/app/app.router.dart';
import 'package:my_doc_lab/main.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/view_model/doc_view_model.dart';
import '../../../app_assets/app_image.dart';
import '../../../app_assets/constant.dart';
import '../../../widget/text_form_widget.dart';
import '../../../widget/text_widget.dart';

class DoctorMessageListScreen extends StatelessWidget {
  const DoctorMessageListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    return ViewModelBuilder<DocViewModel>.reactive(
      viewModelBuilder: () => locator<DocViewModel>(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          model.getChatIndex();
          print('scren:::${model.session.chatsData}');
        });
      },
      disposeViewModel: false,
      fireOnViewModelReadyOnce: true,
      builder: (_, DocViewModel model, __) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50.w, left: 22.w, right: 22.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.w),
                    TextView(
                      text: 'Message',
                      textStyle: GoogleFonts.gabarito(
                        color: AppColor.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Divider(color: AppColor.greylight),
                    SizedBox(height: 10.w),
                    TextFormWidget(
                      label: 'See conservation',
                      // hint: 'Email Address',
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

                      // validator: AppValidator.validateEmail(),
                    ),
                  ],
                ),
              ),
              RefreshIndicator(
                onRefresh: () async {
                  await model.getChatIndexReload(); // Trigger refresh
                },
                child: SizedBox(
                  height: isTablet ? 640.h : 530.h,
                  child: SingleChildScrollView(
                    physics: AlwaysScrollableScrollPhysics(),
                    padding: EdgeInsets.symmetric(
                      vertical: 20.w,
                      horizontal: 22.w,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 2.h),
                        if (model.isLoading)
                          ...List.generate(10, (i) => shimmerChatView())
                        else if (model.getMessageIndexResponseModelList !=
                                null &&
                            model
                                .getMessageIndexResponseModelList!
                                .getMessageIndexResponseModelList!
                                .isNotEmpty)
                          ...model
                              .getMessageIndexResponseModelList!
                              .getMessageIndexResponseModelList!
                              .map(
                                (o) => GestureDetector(
                                  onTap:
                                      () => navigate.navigateTo(
                                        Routes.doctorChatScreen,
                                        arguments: DoctorChatScreenArguments(
                                          id: o.conversationId.toString(),
                                          messageModel: o,
                                        ),
                                      ),
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 20.w),
                                    padding: EdgeInsets.symmetric(
                                      vertical: 12.w,
                                      horizontal: 6.w,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: AppColor.greylight,
                                      ),
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(24.80.w),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColor.friendlyPrimary,
                                          ),
                                        ),
                                        SizedBox(width: 20.w),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TextView(
                                              text:
                                                  o.contactName?.capitalize() ??
                                                  '',
                                              textStyle: GoogleFonts.gabarito(
                                                color: AppColor.darkindgrey,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 230.w,
                                              child: TextView(
                                                text: o.lastMessage ?? '',
                                                maxLines: 1,
                                                textOverflow:
                                                    TextOverflow.ellipsis,
                                                textStyle: GoogleFonts.gabarito(
                                                  color: AppColor.lightgrey,
                                                  fontSize: 12.20.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        TextView(
                                          text: getWeekdayAbbreviation(
                                            o.lastMessageTime ?? '',
                                          ),
                                          textStyle: GoogleFonts.gabarito(
                                            color: AppColor.lightgrey,
                                            fontSize: 12.20.sp,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                        else
                          SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
