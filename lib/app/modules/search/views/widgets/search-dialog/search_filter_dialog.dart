import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:icloudready/app/modules/search/controllers/search_controller.dart';
import 'package:icloudready/app/modules/search/views/widgets/search-dialog/search_gender_filter_item.dart';
import 'package:icloudready/app/modules/search/views/widgets/search-dialog/search_status_filter_item.dart';
import 'package:icloudready/app/resources/value_manager.dart';
import 'package:icloudready/generated/l10n.dart';

class SearchFilterDialog extends GetView<SearchGetController> {
  const SearchFilterDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        S.current.filters,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.current.status.toUpperCase(),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Row(
            children: controller.statusFilters.map((statusFilter) {
              return SearchStatusFilterItem(statusFilter);
            }).toList(),
          ),
          const Gap(AppSize.s16),
          Text(
            S.current.gender.toUpperCase(),
            style: Theme.of(context).textTheme.bodySmall,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: controller.genderFilters.map((genderFilter) {
                return SearchGenderFilterItem(genderFilter);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
