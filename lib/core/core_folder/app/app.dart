import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../ui/onboarding/first_onboarding_screen.dart';
import '../../../ui/screens/authentication/login_screen.dart';
import '../../../ui/screens/dashboard/dashboard_screen.dart';
import '../../../ui/screens/dashboard/doctor_dashboard_screen.dart';
import '../../../ui/screens/dashboard/lab_dashboard_screen.dart';
import '../../../ui/screens/dashboard/pharmacy_dashboard_screen.dart';
import '../../../ui/screens/dashboard/settings/profile_screen.dart';
import '../../api_folder/auth_api.dart';
import '../../api_folder/doc_api.dart';
import '../../connect_end/contract/contract_impl.dart';
import '../../connect_end/contract/doc_contract_impl.dart';
import '../../connect_end/repo/doc_repo_impl.dart';
import '../../connect_end/repo/repo_impl.dart';
import '../../connect_end/view_model/auth_view_model.dart';
import '../../connect_end/view_model/doc_view_model.dart';
import '../manager/shared_preference.dart';
import '../network/network_service.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: FirstOnboardingScreen, initial: true),
    MaterialRoute(page: Dashboard),
    MaterialRoute(page: DocDashboard),
    MaterialRoute(page: LaboratoryDashboard),
    MaterialRoute(page: PharmacyDashboard),
    MaterialRoute(page: LoginScreen),
    MaterialRoute(page: ProfileScreen),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: SharedPreferencesService),
    LazySingleton(classType: NetworkService),
    LazySingleton(classType: AuthApi),
    LazySingleton(classType: DocAuthApi),
    LazySingleton(classType: AuthContractsImpl),
    LazySingleton(classType: DocContractsImpl),
    LazySingleton(classType: AuthRepoImpl),
    LazySingleton(classType: DocRepoImpl),
    LazySingleton(classType: AuthViewModel),
    LazySingleton(classType: DocViewModel),
  ],
  logger: StackedLogger(),
)
class App {}
