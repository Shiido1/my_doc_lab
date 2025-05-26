import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:shimmer/shimmer.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

final oCcy = NumberFormat("#,##0.00", "en_US");

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
  String formattedDate = DateFormat('dd').format(parsedDate.toLocal());
  return formattedDate;
}

String getWeekdayAbbreviation(String dateStr) {
  // Parse the string to DateTime
  final dateTime = DateTime.parse(dateStr);

  // Format it to abbreviated weekday (e.g., Mon, Tue, Wed...)
  return DateFormat.E().format(dateTime);
}
