// ignore_for_file: must_be_immutable, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:doc_lab_pharm/core/connect_end/model/call_token_generate_entity_model.dart';
import 'package:doc_lab_pharm/core/connect_end/view_model/doc_view_model.dart';
import 'package:doc_lab_pharm/ui/app_assets/app_color.dart';
import 'package:doc_lab_pharm/ui/app_assets/constant.dart';
import 'package:stacked/stacked.dart';

import '../../../../../core/connect_end/model/call_entity_model.dart';

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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DocViewModel>.reactive(
      viewModelBuilder: () => DocViewModel(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          await model.generateToken(
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
          // ignore: deprecated_member_use
          backgroundColor: AppColor.transparent.withOpacity(.5),
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
                      onPressed: () {
                        model.endCall(
                          CallEntityModel(
                            callId: int.parse(
                              model.callTokenGenerateResponseModel!.callId
                                  .toString(),
                            ),
                            conversationId: int.parse(
                              widget.conversationId.toString(),
                            ),
                            receiverId: int.parse(widget.receiverId.toString()),
                            receiverType: widget.receiverType,
                          ),
                        );
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
