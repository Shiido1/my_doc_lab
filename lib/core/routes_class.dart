import 'package:my_doc_lab/core/core_folder/app/app.router.dart';

class AppRoutes {
  AppRoutes();

  String returnAppRoutes(type) {
    if (type == 'doc') {
      return Routes.docDashboard;
    }
    return Routes.firstOnboardingScreen;
  }
}
