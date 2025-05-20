import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_doc_lab/core/connect_end/model/get_all_doctors_response_model/get_all_doctors_response_model.dart';
import 'package:my_doc_lab/core/connect_end/repo/doc_repo_impl.dart';
import 'package:stacked/stacked.dart';

// import '../../../ui/app_assets/app_utils.dart';
import '../../../ui/app_assets/app_color.dart';
import '../../../ui/widget/text_widget.dart';
import '../../core_folder/app/app.locator.dart';
import '../../core_folder/app/app.logger.dart';
import '../../core_folder/manager/shared_preference.dart';

class DocViewModel extends BaseViewModel {
  final BuildContext? context;
  final logger = getLogger('DocViewModel');

  final repositoryImply = DocRepoImpl();
  final session = locator<SharedPreferencesService>();
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  GetAllDoctorsResponseModelList? _getAllDoctorsResponseModelList;
  GetAllDoctorsResponseModelList? get getAllDoctorsResponseModelList =>
      _getAllDoctorsResponseModelList;

  DocViewModel({this.context});

  TimeOfDay _timeStart = TimeOfDay(hour: 00, minute: 00);
  TimeOfDay _timeEnd = TimeOfDay(hour: 00, minute: 00);

  void _selectTimeStart(context) async {
    TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _timeStart,
    );
    if (newTime != null) {
      _timeStart = newTime;
    }
    notifyListeners();
  }

  void _selectTimeEnd(context) async {
    TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _timeEnd,
    );
    if (newTime != null) {
      _timeEnd = newTime;
    }
    print('time1:::$_timeEnd');
    notifyListeners();
  }

  void openCalendarDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        DateTime selectedDate = DateTime.now();

        return ViewModelBuilder<DocViewModel>.reactive(
          viewModelBuilder: () => locator<DocViewModel>(),
          onViewModelReady: (model) {},
          disposeViewModel: false,
          builder: (_, DocViewModel model, __) {
            return AlertDialog(
              title: Text("Select a Date"),
              content: SizedBox(
                height: 600,
                width: double.maxFinite,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Card(
                        elevation: 2,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CalendarDatePicker(
                            initialDate: selectedDate,
                            firstDate: selectedDate,
                            lastDate: DateTime(2100),
                            onDateChanged: (DateTime date) {
                              // Do something with the selected date
                              // Navigator.of(context).pop(); // Close dialog
                              print("Selected date: $date");
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _selectTimeStart(context);
                              notifyListeners();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 4.w,
                                horizontal: 10.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: AppColor.darkindgrey),
                              ),

                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    text: 'Select Start Time',
                                    textStyle: GoogleFonts.gabarito(
                                      color: AppColor.darkindgrey,
                                      fontSize: 14.20.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: AppColor.darkindgrey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          TextView(
                            text: _timeStart.format(context),
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.black,
                              fontSize: 16.20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              _selectTimeEnd(context);
                              notifyListeners();
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 4.w,
                                horizontal: 10.w,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: AppColor.darkindgrey),
                              ),

                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextView(
                                    text: 'Select End Time',
                                    textStyle: GoogleFonts.gabarito(
                                      color: AppColor.darkindgrey,
                                      fontSize: 14.20.sp,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down,
                                    color: AppColor.darkindgrey,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          TextView(
                            text: _timeEnd.format(context),
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.black,
                              fontSize: 16.20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.h),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 100,
                          padding: EdgeInsets.symmetric(
                            vertical: 6.w,
                            horizontal: 10.w,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: AppColor.darkindgrey,
                            border: Border.all(color: AppColor.white),
                          ),

                          child: TextView(
                            text: 'Apply',
                            textAlign: TextAlign.center,
                            textStyle: GoogleFonts.gabarito(
                              color: AppColor.white,
                              fontSize: 18.20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  // void getAllDoctors(context) async {
  //   try {
  //     _isLoading = true;
  //     _getAllDoctorsResponseModelList = await runBusyFuture(
  //       repositoryImply.getAllDoctorDetail(),
  //       throwException: true,
  //     );

  //     _isLoading = false;
  //   } catch (e) {
  //     _isLoading = false;
  //     logger.d(e);
  //     AppUtils.snackbar(context, message: e.toString(), error: true);
  //   }
  //   notifyListeners();
  // }
}
