import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import '../../../widget/text_widget.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  String tab = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 22.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'My Task',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 20.h, width: 20.w),
              ],
            ),
            Divider(color: AppColor.greylight),
            SizedBox(height: 20.w),
            GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 4.w),
                width: 120.w,
                decoration: BoxDecoration(
                  color: AppColor.primary1,

                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_circle_outline_sharp,
                      color: AppColor.white,
                      size: 20.sp,
                    ),
                    SizedBox(width: 6.w),
                    TextView(
                      text: 'New Task',
                      textStyle: GoogleFonts.gabarito(
                        color: AppColor.white,
                        fontSize: 12.80.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.w),
            Container(
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: AppColor.primary1.withOpacity(.28),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () => setState(() => tab = 'All'),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.w,
                        horizontal: 10.w,
                      ),
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color:
                            tab == 'All'
                                ? AppColor.primary1
                                : AppColor.transparent,

                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextView(
                        text: 'All',
                        textStyle: GoogleFonts.dmSans(
                          color:
                              tab == 'All' ? AppColor.white : AppColor.primary1,
                          fontSize: 13.0.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => tab = 'Pending'),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.w,
                        horizontal: 10.w,
                      ),
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color:
                            tab == 'Pending'
                                ? AppColor.primary1
                                : AppColor.transparent,

                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextView(
                        text: 'Pending',
                        textStyle: GoogleFonts.dmSans(
                          color:
                              tab == 'Pending'
                                  ? AppColor.white
                                  : AppColor.primary1,
                          fontSize: 13.0.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => tab = 'Priority'),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.w,
                        horizontal: 10.w,
                      ),
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color:
                            tab == 'Priority'
                                ? AppColor.primary1
                                : AppColor.transparent,

                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextView(
                        text: 'Priority',
                        textStyle: GoogleFonts.gabarito(
                          color:
                              tab == 'Priority'
                                  ? AppColor.white
                                  : AppColor.primary1,
                          fontSize: 13.0.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => setState(() => tab = 'Completed'),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.w,
                        horizontal: 10.w,
                      ),
                      decoration: BoxDecoration(
                        // ignore: deprecated_member_use
                        color:
                            tab == 'Completed'
                                ? AppColor.primary1
                                : AppColor.transparent,

                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextView(
                        text: 'Completed',
                        textStyle: GoogleFonts.gabarito(
                          color:
                              tab == 'Completed'
                                  ? AppColor.white
                                  : AppColor.primary1,
                          fontSize: 13.0.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (tab == 'All')
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.w,
                              horizontal: 10.w,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColor.greylight),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(6.0.w),

                                  margin: EdgeInsets.only(top: 4.w),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: AppColor.fineRed),
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text:
                                          'Review Sarah Johnson\'s blood test results',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.darkindgrey,
                                        fontSize: 12.80.sp,
                                        letterSpacing: -1,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    TextView(
                                      text:
                                          'Check hypertension medication effectiveness',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.darkindgrey.withOpacity(
                                          .3,
                                        ),

                                        letterSpacing: -1,
                                        fontSize: 10.80.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    TextView(
                                      text: 'Due: 4/30/2025',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.darkindgrey.withOpacity(
                                          .3,
                                        ),
                                        fontSize: 10.80.sp,

                                        letterSpacing: -1,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 2.w,
                                        horizontal: 6.w,
                                      ),
                                      decoration: BoxDecoration(
                                        // ignore: deprecated_member_use
                                        color: AppColor.fineRed.withOpacity(.2),

                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TextView(
                                        text: 'High',
                                        textStyle: GoogleFonts.gabarito(
                                          color: AppColor.fineRed,
                                          fontSize: 12.0.sp,
                                          letterSpacing: -1,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 30.h),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(6.80.w),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColor.friendlyPrimary,
                                          ),
                                        ),
                                        SizedBox(width: 6.8.w),
                                        TextView(
                                          text: 'Sarah Johnson',
                                          textStyle: GoogleFonts.gabarito(
                                            color: AppColor.darkindgrey,
                                            fontSize: 10.sp,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    else if (tab == 'Pending')
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 10.w,
                              horizontal: 10.w,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: AppColor.greylight),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(6.0.w),

                                  margin: EdgeInsets.only(top: 4.w),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: AppColor.yellow),
                                  ),
                                ),
                                SizedBox(width: 10.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextView(
                                      text:
                                          'Review Sarah Johnson\'s blood test results',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.darkindgrey,
                                        fontSize: 12.80.sp,
                                        letterSpacing: -1,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    TextView(
                                      text:
                                          'Check hypertension medication effectiveness',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.darkindgrey.withOpacity(
                                          .3,
                                        ),

                                        letterSpacing: -1,
                                        fontSize: 10.80.sp,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(height: 10.h),
                                    TextView(
                                      text: 'Due: 4/30/2025',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.darkindgrey.withOpacity(
                                          .3,
                                        ),
                                        fontSize: 10.80.sp,

                                        letterSpacing: -1,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        vertical: 2.w,
                                        horizontal: 6.w,
                                      ),
                                      decoration: BoxDecoration(
                                        // ignore: deprecated_member_use
                                        color: AppColor.yellow.withOpacity(.2),

                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: TextView(
                                        text: 'Medium',
                                        textStyle: GoogleFonts.gabarito(
                                          color: AppColor.yellow,
                                          fontSize: 12.0.sp,
                                          letterSpacing: -1,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 30.h),
                                    Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(6.80.w),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColor.friendlyPrimary,
                                          ),
                                        ),
                                        SizedBox(width: 6.8.w),
                                        TextView(
                                          text: 'Sarah Johnson',
                                          textStyle: GoogleFonts.gabarito(
                                            color: AppColor.darkindgrey,
                                            fontSize: 10.sp,
                                            letterSpacing: 0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    else if (tab == 'Priority')
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.w,
                          horizontal: 10.w,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.greylight),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(6.0.w),

                              margin: EdgeInsets.only(top: 4.w),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColor.fineRed),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text:
                                      'Review Sarah Johnson\'s blood test results',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.darkindgrey,
                                    fontSize: 12.80.sp,
                                    letterSpacing: -1,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                TextView(
                                  text:
                                      'Check hypertension medication effectiveness',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.darkindgrey.withOpacity(.3),

                                    letterSpacing: -1,
                                    fontSize: 10.80.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                TextView(
                                  text: 'Due: 4/30/2025',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.darkindgrey.withOpacity(.3),
                                    fontSize: 10.80.sp,

                                    letterSpacing: -1,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 2.w,
                                    horizontal: 6.w,
                                  ),
                                  decoration: BoxDecoration(
                                    // ignore: deprecated_member_use
                                    color: AppColor.fineRed.withOpacity(.2),

                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: TextView(
                                    text: 'High',
                                    textStyle: GoogleFonts.gabarito(
                                      color: AppColor.fineRed,
                                      fontSize: 12.0.sp,
                                      letterSpacing: -1,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30.h),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(6.80.w),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColor.friendlyPrimary,
                                      ),
                                    ),
                                    SizedBox(width: 6.8.w),
                                    TextView(
                                      text: 'Sarah Johnson',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.darkindgrey,
                                        fontSize: 10.sp,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    else
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.w,
                          horizontal: 10.w,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: AppColor.greylight),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(6.0.w),

                              margin: EdgeInsets.only(top: 4.w),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColor.primary,
                                border: Border.all(color: AppColor.darkindgrey),
                              ),
                            ),
                            SizedBox(width: 10.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextView(
                                  text:
                                      'Review Sarah Johnson\'s blood test results',
                                  textStyle: GoogleFonts.gabarito(
                                    color: AppColor.darkindgrey,
                                    fontSize: 12.80.sp,
                                    letterSpacing: -1,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(height: 10.h),
                                Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(6.80.w),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColor.friendlyPrimary,
                                      ),
                                    ),
                                    SizedBox(width: 6.8.w),
                                    TextView(
                                      text: 'Sarah Johnson',
                                      textStyle: GoogleFonts.gabarito(
                                        color: AppColor.darkindgrey,
                                        fontSize: 10.sp,
                                        letterSpacing: 0,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 2.w,
                                horizontal: 6.w,
                              ),
                              decoration: BoxDecoration(
                                // ignore: deprecated_member_use
                                border: Border.all(color: AppColor.yellow),

                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TextView(
                                text: 'Medium',
                                textStyle: GoogleFonts.gabarito(
                                  color: AppColor.brown,
                                  fontSize: 12.0.sp,
                                  letterSpacing: -1,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(height: 30.h),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
