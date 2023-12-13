import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icloudready/app/modules/home/controllers/home_controller.dart';
import 'package:icloudready/app/modules/home/views/widgets/list/property_item.dart';

class PropertyList extends GetView<HomeController> {
  const PropertyList({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return RefreshIndicator(
        onRefresh: () async {
          await controller.findFirstPage();
        },
        child: ListView.builder(
          shrinkWrap: true,
          controller: controller.propertiesScrollController,
          itemCount: controller.properties.length,
          itemBuilder: (context, index) {
            return PropertyItem(controller.properties[index]);
          },
        ),
      );
    });
  }
}
