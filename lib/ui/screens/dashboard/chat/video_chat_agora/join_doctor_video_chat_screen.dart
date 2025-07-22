// ignore_for_file: must_be_immutable, non_constant_identifier_names, deprecated_member_use

import 'package:doc_lab_pharm/ui/app_assets/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doc_lab_pharm/core/connect_end/view_model/doc_view_model.dart';
import 'package:doc_lab_pharm/ui/app_assets/app_color.dart';
import 'package:stacked/stacked.dart';
import '../../../../../core/connect_end/model/call_entity_model.dart';
import '../../../../../core/connect_end/model/doctors_note_entity_model.dart';

class JoinDoctorVideoChatScreen extends StatefulWidget {
  JoinDoctorVideoChatScreen({super.key, required this.agoravalue});
  dynamic agoravalue;

  @override
  State<JoinDoctorVideoChatScreen> createState() =>
      _JoinDoctorVideoChatScreenState();
}

class _JoinDoctorVideoChatScreenState extends State<JoinDoctorVideoChatScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
      onDispose: (viewModel) {
        viewModel.doctorsNote(
          DoctorsNoteEntityModel(
            callId: int.parse(widget.agoravalue['call_id'].toString()),
            userId: int.parse(widget.agoravalue['caller_id'].toString()),
            note: viewModel.messages.join(','),
          ),
        );
        viewModel.cleanupAgoraEngine();
      },
      disposeViewModel: false,
      builder: (_, DocViewModel model, __) {
        return Scaffold(
          backgroundColor: AppColor.transparent.withOpacity(.5),
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
                bottom: 80,
                left: 20,
                child: SizedBox(
                  width: 400.w,
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 120.0.h,
                          child: ListView.builder(
                            itemCount: model.messages.length,
                            itemBuilder: (context, index) {
                              // Optional debug print
                              return model.callboxMessage(
                                context: context,
                                message:
                                    '${index + 1}. ${model.messages[index].capitalize()}',
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 20.h),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: model.sendtextController,
                                style: TextStyle(color: AppColor.white),
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                minLines: 1,
                                decoration: InputDecoration(
                                  hintText: 'Note...!',
                                  hintStyle: TextStyle(color: AppColor.white),

                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  filled: true,
                                  fillColor: AppColor.transparent,
                                ),
                                onChanged: (value) {},
                              ),
                            ),
                            SizedBox(width: 12.0.w),
                            IconButton(
                              icon: Icon(
                                Icons.send,
                                color: AppColor.primary1,
                                size: 34.40.sp,
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  model.messages.add(
                                    model.sendtextController.text,
                                  );
                                  Future.delayed(Duration(seconds: 0), () {
                                    model.sendtextController.clear();
                                  });
                                  model.notifyListeners();
                                }
                              },
                            ),
                            SizedBox(width: 26.w),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
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
                      onPressed: () async {
                        await model.endCall(
                          CallEntityModel(
                            callId: int.parse(
                              widget.agoravalue['call_id'].toString(),
                            ),
                            conversationId: int.parse(
                              widget.agoravalue['conversation_id'].toString(),
                            ),
                            receiverId: int.parse(
                              widget.agoravalue['caller_id'].toString(),
                            ),
                            receiverType: 'User',
                          ),
                        );
                        model.doctorsNote(
                          DoctorsNoteEntityModel(
                            callId: int.parse(
                              widget.agoravalue['call_id'].toString(),
                            ),
                            userId: int.parse(
                              widget.agoravalue['caller_id'].toString(),
                            ),
                            note: model.messages.join(','),
                          ),
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
