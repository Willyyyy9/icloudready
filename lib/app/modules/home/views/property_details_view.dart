import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:icloudready/app/modules/home/controllers/home_controller.dart';
import 'package:icloudready/app/modules/home/views/widgets/details/property_detail_image.dart';
import 'package:icloudready/app/modules/home/views/widgets/details/property_detail_widget.dart';
import 'package:icloudready/app/modules/home/views/widgets/details/property_location_widget.dart';
import 'package:icloudready/app/resources/asset_manager.dart';
import 'package:icloudready/app/resources/value_manager.dart';

class PropertyDetailView extends GetView<HomeController> {
  const PropertyDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: GetBuilder<HomeController>(builder: (controller) {
        if (controller.selectedProperty != null) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Hero(
                  tag: controller.selectedProperty!.id,
                  child: PropertyDetailImage(
                      image: controller.selectedProperty!.image),
                ),
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: AutoSizeText(
                              controller.selectedProperty!.name,
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(AppPadding.p8),
                            decoration: BoxDecoration(
                                color: Theme.of(context).iconTheme.color,
                                borderRadius:
                                    BorderRadius.circular(AppSize.s10)),
                            child: AutoSizeText(
                              controller.selectedProperty!.status,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Theme.of(context).cardColor),
                            ),
                          )
                        ],
                      ),
                      const Gap(AppSize.s10),
                      const CharacterDetailWidget(),
                      const Gap(AppSize.s10),
                      const PropertyLocationWidget()
                    ],
                  ),
                )
              ],
            ),
          );
        } else {
          return Center(
            child: Image.asset(ImageAssets.error),
          );
        }
      }),
    );
  }
}
