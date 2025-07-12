import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_image.dart';
import 'package:my_doc_lab/ui/app_assets/constant.dart';
import 'package:my_doc_lab/ui/widget/text_widget.dart';
import 'package:stacked/stacked.dart';

import '../../../../core/connect_end/model/get_list_of_doctors_appointment_model/get_list_of_doctors_appointment_model.dart';
import '../../../../core/connect_end/model/get_message_index_response_model/get_message_index_response_model.dart';
import '../../../../core/connect_end/model/get_user_response_model/data.dart';
import '../../../../core/connect_end/model/send_message_entity_model.dart';
import '../../../../core/connect_end/view_model/doc_view_model.dart';
import 'video_chat_agora/doctor_video_chat_screen.dart';

// ignore: must_be_immutable
class DoctorChatScreen extends StatefulWidget {
  DoctorChatScreen({
    super.key,
    required this.id,
    required this.messageModel,
    required this.app,
    required this.data,
    required this.sender,
  });
  GetMessageIndexResponseModel? messageModel;
  String? id;
  GetListOfDoctorsAppointmentModel? app;
  Data? data;
  dynamic sender;

  @override
  State<DoctorChatScreen> createState() => _DoctorChatScreenState();
}

class _DoctorChatScreenState extends State<DoctorChatScreen> {
  final ScrollController _scrollController = ScrollController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isContainedText = false;

  bool isJustInitiated = false;

  @override
  Widget build(BuildContext context) {
    // final isTablet = MediaQuery.of(context).size.shortestSide >= 600;
    return ViewModelBuilder<DocViewModel>.reactive(
      viewModelBuilder: () => DocViewModel(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          model.hasLoadedConversation = true;
          model.hasLoadedIndexConversation = false;
          if (widget.messageModel != null || widget.sender != null) {
            model.receiveConversationOnce(
              context,
              id: widget.id!,
              messageModel: widget.messageModel,
              sender: widget.sender,
            );
          } else {
            model.getChatIndex();
          }
        });
      },
      onDispose: (viewModel) {
        viewModel.hasLoadedConversation = false;
        viewModel.hasLoadedIndexConversation = true;
      },
      disposeViewModel: false,
      builder: (_, DocViewModel model, __) {
        return Scaffold(
          backgroundColor: AppColor.white,
          resizeToAvoidBottomInset: true,
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
                                    widget.app?.user?.firstName?.capitalize() ??
                                    widget.messageModel?.contactName
                                        ?.capitalize() ??
                                    widget.data?.firstName?.capitalize() ??
                                    '${model.receivedMessageResponseModelList?.receivedMessageResponseModelList?[0].sender?.firstName?.capitalize() ?? ''} ${model.receivedMessageResponseModelList?.receivedMessageResponseModelList?[0].sender?.lastName?.capitalize() ?? ''}'
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
                        widget.messageModel != null || widget.sender != null
                            ? Padding(
                              padding: EdgeInsets.only(top: 10.w, right: 20.w),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder:
                                          (context) => DoctorVideoChatScreen(
                                            conversationId: int.parse(
                                              '${widget.messageModel!.conversationId ?? widget.id}',
                                            ),
                                            receiverId: int.parse(
                                              '${widget.messageModel!.contactId ?? widget.sender['sender_id']}',
                                            ),
                                            receiverType:
                                                '${widget.messageModel!.contactType ?? widget.sender['sender_type']}',
                                          ),
                                    ),
                                  );
                                  model.sendMessage(
                                    SendMessageEntityModel(
                                      conversationId: int.parse(
                                        '${widget.messageModel!.conversationId ?? widget.id}',
                                      ),
                                      receiverId: int.parse(
                                        '${widget.messageModel!.contactId ?? widget.sender['sender_id']}',
                                      ),
                                      receiverType: "MydocLab\\Models\\User",
                                      message: 'video-call-agora',
                                    ),
                                  );
                                },

                                child: SvgPicture.asset(
                                  AppImage.video,
                                  width: 22.w,
                                  height: 22.0.h,
                                ),
                              ),
                            )
                            : SizedBox.shrink(),
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
                                    .map(
                                      (o) =>
                                          model.boxMessage(context, message: o),
                                    ),
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
                                                widget.app == null
                                                    ? Icons.access_time
                                                    : Icons.check,
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
                              SizedBox(height: 60),
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
                                  widget.app != null && isJustInitiated ||
                                          model.getMessageIndexResponseModelList !=
                                                  null &&
                                              model
                                                  .getMessageIndexResponseModelList!
                                                  .getMessageIndexResponseModelList!
                                                  .any(
                                                    (o) =>
                                                        o.contactId
                                                                .toString() ==
                                                            widget.app?.userId
                                                                .toString() ||
                                                        o.contactId
                                                                .toString() ==
                                                            widget.data?.id,
                                                  )
                                      ? SizedBox.shrink()
                                      : IconButton(
                                        icon: Icon(
                                          Icons.send,
                                          color: AppColor.primary,
                                          size: 20.sp,
                                        ),
                                        onPressed: () async {
                                          setState(() {
                                            isJustInitiated = true;
                                          });
                                          model.sendMessageAction(
                                            app: widget.app,
                                            messageModel: widget.messageModel,
                                            sender: widget.sender,
                                          );
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
