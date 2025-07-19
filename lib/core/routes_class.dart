import 'package:doc_lab_pharm/core/core_folder/app/app.router.dart';

class AppRoutes {
  AppRoutes();

  String returnAppRoutes(type) {
    if (type == 'user') {
      return Routes.dashboard;
    } else if (type == 'doctor') {
      return Routes.docDashboard;
    } else if (type == 'pharmacy') {
      return Routes.pharmacyDashboard;
    } else if (type == 'lab_technician') {
      return Routes.laboratoryDashboard;
    }
    return Routes.firstOnboardingScreen;
  }
}
