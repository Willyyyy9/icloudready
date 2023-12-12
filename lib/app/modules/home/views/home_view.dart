import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icloudready/app/modules/home/views/widgets/list/character_list.dart';
import 'package:icloudready/app/modules/home/views/widgets/locale/home_locale_button.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: GetBuilder<HomeController>(builder: (controller) {
            return Text(
              controller.characters.isEmpty
                  ? ""
                  : "${controller.characters.length} / ${controller.characterResponse.info.count}",
              style: Theme.of(context).textTheme.titleMedium,
            );
          }),
          actions: const [HomeLocaleButton()],
        ),
        body: const CharacterList());
  }
}
