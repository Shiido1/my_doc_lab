// ignore_for_file: must_be_immutable, non_constant_identifier_names, deprecated_member_use

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:doc_lab_pharm/ui/app_assets/constant.dart';
import 'package:ed_screen_recorder/ed_screen_recorder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doc_lab_pharm/core/connect_end/view_model/doc_view_model.dart';
import 'package:doc_lab_pharm/ui/app_assets/app_color.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stacked/stacked.dart';

class JoinDoctorVideoChatScreen extends StatefulWidget {
  JoinDoctorVideoChatScreen({super.key, required this.agoravalue});
  dynamic agoravalue;

  @override
  State<JoinDoctorVideoChatScreen> createState() =>
      _JoinDoctorVideoChatScreenState();
}

class _JoinDoctorVideoChatScreenState extends State<JoinDoctorVideoChatScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  EdScreenRecorder? screenRecorder;
  RecordOutput? response;
  bool inProgress = false;

  Future<void> startRecord({
    required String fileName,
    required int width,
    required int height,
  }) async {
    // ✅ Request microphone permission
    var micStatus = await Permission.microphone.status;
    if (!micStatus.isGranted) {
      micStatus = await Permission.microphone.request();
      if (!micStatus.isGranted) {
        debugPrint("Microphone permission not granted");
        return;
      }
    }

    // ✅ Request storage permission (optional but recommended)
    var storageStatus = await Permission.storage.status;
    if (!storageStatus.isGranted) {
      storageStatus = await Permission.storage.request();
      if (!storageStatus.isGranted) {
        debugPrint("Storage permission not granted");
        return;
      }
    }

    Directory? tempDir = await getApplicationDocumentsDirectory();
    String tempPath = tempDir.path;

    try {
      var startResponse = await screenRecorder?.startRecordScreen(
        fileName: fileName,
        dirPathToSave: tempPath,
        audioEnable: true,
        width: width,
        height: height,
      );
      setState(() {
        response = startResponse;
      });
      print('report note:::$response');
    } on PlatformException {
      debugPrint("Error: An error occurred while starting the recording!");
    }
  }

  @override
  void initState() {
    screenRecorder = EdScreenRecorder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width.toInt();
    final screenHeight = MediaQuery.of(context).size.height.toInt();
    return ViewModelBuilder<DocViewModel>.reactive(
      viewModelBuilder: () => DocViewModel(),
      onViewModelReady: (model) {
        model.initializeAgoraVoiceSDK(
          channelName: widget.agoravalue['channel_name'],
          token: widget.agoravalue['agora_token'],
        );
        // model.screenRecorder = EdScreenRecorder();
        // model.startRecord(fileName: "eren", width: 100, height: 100);
      },
      onDispose: (viewModel) {
        viewModel.cleanupAgoraEngine();
        viewModel.stopRecord();
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
                              print('position: $index'); // Optional debug print
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
                            SizedBox(
                              width: 280,
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
                                  startRecord(
                                    fileName: "eren",
                                    width: screenWidth,
                                    height: screenHeight,
                                  );
                                  // model.messages.add(
                                  //   model.sendtextController.text,
                                  // );
                                  // Future.delayed(Duration(seconds: 0), () {
                                  //   model.sendtextController.clear();
                                  // });
                                  model.notifyListeners();
                                }
                              },
                            ),
                            SizedBox(width: 10.w),
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
