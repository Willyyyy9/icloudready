import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icloudready/app/common/widgets/app_button.dart';
import 'package:icloudready/app/modules/home/views/widgets/list/character_item.dart';
import 'package:icloudready/app/modules/search/controllers/search_controller.dart';
import 'package:icloudready/app/modules/search/views/widgets/search_widget.dart';
import 'package:icloudready/app/resources/asset_manager.dart';
import 'package:icloudready/app/resources/font_manager.dart';
import 'package:icloudready/app/resources/value_manager.dart';
import 'package:icloudready/generated/l10n.dart';

class SearchView extends GetView<SearchGetController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: AppButton(
                  title: S.current.clear,
                  fontSize: FontSize.s16,
                  onTap: () {
                    controller.clearData();
                  }),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Column(
            children: [
              const SearchWidget(),
              Expanded(child: GetBuilder<SearchGetController>(
                builder: (controller) {
                  if (controller.filteredCharacters.isEmpty) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Image.asset(ImageAssets.search),
                          AutoSizeText(
                            S.current.searchForNewCharacters,
                            style: Theme.of(context).textTheme.displayMedium,
                          )
                        ],
                      ),
                    );
                  } else {
                    return ListView.builder(
                      controller: controller.filterCharacterScrollController,
                      itemCount: controller.filteredCharacters.length,
                      itemBuilder: (context, index) {
                        return CharacterItem(
                            controller.filteredCharacters[index]);
                      },
                    );
                  }
                },
              ))
            ],
          ),
        ));
  }
}
