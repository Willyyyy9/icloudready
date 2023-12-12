import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:icloudready/app/controllers/locale_controller.dart';
import 'package:icloudready/app/resources/string_manager.dart';
import 'package:icloudready/app/resources/theme_manager.dart';
import 'package:icloudready/app/routes/app_pages.dart';
import 'package:icloudready/generated/l10n.dart';

class MyApp extends StatefulWidget {
  // named constructor
  const MyApp._internal();
  static const MyApp _instance =
      MyApp._internal(); // singleton or single instance
  factory MyApp() => _instance; // factory

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      locale: controller.initialLanguage,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: AppStrings.iCloudReady,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      darkTheme: getDarkApplicationTheme(),
      builder: EasyLoading.init(),
      defaultTransition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 0),
      scrollBehavior: AppScrollBehavior(),
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
