// ignore_for_file: must_be_immutable

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:doc_lab_pharm/ui/app_assets/app_color.dart';
import 'package:stacked/stacked.dart';

import '../../../../../core/connect_end/model/get_doctors_analysis_model/patients_vist.dart';
import '../../../../../core/connect_end/view_model/doc_view_model.dart';
import '../../../../../core/core_folder/app/app.locator.dart';
import '../../../../widget/text_widget.dart';

class DoctorsAnalysisScreen extends StatelessWidget {
  const DoctorsAnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<DocViewModel>.reactive(
        viewModelBuilder: () => locator<DocViewModel>(),
        onViewModelReady: (model) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            model.getDoctorsAnalysis(context);
          });
        },
        disposeViewModel: false,
        builder: (_, DocViewModel model, __) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 22.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                TextView(
                  text: 'Patient\'s Appoinment Analysis',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20.h),
                if (model.getDoctorsAnalysisModel != null)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: 500.w, // ✅ set your maximum width here
                          ),
                          child: Container(
                            height: 300.h,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              vertical: 6.w,
                              horizontal: 4.w,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: AppColor.friendlyPrimary,
                            ),
                            child: LineChart(
                              LineChartData(
                                gridData: FlGridData(show: true),
                                titlesData: FlTitlesData(
                                  bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      interval: 1,
                                      getTitlesWidget: (value, meta) {
                                        final index = value.toInt();
                                        if (index <
                                            model
                                                .getDoctorsAnalysisModel!
                                                .patientsVist!
                                                .length) {
                                          return TextView(
                                            text: model.returnMonthText(
                                              model
                                                  .getDoctorsAnalysisModel!
                                                  .patientsVist![index]
                                                  .month,
                                            ),
                                            textStyle: GoogleFonts.gabarito(
                                              color: AppColor.black,
                                              fontSize: 13.20.sp,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          );
                                        }
                                        return const SizedBox.shrink();
                                      },
                                    ),
                                  ),
                                ),
                                borderData: FlBorderData(show: true),
                                lineBarsData: [
                                  LineChartBarData(
                                    spots:
                                        model
                                            .getDoctorsAnalysisModel!
                                            .patientsVist!
                                            .asMap()
                                            .entries
                                            .map((entry) {
                                              final index =
                                                  entry.key.toDouble();
                                              final total =
                                                  entry.value.total as int;
                                              return FlSpot(
                                                index,
                                                total.toDouble(),
                                              );
                                            })
                                            .toList(),
                                    isCurved: true,
                                    barWidth: 2,
                                    color: AppColor.primary1,
                                    dotData: FlDotData(show: true),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 10.h),
                TextView(
                  text: 'Line Chart',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 16.20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 20.h),
                if (model.getDoctorsAnalysisModel != null)
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(
                            maxWidth: 500.w, // ✅ set your maximum width here
                          ),
                          child: Container(
                            height: 300.h,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                              vertical: 6.w,
                              horizontal: 4.w,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: AppColor.friendlyPrimary,
                            ),
                            child: BarChart(
                              BarChartData(
                                alignment: BarChartAlignment.spaceAround,
                                maxY: getMaxY(
                                  model.getDoctorsAnalysisModel!.patientsVist!,
                                ),
                                minY: 0,
                                borderData: FlBorderData(show: true),
                                barTouchData: BarTouchData(enabled: true),
                                titlesData: FlTitlesData(
                                  leftTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      reservedSize: 30,
                                    ),
                                  ),
                                  bottomTitles: AxisTitles(
                                    sideTitles: SideTitles(
                                      showTitles: true,
                                      interval: 1,
                                      getTitlesWidget: (value, meta) {
                                        final index = value.toInt();
                                        if (index >= 0 &&
                                            index <
                                                model
                                                    .getDoctorsAnalysisModel!
                                                    .patientsVist!
                                                    .length) {
                                          return TextView(
                                            text: model.returnMonthText(
                                              model
                                                  .getDoctorsAnalysisModel!
                                                  .patientsVist![index]
                                                  .month,
                                            ),
                                            textStyle: GoogleFonts.gabarito(
                                              color: AppColor.black,
                                              fontSize: 13.20.sp,
                                              fontWeight: FontWeight.w300,
                                            ),
                                          );
                                        }
                                        return const SizedBox.shrink();
                                      },
                                    ),
                                  ),
                                ),
                                barGroups:
                                    model.getDoctorsAnalysisModel!.patientsVist!
                                        .asMap()
                                        .entries
                                        .map((entry) {
                                          final index = entry.key;
                                          final total =
                                              entry.value.total as int;
                                          return BarChartGroupData(
                                            x: index,
                                            barRods: [
                                              BarChartRodData(
                                                toY: total.toDouble(),
                                                width: 10,
                                                color: Colors.blue,
                                                borderRadius: BorderRadius.zero,
                                              ),
                                            ],
                                          );
                                        })
                                        .toList(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 10.h),
                TextView(
                  text: 'Bar Chart',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 16.20.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                SizedBox(height: 20.h),
              ],
            ),
          );
        },
      ),
    );
  }

  double getMaxY(List<PatientsVist> data) {
    final max = data.map((e) => e.total as int).reduce((a, b) => a > b ? a : b);
    return (max + 5).toDouble(); // add headroom
  }
}
