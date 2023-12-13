import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:icloudready/app/modules/home/controllers/home_controller.dart';
import 'package:icloudready/app/resources/color_manager.dart';
import 'package:icloudready/app/resources/value_manager.dart';
import 'package:icloudready/generated/l10n.dart';

class PropertyLocationWidget extends GetView<HomeController> {
  const PropertyLocationWidget({super.key});

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
                    S.current.location,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Icon(
                  FontAwesomeIcons.locationDot,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
            const Gap(AppSize.s16),
            AutoSizeText(
              S.current.address.toUpperCase(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            AutoSizeText(controller.selectedProperty!.address,
                style: Theme.of(context).textTheme.displayLarge),
            const Gap(AppSize.s16),
            AutoSizeText(
              S.current.numberOfBedrooms.toUpperCase(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            AutoSizeText(controller.selectedProperty!.numberOfRooms.toString(),
                style: Theme.of(context).textTheme.displayLarge),
            const Gap(AppSize.s16),
            AutoSizeText(
              S.current.numberOfBathrooms.toUpperCase(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            AutoSizeText(
                controller.selectedProperty!.numberOfBathrooms.toString(),
                style: Theme.of(context).textTheme.displayLarge),
          ],
        ),
      );
    });
  }
}
