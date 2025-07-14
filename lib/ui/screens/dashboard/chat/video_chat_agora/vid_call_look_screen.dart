// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:my_doc_lab/ui/screens/dashboard/chat/video_chat_agora/video_chat_screen.dart';
// import 'package:stacked/stacked.dart';
// import '../../../../../core/connect_end/model/call_token_generate_entity_model.dart';
// import '../../../../../core/connect_end/model/get_message_index_response_model/get_message_index_response_model.dart';
// import '../../../../../core/connect_end/model/send_message_entity_model.dart';
// import '../../../../../core/connect_end/view_model/auth_view_model.dart';
// import '../../../../app_assets/app_color.dart';
// import '../../../../app_assets/constant.dart';
// import '../../../../widget/text_widget.dart';

// // ignore: must_be_immutable
// class VidCallLookScreen extends StatefulWidget {
//   VidCallLookScreen({
//     super.key,
//     required this.image,
//     required this.callId,
//     required this.conversationId,
//     required this.messageModel,
//     required this.sender,
//   });
//   String? image;
//   String? callId;
//   String? conversationId;
//   GetMessageIndexResponseModel? messageModel;
//   dynamic sender;

//   @override
//   State<VidCallLookScreen> createState() => _VidCallLookScreenState();
// }

// class _VidCallLookScreenState extends State<VidCallLookScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ViewModelBuilder<AuthViewModel>.reactive(
//         viewModelBuilder: () => AuthViewModel(),
//         onViewModelReady: (model) {},
//         onDispose: (viewModel) {},
//         disposeViewModel: false,
//         builder: (_, AuthViewModel model, __) {
//           return Stack(
//             children: [
//               // Fullscreen image
//               // Positioned.fill(
//               //   child: Image.network(
//               //     widget.image!.contains('https')
//               //         ? '${widget.image}'
//               //         : 'https://res.cloudinary.com/dnv6yelbr/image/upload/v1747827538/${widget.image}',
//               //     fit: BoxFit.cover,
//               //   ),
//               // ),
//               // Blur effect layer
//               Positioned.fill(
//                 child: BackdropFilter(
//                   filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
//                   child: Container(
//                     color: Colors.transparent, // Make the container transparent
//                   ),
//                 ),
//               ),
//               // Content on top of the blurred background
//               Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     TextView(
//                       text:
//                           'Dr. ${widget.messageModel?.contactName?.capitalizeWords() ?? widget.sender['caller_name'].contactName?.capitalizeWords() ?? ''} is Calling..',
//                       textStyle: GoogleFonts.dmSans(
//                         fontSize: 22.2.sp,
//                         fontWeight: FontWeight.w500,
//                         color: AppColor.white,
//                       ),
//                     ),
//                     SizedBox(height: 50.h),
//                     ClipOval(
//                       child: SizedBox.fromSize(
//                         size: const Size.fromRadius(68),
//                         child: Image.network(
//                           widget.image!.contains('https')
//                               ? '${widget.image}'
//                               : 'https://res.cloudinary.com/dnv6yelbr/image/upload/v1747827538/${widget.image}',
//                           fit: BoxFit.cover,
//                           errorBuilder:
//                               (context, error, stackTrace) =>
//                                   shimmerViewPharm(),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 50.h),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           padding: EdgeInsets.all(5.2.w),
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: AppColor.white.withOpacity(.4),
//                           ),
//                           child: IconButton(
//                             icon: Icon(Icons.call_sharp),
//                             onPressed: () {
//                               Navigator.of(context).push(
//                                 MaterialPageRoute(
//                                   builder:
//                                       (context) => VideoChatScreen(
//                                         conversationId: int.parse(
//                                           widget.conversationId.toString(),
//                                         ),
//                                         receiverId: int.parse(
//                                           '${widget.messageModel!.contactId ?? widget.sender['caller_id']}',
//                                         ),
//                                         receiverType:
//                                             '${widget.messageModel!.contactType ?? widget.sender['sender_type']}',
//                                       ),
//                                 ),
//                               );
//                               model.acceptCall(
//                                 model.callTokenGenerateResponseModel != null
//                                     ? int.parse(
//                                       model
//                                           .callTokenGenerateResponseModel!
//                                           .callId
//                                           .toString(),
//                                     )
//                                     : int.parse(
//                                       widget.sender['call_id'].toString(),
//                                     ),
//                               );
//                             },
//                             color: AppColor.primary,
//                             iconSize: 50.sp,
//                           ),
//                         ),
//                         SizedBox(width: 80.w),
//                         Container(
//                           padding: EdgeInsets.all(5.2.w),
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: AppColor.white.withOpacity(.4),
//                           ),
//                           child: IconButton(
//                             icon: Icon(Icons.call_end),
//                             onPressed: () async {
//                               model.hasLoadedConversation = true;
//                               model.notifyListeners();
//                               Navigator.pop(context);

//                               model.rejectCall(
//                                 model.callTokenGenerateResponseModel != null
//                                     ? int.parse(
//                                       model
//                                           .callTokenGenerateResponseModel!
//                                           .callId
//                                           .toString(),
//                                     )
//                                     : int.parse(
//                                       widget.sender['call_id'].toString(),
//                                     ),
//                               );
//                             },
//                             color: AppColor.red,
//                             iconSize: 50.sp,
//                           ),
//                         ),
//                       ],
//                     ),
//                     // Add other widgets here as needed
//                   ],
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
