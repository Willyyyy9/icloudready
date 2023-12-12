import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:icloudready/app/common/widgets/app_icon_button.dart';
import 'package:icloudready/app/modules/home/controllers/home_controller.dart';
import 'package:icloudready/app/modules/home/models/character.dart';
import 'package:icloudready/app/resources/asset_manager.dart';
import 'package:icloudready/app/resources/color_manager.dart';
import 'package:icloudready/app/resources/value_manager.dart';

class CharacterItem extends GetView<HomeController> {
  const CharacterItem(this.character, {super.key});
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.4,
      padding: const EdgeInsets.all(AppPadding.p8),
      margin: const EdgeInsets.all(AppMargin.m8),
      decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 1,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(AppSize.s10)),
      child: Column(children: [
        Expanded(
            flex: 2,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(AppSize.s8),
                child: CachedNetworkImage(
                  imageUrl: character.image,
                  placeholder: (context, _) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, _, __) =>
                      Image.asset(ImageAssets.characterError),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ))),
        const Gap(AppSize.s10),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    character.name,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  AutoSizeText(
                    character.status,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            AppIconButton(
                icon: FontAwesomeIcons.circleArrowRight,
                color: ColorManager.primary,
                onTap: () {})
          ],
        )
      ]),
    );
  }
}
