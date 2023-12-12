import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:icloudready/app/modules/search/controllers/search_controller.dart';
import 'package:icloudready/app/modules/search/models/filter_model.dart';
import 'package:icloudready/app/resources/color_manager.dart';
import 'package:icloudready/app/resources/value_manager.dart';

class SearchStatusFilterItem extends GetView<SearchGetController> {
  const SearchStatusFilterItem(this.statusFilter, {super.key});
  final FilterModel statusFilter;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchGetController>(builder: (controller) {
      bool isSelected = controller.selectedStatusFilterValue != null &&
          controller.selectedStatusFilterValue!.value == statusFilter.value;
      return InkWell(
        onTap: () {
          if (isSelected) {
            controller.selectedStatusFilterValue = null;
          } else {
            controller.selectedStatusFilterValue = statusFilter;
          }
          controller.update();
        },
        child: Container(
          padding: const EdgeInsets.all(AppPadding.p8),
          margin: const EdgeInsets.all(AppMargin.m4),
          decoration: BoxDecoration(
              color: isSelected
                  ? ColorManager.lightPrimary.withOpacity(0.7)
                  : ColorManager.backgroundGreyGrey,
              borderRadius: BorderRadius.circular(AppSize.s10)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                statusFilter.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              if (isSelected) const Gap(AppSize.s10),
              if (isSelected)
                Icon(
                  FontAwesomeIcons.check,
                  color: ColorManager.primary,
                  size: AppSize.s20,
                )
            ],
          ),
        ),
      );
    });
  }
}
