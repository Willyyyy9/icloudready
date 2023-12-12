import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:icloudready/app/modules/home/controllers/home_controller.dart';
import 'package:icloudready/app/resources/color_manager.dart';
import 'package:icloudready/app/resources/value_manager.dart';
import 'package:icloudready/generated/l10n.dart';

class CharacterDetailWidget extends GetView<HomeController> {
  const CharacterDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Container(
        padding: const EdgeInsets.all(AppPadding.p12),
        decoration: BoxDecoration(
            color: ColorManager.backgroundGreyGrey,
            borderRadius: BorderRadius.circular(AppSize.s10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: AutoSizeText(
                    S.current.characterDetails,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Icon(
                  FontAwesomeIcons.circleInfo,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
            const Gap(AppSize.s16),
            AutoSizeText(
              S.current.species.toUpperCase(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            AutoSizeText(
              controller.selectedCharacter!.species,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            if (controller.selectedCharacter!.type.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(AppSize.s16),
                  AutoSizeText(
                    S.current.species.toUpperCase(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  AutoSizeText(
                    controller.selectedCharacter!.type,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ],
              ),
            const Gap(AppSize.s16),
            AutoSizeText(
              S.current.gender.toUpperCase(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            AutoSizeText(
              controller.selectedCharacter!.gender,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        ),
      );
    });
  }
}
