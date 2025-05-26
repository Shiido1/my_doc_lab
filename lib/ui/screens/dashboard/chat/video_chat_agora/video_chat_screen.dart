import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../../../core/connect_end/view_model/auth_view_model.dart'
    show AuthViewModel;
import '../../../../../core/core_folder/app/app.locator.dart';

class VideoChatScreen extends StatefulWidget {
  const VideoChatScreen({super.key});

  @override
  State<VideoChatScreen> createState() => _VideoChatScreenState();
}

class _VideoChatScreenState extends State<VideoChatScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthViewModel>.reactive(
      viewModelBuilder: () => locator<AuthViewModel>(),
      onViewModelReady: (model) {
        WidgetsBinding.instance.addPostFrameCallback((_) async {
          model.generateToken(context);
        });
      },
      onDispose: (viewModel) => viewModel.cleanupAgoraEngine(),
      disposeViewModel: false,
      builder: (_, AuthViewModel model, __) {
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
                            ? AgoraVideoView(
                              controller: VideoViewController(
                                rtcEngine: model.engine!,
                                canvas: const VideoCanvas(uid: 0),
                              ),
                            )
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
