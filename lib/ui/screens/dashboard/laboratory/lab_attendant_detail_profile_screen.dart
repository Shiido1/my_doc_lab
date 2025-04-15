import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import '../../../app_assets/app_image.dart';
import '../../../widget/text_widget.dart';
import '../appointment/consultation_screen.dart';

class LaboratoryDetailScreen extends StatefulWidget {
  const LaboratoryDetailScreen({super.key});

  @override
  State<LaboratoryDetailScreen> createState() => _LaboratoryDetailScreenState();
}

class _LaboratoryDetailScreenState extends State<LaboratoryDetailScreen> {
  List valueList = [
    {'day': 'Mon', 'date': '21'},
    {'day': 'Tue', 'date': '22'},
    {'day': 'Wed', 'date': '23'},
    {'day': 'Thu', 'date': '24'},
    {'day': 'Fri', 'date': '25'},
    {'day': 'Sat', 'date': '26'},
    {'day': 'Sun', 'date': '27'},
  ];

  List timeList = [
    '9:00 AM',
    '10:00 AM',
    '11:00 AM',
    '1:00 PM',
    '2:00 PM',
    '3:00 PM',
    '4:00 PM',
    '5:00 PM',
    '6:00 PM',
  ];

  var v;
  var t;

  bool isTapped = false;
  List<String> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.keyboard_arrow_left, size: 30.sp),
            ),
            SizedBox(height: 10.h),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: Image.asset(
                    AppImage.finedoc,
                    height: 136.h,
                    width: 130.w,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 15.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextView(
                        text: 'Dr Bolu Adeleke',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.black,
                          fontSize: 20.0.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      TextView(
                        text: 'Cardiologist',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.grey,
                          fontSize: 14.0.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 10.h),

                      Container(
                        width: 50.w,
                        padding: EdgeInsets.symmetric(
                          vertical: 2.h,
                          horizontal: 6.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.r),
                          color: AppColor.primary,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: AppColor.white,
                              size: 14.sp,
                            ),
                            SizedBox(width: 3.w),
                            TextView(
                              text: '4.8',
                              textStyle: GoogleFonts.dmSans(
                                color: AppColor.white,
                                fontSize: 12.0.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.w),
                      Row(
                        children: [
                          SvgPicture.asset(
                            AppImage.location,
                            height: 14.h,
                            width: 14.w,
                          ),
                          SizedBox(width: 4.w),
                          TextView(
                            text: '800m away',
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.black,
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.w),
            TextView(
              text: 'About',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.black,
                fontSize: 16.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20.w),
            !isTapped
                ? Wrap(
                  children: [
                    SizedBox(
                      width: 350.w,
                      child: TextView(
                        text:
                            'Lorem ipsum dolor sit amet consectetur. Eu malesuada eu porta vitae neque ac. Purus lectus id suspendisse tempus morbi massa lectus urna. Maecenas donec eget eu et sed. Enim egestas arcu',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.black,
                          fontSize: 14.60.sp,
                          fontWeight: FontWeight.w400,
                        ),
                        maxLines: 3,
                        textOverflow: TextOverflow.ellipsis,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isTapped = true;
                        });
                      },
                      child: TextView(
                        text: 'Read More',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.green,
                          fontSize: 14.60.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                )
                : Wrap(
                  children: [
                    SizedBox(
                      child: TextView(
                        text:
                            'Lorem ipsum dolor sit amet consectetur. Eu malesuada eu porta vitae neque ac. Purus lectus id suspendisse tempus morbi massa lectus urna. Maecenas donec eget eu et sed. Enim egestas arcu, Lorem ipsum dolor sit amet consectetur. Eu malesuada eu porta vitae neque ac. Purus lectus id suspendisse tempus morbi massa lectus urna. Maecenas donec eget eu et sed. Enim egestas arcu,Lorem ipsum dolor sit amet consectetur. Eu malesuada eu porta vitae neque ac. Purus lectus id suspendisse tempus morbi massa lectus urna. Maecenas donec eget eu et sed. Enim egestas arcu',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.black,
                          fontSize: 14.60.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isTapped = false;
                        });
                      },
                      child: TextView(
                        text: 'Read Less',
                        textStyle: GoogleFonts.gabarito(
                          color: AppColor.green,
                          fontSize: 14.60.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
            SizedBox(height: 20.w),
            TextView(
              text: 'Time Availability',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.black,
                fontSize: 16.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10.w),
            TextView(
              text: 'Mon - Sat : 10:00 am - 5:00 pm',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.grey1,
                fontSize: 14.20.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 20.w),
            TextView(
              text: 'Certification',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.black,
                fontSize: 16.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20.w),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(AppImage.gradcap, height: 20.h, width: 20.w),
                SizedBox(width: 18.20.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView(
                      text: 'University of Jos',
                      textStyle: GoogleFonts.gabarito(
                        color: AppColor.black,
                        fontSize: 14.60.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 2.4.h),
                    TextView(
                      text: 'Doctor of Medicine',
                      textStyle: GoogleFonts.gabarito(
                        color: AppColor.green,
                        fontSize: 14.60.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20.w),
            TextView(
              text: 'Experience',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.black,
                fontSize: 16.0.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20.w),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(AppImage.exp, height: 20.h, width: 20.w),
                SizedBox(width: 18.20.w),
                SizedBox(
                  width: 300.w,
                  child: TextView(
                    text: 'Bio-royal hospital & Maternity(Medicine Center)',
                    maxLines: 4,
                    textOverflow: TextOverflow.ellipsis,
                    textStyle: GoogleFonts.gabarito(
                      color: AppColor.black,
                      fontSize: 14.60.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.w),
            TextView(
              text: 'Available Dates',
              textStyle: GoogleFonts.dmSans(
                color: AppColor.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Divider(color: AppColor.grey, thickness: .5),
            SizedBox(height: 10.h),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ...valueList.map(
                    (o) => GestureDetector(
                      onTap: () {
                        setState(() {
                          v = o;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 20.w),
                        padding: EdgeInsets.symmetric(
                          vertical: 6.w,
                          horizontal: 6.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color:
                              v == o ? AppColor.primary1 : AppColor.transparent,
                          border: Border.all(color: AppColor.funnyLookingGrey),
                        ),
                        child: Column(
                          children: [
                            TextView(
                              text: o['day'],
                              textStyle: GoogleFonts.dmSans(
                                color: v == o ? AppColor.white : AppColor.grey,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextView(
                              text: o['date'],
                              textStyle: GoogleFonts.dmSans(
                                color: v == o ? AppColor.white : AppColor.black,
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Divider(color: AppColor.grey, thickness: .2),
            SizedBox(height: 10.h),
            Wrap(
              children: [
                ...timeList.map(
                  (o) => GestureDetector(
                    onTap: () {
                      setState(() {
                        t = o;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 20.w, bottom: 10.w),
                      padding: EdgeInsets.symmetric(
                        vertical: 5.4.w,
                        horizontal: 14.w,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color:
                            t == o ? AppColor.primary1 : AppColor.transparent,
                        border: Border.all(color: AppColor.funnyLookingGrey),
                      ),
                      child: TextView(
                        text: o,
                        textStyle: GoogleFonts.dmSans(
                          color: t == o ? AppColor.white : AppColor.black,
                          fontSize: 15.6.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.w),
            TextView(
              text: 'Available Services',
              textStyle: GoogleFonts.gabarito(
                color: AppColor.black,
                fontSize: 16.sp,
                letterSpacing: 0,
                fontWeight: FontWeight.w400,
              ),
            ),
            Divider(color: AppColor.grey, thickness: .5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Blood Sugar',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 16.sp,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Checkbox(
                  value: selectedOptions.contains('Blood Sugar'),
                  onChanged: (isChecked) {
                    setState(() {
                      if (isChecked!) {
                        selectedOptions.add('Blood Sugar');
                      } else {
                        selectedOptions.remove('Blood Sugar');
                      }
                    });
                  },
                ),
              ],
            ),
            Divider(color: AppColor.grey, thickness: .5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Malaria and Typhoid Test',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 16.sp,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Checkbox(
                  value: selectedOptions.contains('Malaria and Typhoid Test'),
                  onChanged: (isChecked) {
                    setState(() {
                      if (isChecked!) {
                        selectedOptions.add('Malaria and Typhoid Test');
                      } else {
                        selectedOptions.remove('Malaria and Typhoid Test');
                      }
                    });
                  },
                ),
              ],
            ),
            Divider(color: AppColor.grey, thickness: .5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Ultrasound',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 16.sp,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Checkbox(
                  value: selectedOptions.contains('Ultrasound'),
                  onChanged: (isChecked) {
                    setState(() {
                      if (isChecked!) {
                        selectedOptions.add('Ultrasound');
                      } else {
                        selectedOptions.remove('Ultrasound');
                      }
                    });
                  },
                ),
              ],
            ),
            Divider(color: AppColor.grey, thickness: .5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Skull X-ray',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 16.sp,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Checkbox(
                  value: selectedOptions.contains('Skull X-ray'),
                  onChanged: (isChecked) {
                    setState(() {
                      if (isChecked!) {
                        selectedOptions.add('Skull X-ray');
                      } else {
                        selectedOptions.remove('Skull X-ray');
                      }
                    });
                  },
                ),
              ],
            ),
            Divider(color: AppColor.grey, thickness: .5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextView(
                  text: 'Hand X-ray All view and Reports',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 16.sp,
                    letterSpacing: 0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Checkbox(
                  value: selectedOptions.contains(
                    'Hand X-ray All view and Reports',
                  ),
                  onChanged: (isChecked) {
                    setState(() {
                      if (isChecked!) {
                        selectedOptions.add('Hand X-ray All view and Reports');
                      } else {
                        selectedOptions.remove(
                          'Hand X-ray All view and Reports',
                        );
                      }
                    });
                  },
                ),
              ],
            ),
            Divider(color: AppColor.grey, thickness: .5),
            SizedBox(height: 40.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ConsultationScreen(),
                        ),
                      ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 7.2.w,
                      horizontal: 14.0.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.primary1,
                    ),
                    child: TextView(
                      text: 'Book Appointment',
                      textStyle: GoogleFonts.gabarito(
                        color: AppColor.white,
                        fontSize: 14.0.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap:
                      () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ConsultationScreen(),
                        ),
                      ),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 7.2.w,
                      horizontal: 14.0.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 181, 222, 204),
                    ),
                    child: TextView(
                      text: 'Book for Someone else',
                      textStyle: GoogleFonts.gabarito(
                        color: AppColor.darkindgrey,
                        fontSize: 14.0.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 60.h),
          ],
        ),
      ),
    );
  }
}
