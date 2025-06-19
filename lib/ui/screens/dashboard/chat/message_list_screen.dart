import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../../core/core_folder/app/app.router.dart';
import '../../../../main.dart';
import '../../../app_assets/app_image.dart';
import '../../../app_assets/constant.dart';
import '../../../widget/text_form_widget.dart';
import '../../../widget/text_widget.dart';

class MessageListScreen extends StatelessWidget {
  const MessageListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => locator<AuthViewModel>(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          model.hasLoadedIndexConversation = true;
          model.receiveIndexConversationOnce();
        });
      },
      disposeViewModel: false,
      fireOnViewModelReadyOnce: true,
      builder: (_, AuthViewModel model, __) {
        return Scaffold(
          backgroundColor: AppColor.white,
          resizeToAvoidBottomInset: true,
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 50.w, left: 22.w, right: 22.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
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
                      label: 'Search name',
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
                      onChange: (p0) {
                        if (p0.length > 1) {
                          model.debouncer.run(() {});
                        }
                        model.query = p0;
                        model.notifyListeners();
                      },
                    ),
                  ],
                ),
              ),

              Expanded(
                child: RefreshIndicator(
                  onRefresh: () async {
                    await model.getChatIndexReload(); // Trigger refresh
                  },
                  child: SizedBox(
                    height: isTablet ? 640.h : 540.h,
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
                            ..._buildChatList(model)
                          else
                            SizedBox(),
                        ],
                      ),
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

  List<Widget> _buildChatList(AuthViewModel model) {
    final data =
        model
            .getMessageIndexResponseModelList!
            .getMessageIndexResponseModelList!;

    final filtered =
        model.query.isNotEmpty
            ? data.where(
              (e) =>
                  e.contactName?.toLowerCase().contains(
                    model.query.toLowerCase(),
                  ) ??
                  false,
            )
            : data;

    return filtered
        .map(
          (o) => GestureDetector(
            onTap:
                () => navigate.navigateTo(
                  Routes.chatScreen,
                  arguments: ChatScreenArguments(
                    id: o.conversationId.toString(),
                    messageModel: o,
                  ),
                ),
            child: Container(
              margin: EdgeInsets.only(bottom: 20.w),
              padding: EdgeInsets.symmetric(vertical: 12.w, horizontal: 6.w),
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.greylight),
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
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextView(
                          text: o.contactName?.capitalize() ?? '',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.darkindgrey,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        TextView(
                          text: o.lastMessage ?? '',
                          maxLines: 1,
                          textOverflow: TextOverflow.ellipsis,
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.lightgrey,
                            fontSize: 12.20.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextView(
                    text: getWeekdayAbbreviation(o.lastMessageTime ?? ''),
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.lightgrey,
                      fontSize: 12.20.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(width: 12.w),
                ],
              ),
            ),
          ),
        )
        .toList();
  }
}
