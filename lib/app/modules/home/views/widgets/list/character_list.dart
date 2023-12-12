import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icloudready/app/modules/home/controllers/home_controller.dart';
import 'package:icloudready/app/modules/home/views/widgets/list/character_item.dart';

class CharacterList extends GetView<HomeController> {
  const CharacterList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return ListView.builder(
        shrinkWrap: true,
        controller: controller.characterScrollController,
        itemCount: controller.characters.length,
        itemBuilder: (context, index) {
          return CharacterItem(controller.characters[index]);
        },
      );
    });
  }
}
