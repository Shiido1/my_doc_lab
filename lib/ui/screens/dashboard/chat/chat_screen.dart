import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_image.dart';
import 'package:my_doc_lab/ui/app_assets/constant.dart';
import 'package:my_doc_lab/ui/screens/dashboard/chat/video_chat_agora/video_chat_screen.dart';
import 'package:my_doc_lab/ui/widget/text_widget.dart';
import 'package:stacked/stacked.dart' show ViewModelBuilder;

import '../../../../core/connect_end/model/get_message_index_response_model/get_message_index_response_model.dart';
import '../../../../core/connect_end/model/send_message_entity_model.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';

// ignore: must_be_immutable
class ChatScreen extends StatefulWidget {
  ChatScreen({super.key, required this.id, required this.messageModel});
  GetMessageIndexResponseModel? messageModel;
  String? id;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isContainedText = false;

  @override
  Widget build(BuildContext context) {
    final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => AuthViewModel(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          model.hasLoadedConversation = true;
          model.receiveConversationOnce(widget.id!);
        });
      },
      onDispose: (viewModel) {
        viewModel.hasLoadedConversation = false;
      },
      disposeViewModel: false,
      builder: (_, AuthViewModel model, __) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 20.w),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(height: 10.h),
                            SizedBox(
                              width: 200.w,
                              child: TextView(
                                text:
                                    widget.messageModel?.contactName
                                        ?.capitalize() ??
                                    '',
                                textStyle: GoogleFonts.dmSans(
                                  color: AppColor.black,
                                  fontSize: 20.0.sp,
                                  fontWeight: FontWeight.w500,
                                ),

                                maxLines: 1,
                                textOverflow: TextOverflow.fade,
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 2.w),
                                  padding: EdgeInsets.all(4.w),
                                  decoration: BoxDecoration(
                                    color: AppColor.primary1,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(width: 6.w),
                                TextView(
                                  text: 'Online',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.black,
                                    fontSize: 14.0.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding: EdgeInsets.only(top: 10.w, right: 20.w),
                          child: GestureDetector(
                            onTap:
                                () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder:
                                        (context) => VideoChatScreen(
                                          conversationId: int.parse(
                                            widget.messageModel!.conversationId
                                                .toString(),
                                          ),
                                          receiverId: int.parse(
                                            widget.messageModel!.contactId
                                                .toString(),
                                          ),
                                          receiverType:
                                              widget.messageModel!.contactType,
                                        ),
                                  ),
                                ),
                            child: SvgPicture.asset(
                              AppImage.video,
                              width: 22.w,
                              height: 22.0.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Divider(color: AppColor.greylight),

                    Expanded(
                      child: MediaQuery.removeViewInsets(
                        context: context,
                        removeBottom: true,

                        child: SingleChildScrollView(
                          controller: model.scrollController1,
                          reverse:
                              true, // so the latest message stays at the bottom
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (model.receivedMessageResponseModelList !=
                                      null &&
                                  model
                                      .receivedMessageResponseModelList!
                                      .receivedMessageResponseModelList!
                                      .isNotEmpty)
                                ...model
                                    .receivedMessageResponseModelList!
                                    .receivedMessageResponseModelList!
                                    .map((o) => model.boxMessage(o)),
                              if (model.session.chatsData['chat'] == null ||
                                  model.session.chatsData['chat'].isEmpty)
                                SizedBox.shrink()
                              else
                                ...model.session.chatsData['chat']!.map(
                                  (o) => Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      margin: EdgeInsets.only(
                                        right: 20.w,
                                        left: 100.w,
                                        bottom: 20.w,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        vertical: 4.w,
                                        horizontal: 10.w,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(0),
                                        ),
                                        color: AppColor.primary1,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          TextView(
                                            text: o['message'] ?? '',
                                            textStyle: GoogleFonts.dmSans(
                                              fontSize: 15.2.sp,
                                              fontWeight: FontWeight.w500,
                                              color: AppColor.white,
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextView(
                                                text: DateFormat(
                                                  'hh:mma',
                                                ).format(
                                                  DateTime.parse(
                                                    model.now.toString(),
                                                  ).toLocal(),
                                                ),
                                                textStyle: GoogleFonts.dmSans(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColor.white,
                                                ),
                                              ),
                                              SizedBox(width: 4.w),
                                              Icon(
                                                Icons.access_time,
                                                color: AppColor.white,
                                                size: 14.sp,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              SizedBox(height: 100),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        color: Colors.white,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: 50,
                            maxHeight: 150,
                          ),
                          child: Scrollbar(
                            child: Form(
                              key: formKey,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: model.sendtextController,
                                      scrollController: _scrollController,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                      minLines: 1,
                                      decoration: InputDecoration(
                                        hintText: 'Type a message...',
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        filled: true,
                                        fillColor: AppColor.white,
                                        suffixIcon: Padding(
                                          padding: EdgeInsets.only(
                                            top: 13.w,
                                            right: 16.w,
                                          ),
                                          child:
                                              !isContainedText
                                                  ? Padding(
                                                    padding: EdgeInsets.only(
                                                      bottom:
                                                          isTablet ? 10.w : 0.w,
                                                    ),
                                                    child: Wrap(
                                                      children: [
                                                        SvgPicture.asset(
                                                          AppImage.clipper,
                                                          height: 20.h,
                                                          width: 20.w,
                                                        ),

                                                        SizedBox(width: 16.w),
                                                        SvgPicture.asset(
                                                          AppImage.mic,
                                                          height: 20.h,
                                                          width: 20.w,
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                  : Padding(
                                                    padding: EdgeInsets.only(
                                                      bottom: 10.w,
                                                    ),
                                                    child: SvgPicture.asset(
                                                      AppImage.clipper,
                                                    ),
                                                  ),
                                        ),
                                      ),
                                      onChanged: (value) {
                                        if (value.isNotEmpty) {
                                          setState(() {
                                            isContainedText = true;
                                          });
                                        } else {
                                          setState(() {
                                            isContainedText = false;
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                  SizedBox(width: 4.w),
                                  IconButton(
                                    icon: Icon(
                                      Icons.send,
                                      color: AppColor.primary,
                                      size: 20.sp,
                                    ),
                                    onPressed: () async {
                                      if (model.sendtextController.text != '') {
                                        String msg =
                                            model.sendtextController.text;
                                        Future.delayed(
                                          Duration(seconds: 0),
                                          () {
                                            model.sendtextController.clear();
                                          },
                                        );
                                        await model.sendMessage(
                                          SendMessageEntityModel(
                                            conversationId: int.parse(
                                              widget
                                                  .messageModel!
                                                  .conversationId
                                                  .toString(),
                                            ),
                                            receiverId: int.parse(
                                              widget.messageModel!.contactId
                                                  .toString(),
                                            ),
                                            receiverType:
                                                "MydocLab\\Models\\Doctor",
                                            message: msg,
                                          ),
                                        );
                                      } else {}
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
