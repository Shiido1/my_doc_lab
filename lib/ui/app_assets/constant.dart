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
  width: 200.0,
  height: 100.0,
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
