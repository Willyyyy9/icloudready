import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:icloudready/app/modules/home/controllers/home_controller.dart';
import 'package:icloudready/app/resources/value_manager.dart';

class HomeLocaleButton extends GetView<HomeController> {
  const HomeLocaleButton({super.key});

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
          },
          child: Row(
            children: [
              Text(Get.locale == const Locale("en") ? "العربية" : "English")
            ],
          ),
        ),
      ],
      offset: const Offset(0, 50),
      color: Colors.white,
      elevation: 2,
      child: const Padding(
        padding: EdgeInsets.all(AppPadding.p16),
        child: Icon(FontAwesomeIcons.language),
      ),
    );
  }
}
