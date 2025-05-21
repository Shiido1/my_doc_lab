// ignore_for_file: invalid_use_of_visible_for_testing_member, deprecated_member_use

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../widget/text_widget.dart';
import 'app_color.dart';
// import 'package:path_provider/path_provider.dart';

enum ProfileOptionAction {
  viewImage,
  profileCamera,
  library,
  remove,
}

class ImagePickerHandler {
  File? file;

  Future<void> pickImage(
      {@required BuildContext? context, Function(File file)? file}) async {
    ProfileOptionAction? action;

    action = await showModalBottomSheet(
        context: context!,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        builder: (context) => BottomSheet(
            backgroundColor: AppColor.white,
            onClosing: () {},
            builder: (context) => Wrap(
                  children: <Widget>[
                    ListTile(
                        title: Center(
                          child: TextView(
                            text: 'Pick from library',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onTap: () => Navigator.pop(
                            context, ProfileOptionAction.library)),
                    const Divider(),
                    ListTile(
                        title: Center(
                          child: TextView(
                            text: 'Take a photo',
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onTap: () => Navigator.pop(
                            context, ProfileOptionAction.profileCamera)),
                    InkWell(
                      onTap: () =>
                          Navigator.pop(context, ProfileOptionAction.remove),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.all(12.0),
                        color: Colors.grey[200],
                        child: Center(
                          child: TextView(
                            text: 'Cancel',
                            fontSize: 17.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    )
                  ],
                )));
    // if (Platform.isAndroid) {
    //   action = await showModalBottomSheet(
    //       context: context!,
    //       shape: const RoundedRectangleBorder(
    //         borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
    //       ),
    //       builder: (context) => BottomSheet(
    //           onClosing: () {},
    //           builder: (context) => Wrap(
    //                 children: <Widget>[
    //                   ListTile(
    //                       title: Center(
    //                         child: TextView(
    //                           text: 'Pick from library',
    //                           fontSize: 16.sp,
    //                           fontWeight: FontWeight.w600,
    //                         ),
    //                       ),
    //                       onTap: () => Navigator.pop(
    //                           context, ProfileOptionAction.library)),
    //                   const Divider(),
    //                   ListTile(
    //                       title: Center(
    //                         child: TextView(
    //                           text: 'Take a photo',
    //                           fontSize: 17.sp,
    //                           fontWeight: FontWeight.w600,
    //                         ),
    //                       ),
    //                       onTap: () => Navigator.pop(
    //                           context, ProfileOptionAction.profileCamera)),
    //                   InkWell(
    //                     onTap: () =>
    //                         Navigator.pop(context, ProfileOptionAction.remove),
    //                     child: Container(
    //                       width: MediaQuery.of(context).size.width,
    //                       padding: const EdgeInsets.all(12.0),
    //                       color: Colors.grey[200],
    //                       child: Center(
    //                         child: TextView(
    //                           text: 'Cancel',
    //                           fontSize: 17.sp,
    //                           fontWeight: FontWeight.w600,
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               )));
    // } else if (Platform.isIOS) {
    //   action = await showModalBottomSheet(
    //       backgroundColor: AppColor.white,
    //       context: context!,
    //       builder: (context) => CupertinoActionSheet(
    //               actions: <Widget>[
    //                 CupertinoButton(
    //                     child: TextView(
    //                       text: 'Pick from library',
    //                       fontSize: 17.5.sp,
    //                       fontWeight: FontWeight.w600,
    //                     ),
    //                     onPressed: () => Navigator.pop(
    //                         context, ProfileOptionAction.library)),
    //                 CupertinoButton(
    //                     child: TextView(
    //                       text: 'Take a photo',
    //                       fontSize: 17.sp,
    //                       fontWeight: FontWeight.w600,
    //                     ),
    //                     onPressed: () => Navigator.pop(
    //                         context, ProfileOptionAction.profileCamera)),
    //               ],
    //               cancelButton: CupertinoButton(
    //                   child: TextView(
    //                     text: 'Cancel',
    //                     fontSize: 17.sp,
    //                     fontWeight: FontWeight.w600,
    //                   ),
    //                   onPressed: () => Navigator.pop(context))));
    // }

    if (action == null) return;
    File? getFile = await handleProfileAction(context, action: action);
    file!(getFile!);
  }

  Future<File?>? handleProfileAction(BuildContext context,
      {@required ProfileOptionAction? action}) {
    switch (action!) {
      case ProfileOptionAction.viewImage:
      case ProfileOptionAction.library:
        return _getImage(context, ImageSource.gallery);
      case ProfileOptionAction.profileCamera:
        return _getImage(context, ImageSource.camera);
      case ProfileOptionAction.remove:
        break;
    }
    return null;
  }

  Future<File?> _getImage(BuildContext context, ImageSource source) async {
    try {
      final pickedFile = await ImagePicker.platform.pickImage(source: source);
      if (pickedFile != null) {
        return await _cropImage(context, pickedFile);
      }
    } catch (e) {
      debugPrint('Error: $e');
    }
    return null;
  }

  Future<File?> _cropImage(BuildContext context, PickedFile imageFile) async {
    final croppedFile =
        await ImageCropper().cropImage(sourcePath: imageFile.path, uiSettings: [
      AndroidUiSettings(
          toolbarTitle: 'Daalupay',
          toolbarColor: AppColor.primary,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
      IOSUiSettings(
        title: 'Daalupay',
      )
    ]);

    return File(croppedFile!.path);
  }
}
