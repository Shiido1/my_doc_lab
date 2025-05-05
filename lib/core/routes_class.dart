import 'package:my_doc_lab/core/core_folder/app/app.router.dart';

class AppRoutes {
  AppRoutes();

  String returnAppRoutes(type) {
    if (type == 'user') {
      return Routes.dashboard;
    } else if (type == 'doctor') {
      return Routes.docDashboard;
    } else if (type == 'pharmacist') {
      return Routes.pharmacyDashboard;
    } else if (type == 'med_lab_scientist') {
      return Routes.laboratoryDashboard;
    }
    return Routes.firstOnboardingScreen;
  }
}
