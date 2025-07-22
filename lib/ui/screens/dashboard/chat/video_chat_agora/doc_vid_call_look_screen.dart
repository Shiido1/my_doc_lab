// ignore_for_file: unnecessary_string_escapes, deprecated_member_use, prefer_final_fields

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:doc_lab_pharm/main.dart';
import 'package:doc_lab_pharm/ui/screens/dashboard/chat/video_chat_agora/join_doctor_video_chat_screen.dart';
import 'package:doc_lab_pharm/ui/screens/dashboard/chat/video_chat_agora/join_video_chat_screen.dart';
import 'package:stacked/stacked.dart';
import '../../../../../core/connect_end/model/call_entity_model.dart';
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
    required this.sender,
  });
  String? image;
  String? callId;
  String? conversationId;
  dynamic sender;

  @override
  State<DocVidCallLookScreen> createState() => _DocVidCallLookScreenState();
}

class _DocVidCallLookScreenState extends State<DocVidCallLookScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey,
      body: ViewModelBuilder<DocViewModel>.reactive(
        viewModelBuilder: () => DocViewModel(),
        onViewModelReady: (model) {
          model.playerSound();
          model.startTimer();
          print('player:::K${widget.sender['caller_type']}');
        },
        onDispose: (viewModel) {
          viewModel.dispose();
        },
        disposeViewModel: false,
        builder: (_, DocViewModel model, __) {
          return Stack(
            children: [
              // Fullscreen image
              Positioned.fill(
                child:
                    widget.image == null || !widget.image!.contains('https')
                        ? Container(color: AppColor.funnyLookingGrey)
                        : Image.network(
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
                          '${widget.sender['caller_name'] ?? ''} is Calling..',
                      textStyle: GoogleFonts.dmSans(
                        fontSize: 23.2.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColor.white,
                      ),
                    ),
                    SizedBox(height: 60.h),
                    ClipOval(
                      child: SizedBox.fromSize(
                        size: const Size.fromRadius(98),
                        child:
                            widget.image == null ||
                                    !widget.image!.contains('https')
                                ? Container(color: AppColor.funnyLookingGrey)
                                : Image.network(
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
                    SizedBox(height: 100.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5.2.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.white.withOpacity(.4),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.call_sharp),
                            onPressed: () async {
                              await model.player.stop();
                              navigate.back();
                              if (widget.sender['caller_type'] ==
                                  "MydocLab\Models\Doctor") {
                                await model.player.stop();
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder:
                                        (context) => JoinVideoChatScreen(
                                          agoravalue: widget.sender,
                                        ),
                                  ),
                                );
                              } else {
                                await model.player.stop();
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder:
                                        (context) => JoinDoctorVideoChatScreen(
                                          agoravalue: widget.sender,
                                        ),
                                  ),
                                );
                              }
                              model.acceptCall(
                                int.parse(widget.sender['call_id'].toString()),
                              );
                            },
                            color: AppColor.primary,
                            iconSize: 50.sp,
                          ),
                        ),
                        SizedBox(width: 120.w),
                        Container(
                          padding: EdgeInsets.all(5.2.w),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.white.withOpacity(.4),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.call_end),
                            onPressed: () async {
                              await model.player.stop();
                              model.hasLoadedConversation = true;
                              model.notifyListeners();
                              Navigator.pop(context);
                              model.rejectCall(
                                CallEntityModel(
                                  callId: int.parse(
                                    widget.sender['call_id'].toString(),
                                  ),
                                  conversationId: int.parse(
                                    widget.sender['conversation_id'].toString(),
                                  ),
                                  receiverId: int.parse(
                                    widget.sender['caller_id'].toString(),
                                  ),
                                  receiverType: 'User',
                                ),
                              );
                            },
                            color: AppColor.red,
                            iconSize: 50.sp,
                          ),
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
