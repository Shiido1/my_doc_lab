// ignore_for_file: unnecessary_string_escapes, deprecated_member_use, prefer_final_fields

import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/main.dart';
import 'package:my_doc_lab/ui/screens/dashboard/chat/video_chat_agora/join_doctor_video_chat_screen.dart';
import 'package:my_doc_lab/ui/screens/dashboard/chat/video_chat_agora/join_video_chat_screen.dart';
import 'package:stacked/stacked.dart';
import '../../../../../core/connect_end/model/get_message_index_response_model/get_message_index_response_model.dart';
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
  AudioPlayer _player = AudioPlayer();
  var audioSource;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.grey,
      body: ViewModelBuilder<DocViewModel>.reactive(
        viewModelBuilder: () => DocViewModel(),
        onViewModelReady: (model) {
          _playerSound();
          print('player:::K${widget.sender['caller_type']}');
        },
        onDispose: (viewModel) {},
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
                          widget.sender['caller_type'] ==
                                  "MydocLab\Models\Doctor"
                              ? 'Dr. ${widget.messageModel?.contactName?.capitalizeWords() ?? widget.sender['caller_name'] ?? ''} is Calling..'
                              : '${widget.messageModel?.contactName?.capitalizeWords() ?? widget.sender['caller_name'] ?? ''} is Calling..',
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
                              await _player.stop();
                              navigate.back();
                              if (widget.sender['caller_type'] ==
                                  "MydocLab\Models\Doctor") {
                                await _player.stop();
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder:
                                        (context) => JoinVideoChatScreen(
                                          agoravalue: widget.sender,
                                        ),
                                  ),
                                );
                              } else {
                                await _player.stop();
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
                              await _player.stop();
                              model.hasLoadedConversation = true;
                              model.notifyListeners();
                              Navigator.pop(context);
                              model.rejectCall(
                                int.parse(widget.sender['call_id'].toString()),
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

  void _playerSound() async {
    audioSource = AssetSource('audio/ringing.mp3');
    await _player.setReleaseMode(ReleaseMode.loop);
    await _player.play(audioSource);
  }

  Future<void> replaySound() async {
    await _player.stop(); // optional: stop if already playing
    await _player.play(audioSource);
  }
}
