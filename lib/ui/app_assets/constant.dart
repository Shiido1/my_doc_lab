import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:doc_lab_pharm/ui/app_assets/app_color.dart';
import 'package:shimmer/shimmer.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String capitalizeWords() {
    return split(' ').map((word) => word.capitalize()).join(' ');
  }
}

final oCcy = NumberFormat("#,##0.00", "en_US");
final oCcyMeds = NumberFormat("#,##0", "en_US");

String getCurrency() {
  var format = NumberFormat.simpleCurrency(
    locale: Platform.localeName,
    name: 'NGN',
  );
  return format.currencySymbol;
}

shimmerView() => SizedBox(
  width: 200.w,
  height: 100.h,
  child: Shimmer.fromColors(
    baseColor: AppColor.friendlyPrimary,
    highlightColor: AppColor.primary1,
    child: Container(
      height: 180.h,
      width: 80.w,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
    ),
  ),
);

shimmerChatView() => SizedBox(
  width: double.infinity.w,
  height: 70.h,
  child: Shimmer.fromColors(
    baseColor: AppColor.friendlyPrimary.withOpacity(.9),
    highlightColor: AppColor.white,
    child: Container(
      width: double.infinity.w,
      height: 80.h,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
    ),
  ),
);
shimmerPresView() => SizedBox(
  width: double.infinity.w,
  height: 70.h,
  child: Shimmer.fromColors(
    baseColor: AppColor.white,
    highlightColor: AppColor.white,
    child: Container(
      width: double.infinity.w,
      height: 80.h,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(10.r),
      ),
    ),
  ),
);

shimmerViewDoc() => SizedBox(
  width: 160.0,
  height: 160.0,
  child: Shimmer.fromColors(
    baseColor: AppColor.friendlyPrimary,
    highlightColor: AppColor.primary1,
    child: Container(
      height: 180.h,
      width: 80.w,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
    ),
  ),
);

shimmerViewPharm() => SizedBox(
  width: 200.0,
  height: 114.0,
  child: Shimmer.fromColors(
    baseColor: AppColor.friendlyPrimary,
    highlightColor: AppColor.primary1,
    child: Container(
      height: 180.h,
      width: 80.w,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
    ),
  ),
);

shimmerViewLabPatient() => SizedBox(
  width: double.infinity,
  height: 120.0,
  child: Shimmer.fromColors(
    baseColor: AppColor.friendlyPrimary,
    highlightColor: AppColor.primary1,
    child: Container(
      height: 180.h,
      width: 80.w,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
    ),
  ),
);

shimmerVieRound() => Shimmer.fromColors(
  baseColor: AppColor.friendlyPrimary,
  highlightColor: AppColor.primary1,
  child: Container(
    height: 60.h,
    width: 60.w,
    decoration: BoxDecoration(
      color: AppColor.white,
      // borderRadius: BorderRadius.circular(12.r),
      shape: BoxShape.circle,
    ),
  ),
);

String formTime(time) {
  DateTime parsedTime = DateFormat("HH:mm:ss").parse(time);

  // Format to 12-hour time with AM/PM
  String formattedTime = DateFormat("h:mm a").format(parsedTime);
  return formattedTime;
}

availDayForm(time) {
  DateTime parsedDate = DateTime.parse(time);

  // Format as "Thu 8"
  String formattedDate = DateFormat('EEE').format(parsedDate.toLocal());
  return formattedDate;
}

availDateForm(time) {
  DateTime parsedDate = DateTime.parse(time);

  // Format as "08"
  int formattedDate = parsedDate.day;
  return formattedDate.toString();
}

String getWeekdayAbbreviation(String dateStr) {
  // Parse the string to DateTime
  final dateTime = DateTime.parse(dateStr);

  // Format it to abbreviated weekday (e.g., Mon, Tue, Wed...)
  return DateFormat.E().format(dateTime);
}
