import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:icloudready/app/modules/home/controllers/home_controller.dart';
import 'package:icloudready/app/resources/value_manager.dart';
import 'package:icloudready/generated/l10n.dart';

class HomeSettingsButton extends GetView<HomeController> {
  const HomeSettingsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          onTap: () async {
            if (Get.locale == const Locale("en")) {
              await controller.localeController.changeLanguage("ar");
            } else {
              await controller.localeController.changeLanguage("en");
            }
            controller.localeController.update();
          },
          child: Row(
            children: [
              Text(
                Get.locale == const Locale("en") ? "العربية" : "English",
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
        ),
        PopupMenuItem(
          value: 1,
          onTap: () async {
            if (Get.locale == const Locale("en")) {
              await controller.localeController.changeThemeMode();
            } else {
              await controller.localeController.changeThemeMode();
            }
            controller.localeController.update();
          },
          child: Row(
            children: [
              GetBuilder<HomeController>(builder: (controller) {
                return Text(
                  controller.localeController.isDarkMode == true
                      ? S.current.lightMode
                      : S.current.darkMode,
                  style: Theme.of(context).textTheme.titleSmall,
                );
              })
            ],
          ),
        ),
      ],
      offset: const Offset(0, 50),
      color: Theme.of(context).scaffoldBackgroundColor,
      elevation: 2,
      child: const Padding(
        padding: EdgeInsets.all(AppPadding.p16),
        child: Icon(FontAwesomeIcons.gear),
      ),
    );
  }
}
