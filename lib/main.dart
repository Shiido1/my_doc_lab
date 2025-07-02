import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_doc_lab/core/connect_end/model/checkoutentitymodel.dart';
import 'package:my_doc_lab/core/core_folder/manager/shared_preference.dart';
import 'package:my_doc_lab/core/routes_class.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'core/core_folder/app/app.locator.dart';
import 'core/core_folder/app/app.router.dart';

final navigate = locator<NavigationService>();
late Box box;
var globalfCMToken;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Lock orientation early
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  final stopwatch = Stopwatch()..start();

  setupLocator();

  await Future.wait([
    locator<SharedPreferencesService>().initilize(),
    Hive.initFlutter(),
  ]);

  Hive.registerAdapter(CheckoutEntityModelAdapter());
  box = await Hive.openBox<CheckoutEntityModel>('checkout');
  debugPrint('Initialization took ${stopwatch.elapsedMilliseconds} ms');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder:
          (BuildContext context, Widget? child) => MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: AppRoutes().returnAppRoutes(
              SharedPreferencesService.instance.usersData['userType'],
            ),
            navigatorKey: StackedService.navigatorKey,
            onGenerateRoute: StackedRouter().onGenerateRoute,
          ),
    );
  }
}
