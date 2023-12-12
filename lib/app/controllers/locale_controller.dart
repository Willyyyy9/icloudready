import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:icloudready/app/resources/string_manager.dart';

class LocaleController extends GetxController {
  final hive = Hive.box(AppStrings.localeHiveBox);
  late Locale initialLanguage;
  late bool isDarkMode;

  @override
  void onInit() {
    super.onInit();
    initialLanguage = Locale(hive.get(AppStrings.language) ?? "ar");
    isDarkMode = hive.get(AppStrings.themeMode) ?? false;
  }

  Future changeLanguage(String languageCode) async {
    initialLanguage = Locale(languageCode);
    await hive.put(AppStrings.language, languageCode);
    await Get.updateLocale(initialLanguage);
  }

  Future changeThemeMode() async {
    await hive.put(AppStrings.themeMode, !isDarkMode);
    isDarkMode = !isDarkMode;
    Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
  }
}
