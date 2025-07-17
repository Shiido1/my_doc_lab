// ignore_for_file: must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doc_lab/core/connect_end/view_model/doc_view_model.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:stacked/stacked.dart';

class JoinDoctorVideoChatScreen extends StatefulWidget {
  JoinDoctorVideoChatScreen({super.key, required this.agoravalue});
  dynamic agoravalue;

  @override
  State<JoinDoctorVideoChatScreen> createState() =>
      _JoinDoctorVideoChatScreenState();
}

class _JoinDoctorVideoChatScreenState extends State<JoinDoctorVideoChatScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DocViewModel>.reactive(
      viewModelBuilder: () => DocViewModel(),
      onViewModelReady: (model) {
        model.initializeAgoraVoiceSDK(
          channelName: widget.agoravalue['channel_name'],
          token: widget.agoravalue['agora_token'],
        );
      },
      onDispose: (viewModel) => viewModel.cleanupAgoraEngine(),
      disposeViewModel: false,
      builder: (_, DocViewModel model, __) {
        return Scaffold(
          body: Stack(
            children: [
              if (model.engine == null)
                SizedBox.shrink()
              else
                Center(
                  child:
                      !model.onSwitch
                          ? model.remoteJoinVideo(
                            widget.agoravalue['channel_name'],
                          )
                          : model.localJoinVideo(),
                ),
              Positioned(
                bottom: 20,
                left: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      icon: Icon(
                        model.onToggleMic ? Icons.mic : Icons.mic_off_outlined,
                      ),
                      onPressed: () {
                        model.onToggleMicrophone();
                      },
                      color: AppColor.white,
                      iconSize: 40.sp,
                    ),
                    SizedBox(width: 150.w),
                    IconButton(
                      icon: Icon(Icons.call_end),
                      onPressed: () {
                        model.endCall(
                          int.parse(widget.agoravalue['call_id'].toString()),
                        );
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      color: AppColor.red,
                      iconSize: 40.sp,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 12.w, top: 40.w),
                  child: GestureDetector(
                    onTap: () => model.onSwitched(),
                    child: SizedBox(
                      width: 100,
                      height: 150,
                      child: Center(
                        child:
                            model.localUserJoined
                                ? !model.onSwitch
                                    ? model.localJoinVideo()
                                    : model.remoteJoinVideo(
                                      widget.agoravalue['channel_name'],
                                    )
                                : const CircularProgressIndicator(),
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
}
