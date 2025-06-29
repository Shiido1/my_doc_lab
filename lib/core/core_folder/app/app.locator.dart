// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';
import 'package:stacked_services/src/snackbar/snackbar_service.dart';
import 'package:stacked_shared/stacked_shared.dart';

import '../../api_folder/auth_api.dart';
import '../../api_folder/doc_api.dart';
import '../../api_folder/med_lab_api.dart';
import '../../api_folder/pharm_api.dart';
import '../../connect_end/contract/contract_impl.dart';
import '../../connect_end/contract/doc_contract_impl.dart';
import '../../connect_end/contract/med_contract_impl.dart';
import '../../connect_end/contract/pharm_contract_impl.dart';
import '../../connect_end/repo/doc_repo_impl.dart';
import '../../connect_end/repo/med_repo_impl.dart';
import '../../connect_end/repo/pharm_repo_impl.dart';
import '../../connect_end/repo/repo_impl.dart';
import '../../connect_end/view_model/auth_view_model.dart';
import '../../connect_end/view_model/doc_view_model.dart';
import '../../connect_end/view_model/med_lab_view_model.dart';
import '../../connect_end/view_model/pharm_view_model.dart';
import '../manager/shared_preference.dart';
import '../network/cloudinary_network_service.dart';
import '../network/network_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator({
  String? environment,
  EnvironmentFilter? environmentFilter,
}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => SnackbarService());
  locator.registerLazySingleton(() => SharedPreferencesService());
  locator.registerLazySingleton(() => NetworkService());
  locator.registerLazySingleton(() => CloudinaryNetworkService());
  locator.registerLazySingleton(() => AuthApi());
  locator.registerLazySingleton(() => DocAuthApi());
  locator.registerLazySingleton(() => PharmAuthApi());
  locator.registerLazySingleton(() => LabTechAuthApi());
  locator.registerLazySingleton(() => AuthContractsImpl());
  locator.registerLazySingleton(() => DocContractsImpl());
  locator.registerLazySingleton(() => PharmContractImpl());
  locator.registerLazySingleton(() => LabTechContractsImpl());
  locator.registerLazySingleton(() => AuthRepoImpl());
  locator.registerLazySingleton(() => DocRepoImpl());
  locator.registerLazySingleton(() => PharmRepoImpl());
  locator.registerLazySingleton(() => LabTechRepoImpl());
  locator.registerLazySingleton(() => AuthViewModel());
  locator.registerLazySingleton(() => DocViewModel());
  locator.registerLazySingleton(() => PharmViewModel());
  locator.registerLazySingleton(() => LabTechViewModel());
}
