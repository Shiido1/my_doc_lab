// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doc_lab/core/connect_end/model/call_token_generate_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/view_model/doc_view_model.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:stacked/stacked.dart';

class DoctorVideoChatScreen extends StatefulWidget {
  DoctorVideoChatScreen({
    super.key,
    required this.conversationId,
    required this.receiverId,
    required this.receiverType,
  });
  int? conversationId;
  int? receiverId;
  String? receiverType;

  @override
  State<DoctorVideoChatScreen> createState() => _DoctorVideoChatScreenState();
}

class _DoctorVideoChatScreenState extends State<DoctorVideoChatScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DocViewModel>.reactive(
      viewModelBuilder: () => DocViewModel(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          model.generateToken(
            context,
            calltoken: CallTokenGenerateEntityModel(
              conversationId: widget.conversationId,
              receiverId: widget.receiverId,
              receiverType: widget.receiverType,
            ),
          );
        });
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
                          ? model.remoteVideo()
                          : model.localVideo(),
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
                                    ? model.localVideo()
                                    : model.remoteVideo()
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
