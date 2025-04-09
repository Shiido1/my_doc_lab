import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_image.dart';
import 'package:my_doc_lab/ui/widget/text_widget.dart';

// ignore: must_be_immutable
class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.keyboard_arrow_left, size: 32.sp),
                    ),
                    SizedBox(width: 20.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextView(
                          text: 'Dr Uju Obah',
                          textStyle: GoogleFonts.dmSans(
                            color: AppColor.black,
                            fontSize: 20.0.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 2.w),
                              padding: EdgeInsets.all(4.w),
                              decoration: BoxDecoration(
                                color: AppColor.primary1,
                                shape: BoxShape.circle,
                              ),
                            ),
                            SizedBox(width: 6.w),
                            TextView(
                              text: 'Online',
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.black,
                                fontSize: 14.0.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppImage.video,
                          width: 18.w,
                          height: 18.0.h,
                        ),
                        SizedBox(width: 20.w),
                        SvgPicture.asset(
                          AppImage.phone,
                          width: 26.0.w,
                          height: 26.0.h,
                        ),
                        SizedBox(width: 20.w),
                        SvgPicture.asset(
                          AppImage.moreVert,
                          width: 20.w,
                          height: 20.h,
                        ),
                        SizedBox(width: 20.w),
                      ],
                    ),
                  ],
                ),
                Divider(color: AppColor.greylight),
              ],
            ),

            Padding(
              padding: EdgeInsets.only(
                bottom: 80, // Reserve space for the input field
                left: 12.20,
                right: 12.20,
                top: 20,
              ),
              child: SizedBox(
                height: 560.h,
                child: SingleChildScrollView(
                  reverse: true, // so the latest message stays at the bottom
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          margin: EdgeInsets.only(left: 20.w, right: 100.w),
                          padding: EdgeInsets.all(8.0.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(0),
                              bottomRight: Radius.circular(10),
                            ),
                            color: AppColor.primary1.withOpacity(.1),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextView(
                                text: 'Hello, How can I help you?',
                                textStyle: GoogleFonts.dmSans(
                                  fontSize: 13.2.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.darkindgrey,
                                ),
                              ),
                              SizedBox(height: 6.h),
                              TextView(
                                text: '09:45PM',
                                textStyle: GoogleFonts.dmSans(
                                  fontSize: 11.2.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.darkindgrey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: EdgeInsets.only(right: 20.w, left: 100.w),
                          padding: EdgeInsets.all(8.0.w),
                          decoration: BoxDecoration(
                            // border: Border.all(color: AppColor.primary, width: .3),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(0),
                            ),
                            color: AppColor.primary1,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextView(
                                text:
                                    'I have been suffering from Tooth ache and stomach pain for 3 days now.',
                                textStyle: GoogleFonts.dmSans(
                                  fontSize: 13.2.sp,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.white,
                                ),
                              ),
                              SizedBox(height: 6.h),
                              TextView(
                                text: '09:45PM',
                                textStyle: GoogleFonts.dmSans(
                                  fontSize: 11.2.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ),

            // Input field at bottom
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.all(12),
                color: Colors.white,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: 50, maxHeight: 150),
                  child: Scrollbar(
                    child: TextFormField(
                      // controller: _textController,
                      scrollController: _scrollController,
                      keyboardType: TextInputType.multiline,

                      maxLines: null,
                      minLines: 1,
                      decoration: InputDecoration(
                        hintText: 'Type a message...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        filled: true,
                        fillColor: AppColor.white,
                        contentPadding: EdgeInsets.all(12),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.send, color: AppColor.primary),
                          onPressed: () {
                            // send message
                          },
                        ),
                      ),
                      onChanged: (value) {
                        print(_scrollController.position);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
