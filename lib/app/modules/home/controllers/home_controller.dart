import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:icloudready/app/controllers/locale_controller.dart';
import 'package:icloudready/app/modules/home/models/character.dart';
import 'package:icloudready/app/modules/home/models/character_response.dart';
import 'package:icloudready/app/modules/home/network/home_network.dart';
import 'package:icloudready/app/resources/string_manager.dart';
import 'package:icloudready/generated/l10n.dart';

class HomeController extends GetxController {
  LocaleController localeController = Get.find<LocaleController>();
  ScrollController characterScrollController = ScrollController();
  late CharacterResponse characterResponse;
  List<Character> characters = [];
  String? nextPageUrl;
  bool hasNextPageBeenCalled = false;

  Future findFirstPage() async {
    try {
      EasyLoading.show(status: S.current.loading);
      characters.clear();
      final response = await HomeNetwork()
          .find(AppLinks.baseUrl + AttributeStrings.character);
      characterResponse = CharacterResponse.fromJson(response);
      nextPageUrl = characterResponse.info.next;
      characters.addAll(characterResponse.characters);
      EasyLoading.dismiss();
      update();
    } on DioException catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(e.message.toString());
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showError(S.current.internalError);
    }
  }

  Future find() async {
    if (nextPageUrl != null) {
      try {
        hasNextPageBeenCalled = true;
        final response = await HomeNetwork().find(nextPageUrl.toString());
        characterResponse = CharacterResponse.fromJson(response);
        nextPageUrl = characterResponse.info.next;
        characters.addAll(characterResponse.characters);
        hasNextPageBeenCalled = false;
        update();
      } on DioException catch (e) {
        EasyLoading.dismiss();
        EasyLoading.showError(e.message.toString());
      } catch (e) {
        EasyLoading.dismiss();
        EasyLoading.showError(S.current.internalError);
      }
    }
  }

  @override
  void onInit() async {
    super.onInit();
    await findFirstPage();
    characterScrollController.addListener(() async {
      double maxScroll = characterScrollController.position.maxScrollExtent;
      double currentScroll = characterScrollController.position.pixels;
      double delta = 200.0;
      if (maxScroll - currentScroll <= delta) {
        if (!hasNextPageBeenCalled) {
          await find();
        }
      }
    });
  }
}
