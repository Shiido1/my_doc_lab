// ignore_for_file: must_be_immutable

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:my_doc_lab/core/connect_end/model/call_token_generate_entity_model.dart';
import 'package:my_doc_lab/core/connect_end/view_model/doc_view_model.dart';
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
              Center(child: model.remoteVideo()),
              Align(
                alignment: Alignment.topLeft,
                child: SizedBox(
                  width: 100,
                  height: 150,
                  child: Center(
                    child:
                        model.localUserJoined
                            ? model.localVideo()
                            : const CircularProgressIndicator(),
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
