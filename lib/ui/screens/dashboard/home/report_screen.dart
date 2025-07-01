// ignore_for_file: must_be_immutable, deprecated_member_use
import 'dart:async';

import 'package:fl_downloader/fl_downloader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:my_doc_lab/ui/app_assets/app_color.dart';
import 'package:my_doc_lab/ui/app_assets/app_utils.dart';
import 'package:stacked/stacked.dart';
import '../../../../core/connect_end/model/get_report_response_model/report.dart';
import '../../../../core/connect_end/view_model/auth_view_model.dart';
import '../../../../core/core_folder/app/app.locator.dart';
import '../../../app_assets/constant.dart';
import '../../../widget/text_widget.dart';

class ReportScreen extends StatefulWidget {
  ReportScreen({super.key, this.report});
  Report? report;

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  int progress = 0;
  late StreamSubscription progressStream;
  bool isLoadingDownload = false;

  @override
  void initState() {
    FlDownloader.initialize();
    progressStream = FlDownloader.progressStream.listen((event) {
      if (event.status == DownloadStatus.successful) {
        setState(() {
          progress = event.progress;
          isLoadingDownload = false;
        });
        FlDownloader.openFile(filePath: event.filePath);
      } else if (event.status == DownloadStatus.running) {
        setState(() {
          progress = event.progress;
          isLoadingDownload = true;
        });
      } else if (event.status == DownloadStatus.failed) {
        setState(() {
          progress = event.progress;
          isLoadingDownload = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    progressStream.cancel();
    progress = 0;
    isLoadingDownload = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: ViewModelBuilder<AuthViewModel>.reactive(
        viewModelBuilder: () => locator<AuthViewModel>(),
        onViewModelReady: (model) {},
        disposeViewModel: false,
        builder: (_, AuthViewModel model, __) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 50.w, horizontal: 22.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),
                TextView(
                  text: 'Report',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 24.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20.h),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    widget.report?.imageUrl ?? '',
                    height: 440.h,
                    width: 300.w,
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) => shimmerViewPharm(),
                  ),
                ),
                SizedBox(height: 20.h),
                TextView(
                  text: 'Diagnosis: ${widget.report?.diagnosis ?? ''}',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 18.0.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 2.w, horizontal: 6.w),
                  decoration: BoxDecoration(
                    color: model
                        .statusValuePatientsColor(widget.report?.status)
                        .withOpacity(.2),
                    borderRadius: BorderRadius.circular(6.2),
                  ),
                  child: TextView(
                    text: '${widget.report?.status?.capitalize()}',
                    textStyle: GoogleFonts.gabarito(
                      color: model.statusValuePatientsColor(
                        widget.report?.status,
                      ),
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                TextView(
                  text: 'Summary: ${widget.report?.summary ?? ''}',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 16.0.sp,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                SizedBox(height: 4.10.h),
                TextView(
                  text:
                      'Date: ${DateFormat('dd MMM, yyyy').format(DateTime.parse(widget.report!.date.toString()).toLocal())}',
                  textStyle: GoogleFonts.gabarito(
                    color: AppColor.black,
                    fontSize: 15.60.sp,
                  ),
                ),
                SizedBox(height: 20.h),
                !isLoadingDownload
                    ? GestureDetector(
                      onTap: () async {
                        if (widget.report!.imageUrl!.contains(
                          'https://res.cloudinary.com',
                        )) {
                          var permission =
                              await FlDownloader.requestPermission();
                          if (permission == StoragePermissionStatus.granted) {
                            await FlDownloader.download(
                              widget.report!.imageUrl!,
                              fileName: 'Doclabpharm Lab Report',
                            );
                          }
                        } else {
                          AppUtils.snackbarTop(
                            context,
                            message: 'File Error Can\'t download.',
                            error: true,
                          );
                        }
                        setState(() {});
                      },
                      child: Container(
                        width: 130.w,
                        padding: EdgeInsets.symmetric(
                          vertical: 6.w,
                          horizontal: 6.w,
                        ),
                        decoration: BoxDecoration(
                          color: AppColor.primary,
                          borderRadius: BorderRadius.circular(6.2),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.download_outlined,
                              color: AppColor.white,
                              size: 30.sp,
                            ),
                            TextView(
                              text: 'Download',
                              textStyle: GoogleFonts.gabarito(
                                color: AppColor.white,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    : SizedBox(
                      height: 20.h,
                      width: 20.w,
                      child: CircularProgressIndicator(
                        color: AppColor.primary1,
                      ),
                    ),

                SizedBox(height: 40.h),
                progress == 0
                    ? SizedBox.shrink()
                    : Center(
                      child: Container(
                        padding: EdgeInsets.all(6.w),
                        decoration: BoxDecoration(
                          color: AppColor.lightgrey.withOpacity(.5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextView(
                          text: 'Downloading Progress: $progress',
                          textStyle: GoogleFonts.gabarito(
                            color: AppColor.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                SizedBox(height: 40.h),
              ],
            ),
          );
        },
      ),
    );
  }
}
