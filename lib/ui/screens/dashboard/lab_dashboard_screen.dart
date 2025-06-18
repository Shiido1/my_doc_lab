// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_doc_lab/ui/screens/dashboard/laboratory/lab_appointment_screen.dart';
import 'package:my_doc_lab/ui/screens/dashboard/settings/lab_settings/lab_settings_screen.dart';

import '../../app_assets/app_color.dart';
import '../../app_assets/app_image.dart';
import '../../widget/text_widget.dart';
import 'laboratory/lab_order_screen.dart';
import 'home/laboratory_home_screen.dart';

// ignore: must_be_immutable
class LaboratoryDashboard extends StatefulWidget {
  const LaboratoryDashboard({super.key});

  @override
  State<LaboratoryDashboard> createState() => _LaboratoryDashboardState();
}

class _LaboratoryDashboardState extends State<LaboratoryDashboard> {
  int _currentIndex = 0;

  final List<Widget> _body = [
    LaboratoryHomeScreen(),
    LaboratoryAppointmentScreen(),
    LaboratoryOrderScreen(),
    LabSettingsScreen(),
  ];

  Future<bool> willPopControl() async {
    return (await showDialog(
          context: context,
          builder:
              (context) => AlertDialog(
                content: TextView(
                  text: 'Do you want to exit the app',
                  textAlign: TextAlign.center,
                  fontSize: 18.0.sp,
                  color: AppColor.black,
                  fontWeight: FontWeight.w400,
                ),
                actions: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        style: TextButton.styleFrom(
                          foregroundColor: AppColor.red, // Text Color
                        ),
                        child: TextView(
                          text: 'No',
                          fontSize: 20.sp,
                          color: AppColor.red,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextButton(
                        onPressed: () => exitApp(),
                        style: TextButton.styleFrom(
                          foregroundColor: AppColor.green, // Text Color
                        ),
                        child: TextView(
                          text: 'Yes',
                          fontSize: 20.sp,
                          color: AppColor.green,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
        )) ??
        false;
  }

  exitApp() {
    Future.delayed(const Duration(milliseconds: 1000), () {
      SystemChannels.platform.invokeListMethod('SystemNavigator.pop');
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: willPopControl,
      child: Scaffold(
        body: Center(child: _body[_currentIndex]),
        bottomNavigationBar: Theme(
          data: ThemeData(
            splashColor: AppColor.transparent,
            highlightColor: AppColor.transparent,
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: AppColor.white,
              splashColor: AppColor.transparent,
            ),
            child: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (index) => setState(() => _currentIndex = index),
              selectedItemColor: AppColor.darkindgrey,
              type: BottomNavigationBarType.shifting,
              selectedFontSize: 14.8.sp,
              unselectedFontSize: 14.6.sp,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImage.home,
                    color:
                        _currentIndex == 0
                            ? AppColor.darkindgrey
                            : AppColor.funnyLookingGrey,
                    height: 30.h,
                    width: 30.w,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImage.appoint,
                    color:
                        _currentIndex == 1
                            ? AppColor.darkindgrey
                            : AppColor.funnyLookingGrey,
                    height: 30.0.h,
                    width: 30.w,
                  ),
                  label: 'Appointment',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImage.order,
                    color:
                        _currentIndex == 2
                            ? AppColor.darkindgrey
                            : AppColor.funnyLookingGrey,
                    height: 30.h,
                    width: 30.w,
                  ),
                  label: 'Order',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppImage.settings,
                    color:
                        _currentIndex == 3
                            ? AppColor.darkindgrey
                            : AppColor.funnyLookingGrey,
                    height: 30.h,
                    width: 30.w,
                  ),
                  label: 'Settings',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
