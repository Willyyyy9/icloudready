import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
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
  Character? selectedCharacter;
  final Box hive = GetIt.I<Box>();

  String characterCount() {
    if (Get.locale == const Locale("en")) {
      return "${characters.length} / ${characterResponse.info.count}";
    } else {
      return "${replaceArabicNumber(characters.length.toString())} / ${replaceArabicNumber(characterResponse.info.count.toString())}";
    }
  }

  String replaceArabicNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    const farsi = ['۰', '۱', '۲', '۳', '٤', '٥', '٦', '۷', '۸', '۹'];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], farsi[i]);
    }

    return input;
  }

  cacheCharacters() {
    //Cache Characters List
    List<Map<String, dynamic>> charactersMapList =
        characters.map((e) => e.toJson()).toList();
    String characterJsonString = jsonEncode(charactersMapList);
    hive.put(AttributeStrings.characters, characterJsonString);

    //Cache Character Info
    String characterResponseInfo = jsonEncode(characterResponse.info.toJson());
    hive.put(AttributeStrings.info, characterResponseInfo);
  }

  getCachedCharacters(
      dynamic charactersJsonMap, dynamic charactersInfoJsonMap) {
    List characterDecodedData = jsonDecode(charactersJsonMap);
    dynamic characterInfoDecodedData = jsonDecode(charactersInfoJsonMap);
    characters =
        characterDecodedData.map((e) => Character.fromJson(e)).toList();
    Info info = Info.fromJson(characterInfoDecodedData);
    characterResponse = CharacterResponse(info: info, characters: characters);
    nextPageUrl = info.next;
    update();
  }

  getCharacters() {
    dynamic charactersJsonMap = hive.get(AttributeStrings.characters);
    dynamic charactersInfoJsonMap = hive.get(AttributeStrings.info);
    if (charactersJsonMap != null && charactersInfoJsonMap != null) {
      getCachedCharacters(charactersJsonMap, charactersInfoJsonMap);
    } else {
      findFirstPage();
    }
  }

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
      cacheCharacters();
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
        cacheCharacters();
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
    await getCharacters();
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
