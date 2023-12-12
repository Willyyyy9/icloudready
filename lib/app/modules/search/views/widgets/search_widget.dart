import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:icloudready/app/common/widgets/app_icon_button.dart';
import 'package:icloudready/app/common/widgets/app_text_form_field.dart';
import 'package:icloudready/app/modules/search/controllers/search_controller.dart';
import 'package:icloudready/app/modules/search/views/widgets/search-dialog/search_filter_dialog.dart';
import 'package:icloudready/app/resources/color_manager.dart';
import 'package:icloudready/app/resources/font_manager.dart';
import 'package:icloudready/app/resources/value_manager.dart';
import 'package:icloudready/generated/l10n.dart';

class SearchWidget extends GetView<SearchGetController> {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppPadding.p8),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 1,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(AppSize.s10)),
      child: Column(
        children: [
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
                child: AppTextFormField(
              controller: controller.searchTextController,
              hint: S.current.characterName,
              fontSize: FontSize.s18,
            )),
            AppIconButton(
                icon: FontAwesomeIcons.filter,
                color: ColorManager.primary,
                onTap: () {
                  Get.dialog(const SearchFilterDialog());
                }),
            AppIconButton(
                icon: FontAwesomeIcons.magnifyingGlass,
                color: ColorManager.primary,
                onTap: () {
                  FocusScope.of(context).unfocus();
                  controller.filter();
                }),
          ]),
          GetBuilder<SearchGetController>(
            builder: (controller) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (controller.selectedStatusFilterValue != null)
                    Container(
                      padding: const EdgeInsets.all(AppPadding.p8),
                      margin: const EdgeInsets.all(AppMargin.m4),
                      decoration: BoxDecoration(
                          color: ColorManager.lightPrimary.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(AppSize.s10)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            controller.selectedStatusFilterValue!.title,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const Gap(AppSize.s10),
                          const Icon(
                            FontAwesomeIcons.check,
                            size: AppSize.s20,
                          )
                        ],
                      ),
                    ),
                  if (controller.selectedGenderFilterValue != null)
                    Container(
                      padding: const EdgeInsets.all(AppPadding.p8),
                      margin: const EdgeInsets.all(AppMargin.m4),
                      decoration: BoxDecoration(
                          color: ColorManager.success.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(AppSize.s10)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            controller.selectedGenderFilterValue!.title,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const Gap(AppSize.s10),
                          const Icon(
                            FontAwesomeIcons.check,
                            size: AppSize.s20,
                          )
                        ],
                      ),
                    ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
