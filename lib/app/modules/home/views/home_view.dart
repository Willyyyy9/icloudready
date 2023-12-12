import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icloudready/app/modules/home/views/widgets/list/character_list.dart';
import 'package:icloudready/app/modules/home/views/widgets/search/home_search_button.dart';
import 'package:icloudready/app/modules/home/views/widgets/settings/home_settings_button.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: GetBuilder<HomeController>(builder: (controller) {
            return Text(
              controller.characters.isEmpty ? "" : controller.characterCount(),
              style: Theme.of(context).textTheme.titleSmall,
            );
          }),
          actions: const [HomeSettingsButton(), HomeSearchButton()],
        ),
        body: const CharacterList());
  }
}
