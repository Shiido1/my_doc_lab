import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/screens/dashboard/chat/video_chat_agora/video_chat_screen.dart';
import 'package:stacked/stacked.dart';

import '../../../../../core/connect_end/model/call_token_generate_entity_model.dart';
import '../../../../../core/connect_end/model/get_message_index_response_model/get_message_index_response_model.dart';
import '../../../../../core/connect_end/model/send_message_entity_model.dart';
import '../../../../../core/connect_end/view_model/doc_view_model.dart';
import '../../../../app_assets/app_color.dart';
import '../../../../app_assets/constant.dart';
import '../../../../widget/text_widget.dart';

// ignore: must_be_immutable
class DocVidCallLookScreen extends StatefulWidget {
  DocVidCallLookScreen({
    super.key,
    required this.image,
    required this.callId,
    required this.conversationId,
    required this.messageModel,
    required this.sender,
  });
  String? image;
  String? callId;
  String? conversationId;
  GetMessageIndexResponseModel? messageModel;
  dynamic sender;

  @override
  State<DocVidCallLookScreen> createState() => _DocVidCallLookScreenState();
}

class _DocVidCallLookScreenState extends State<DocVidCallLookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<DocViewModel>.reactive(
        viewModelBuilder: () => DocViewModel(),
        onViewModelReady: (model) {},
        onDispose: (viewModel) {},
        disposeViewModel: false,
        builder: (_, DocViewModel model, __) {
          return Stack(
            children: [
              // Fullscreen image
              Positioned.fill(
                child: Image.network(
                  widget.image!.contains('https')
                      ? '${widget.image}'
                      : 'https://res.cloudinary.com/dnv6yelbr/image/upload/v1747827538/${widget.image}',
                  fit: BoxFit.cover,
                ),
              ),
              // Blur effect layer
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    color: Colors.transparent, // Make the container transparent
                  ),
                ),
              ),
              // Content on top of the blurred background
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextView(
                      text:
                          '${widget.messageModel?.contactName?.capitalizeWords() ?? ''}is Calling..',
                      textStyle: GoogleFonts.dmSans(
                        fontSize: 17.2.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColor.white,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    ClipOval(
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(68),
                        child: Image.network(
                          widget.image!.contains('https')
                              ? '${widget.image}'
                              : 'https://res.cloudinary.com/dnv6yelbr/image/upload/v1747827538/${widget.image}',
                          fit: BoxFit.cover,
                          errorBuilder:
                              (context, error, stackTrace) =>
                                  shimmerViewPharm(),
                        ),
                      ),
                    ),
                    SizedBox(height: 50.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          icon: Icon(Icons.call_sharp),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder:
                                    (context) => VideoChatScreen(
                                      conversationId: int.parse(
                                        widget.conversationId.toString(),
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
                                  '${widget.messageModel!.conversationId}',
                                ),
                                receiverId: int.parse(
                                  '${widget.messageModel!.contactId ?? widget.sender['sender_id']}',
                                ),
                                receiverType: "MydocLab\\Models\\User",
                                message: 'accept-call-agora',
                              ),
                            );
                          },
                          color: AppColor.primary,
                          iconSize: 50.sp,
                        ),
                        SizedBox(width: 200.w),
                        IconButton(
                          icon: Icon(Icons.call_end),
                          onPressed: () async {
                            model.hasLoadedConversation = true;
                            model.notifyListeners();
                            Navigator.pop(context);
                            Navigator.pop(context);
                            await model.sendMessage(
                              SendMessageEntityModel(
                                conversationId: int.parse(
                                  '${widget.messageModel!.conversationId}',
                                ),
                                receiverId: int.parse(
                                  '${widget.messageModel!.contactId ?? widget.sender['sender_id']}',
                                ),
                                receiverType: "MydocLab\\Models\\Doctor",
                                message: 'reject-call-agora',
                              ),
                            );
                            await model.generateToken(
                              context,
                              calltoken: CallTokenGenerateEntityModel(
                                conversationId: int.parse(
                                  '${widget.conversationId}',
                                ),
                                receiverId: int.parse(
                                  '${widget.messageModel!.contactId ?? widget.sender['sender_id']}',
                                ),
                                receiverType: "Doctor",
                              ),
                            );

                            model.rejectCall(
                              int.parse(
                                model.callTokenGenerateResponseModel!.callId
                                    .toString(),
                              ),
                            );
                          },
                          color: AppColor.red,
                          iconSize: 50.sp,
                        ),
                      ],
                    ),
                    // Add other widgets here as needed
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
