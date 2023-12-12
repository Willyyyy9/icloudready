import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:icloudready/app/modules/home/models/character.dart';
import 'package:icloudready/app/modules/home/models/character_response.dart';
import 'package:icloudready/app/modules/home/network/home_network.dart';
import 'package:icloudready/app/modules/search/models/filter_model.dart';
import 'package:icloudready/app/modules/search/network/search_network.dart';
import 'package:icloudready/app/resources/string_manager.dart';
import 'package:icloudready/generated/l10n.dart';

class SearchGetController extends GetxController {
  List<Character> filteredCharacters = [];
  TextEditingController searchTextController = TextEditingController();
  FilterModel? selectedStatusFilterValue;
  FilterModel? selectedGenderFilterValue;

  List<FilterModel> statusFilters = [
    FilterModel(title: S.current.alive, value: AppStrings.alive),
    FilterModel(title: S.current.dead, value: AppStrings.dead),
    FilterModel(title: S.current.unknown, value: AppStrings.unknown),
  ];
  List<FilterModel> genderFilters = [
    FilterModel(title: S.current.female, value: AppStrings.female),
    FilterModel(title: S.current.male, value: AppStrings.male),
    FilterModel(title: S.current.genderless, value: AppStrings.genderless),
    FilterModel(title: S.current.unknown, value: AppStrings.unknown),
  ];
  String? nextPageUrl;
  Map<String, dynamic> query = {};
  late CharacterResponse characterResponse;
  bool hasNextPageBeenCalled = false;
  ScrollController filterCharacterScrollController = ScrollController();

  clearData() {
    filteredCharacters.clear();
    selectedGenderFilterValue = null;
    selectedStatusFilterValue = null;
    nextPageUrl = null;
    query.clear();
    hasNextPageBeenCalled = false;
    searchTextController.clear();
    update();
  }

  bool loadQueryMap() {
    query.clear();
    if (selectedGenderFilterValue != null) {
      query[AttributeStrings.gender] = selectedGenderFilterValue!.value;
    }
    if (selectedStatusFilterValue != null) {
      query[AttributeStrings.status] = selectedStatusFilterValue!.value;
    }
    if (searchTextController.text.isNotEmpty) {
      query[AttributeStrings.name] = searchTextController.text;
    }
    if (query.isEmpty) {
      return false;
    } else {
      return true;
    }
  }

  Future filter() async {
    try {
      if (loadQueryMap() == true) {
        EasyLoading.show(status: S.current.loading);
        filteredCharacters.clear();
        final response = await SearchNetwork()
            .filter(AppLinks.baseUrl + AttributeStrings.character, query);
        characterResponse = CharacterResponse.fromJson(response);
        nextPageUrl = characterResponse.info.next;
        filteredCharacters.addAll(characterResponse.characters);
        EasyLoading.dismiss();
        update();
      } else {
        EasyLoading.showError(S.current.searchError);
      }
    } on DioException catch (_) {
      filteredCharacters.clear();
      EasyLoading.dismiss();
      update();
    } catch (e) {
      filteredCharacters.clear();
      EasyLoading.dismiss();
      update();
    }
  }

  Future filterNextPage() async {
    if (nextPageUrl != null) {
      try {
        hasNextPageBeenCalled = true;
        final response = await HomeNetwork().find(nextPageUrl.toString());
        characterResponse = CharacterResponse.fromJson(response);
        nextPageUrl = characterResponse.info.next;
        filteredCharacters.addAll(characterResponse.characters);
        hasNextPageBeenCalled = false;
        update();
      } on DioException catch (_) {
        filteredCharacters.clear();
        EasyLoading.dismiss();
        update();
      } catch (e) {
        filteredCharacters.clear();
        EasyLoading.dismiss();
        update();
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    filterCharacterScrollController.addListener(() async {
      double maxScroll =
          filterCharacterScrollController.position.maxScrollExtent;
      double currentScroll = filterCharacterScrollController.position.pixels;
      double delta = 200.0;
      if (maxScroll - currentScroll <= delta) {
        if (!hasNextPageBeenCalled) {
          await filterNextPage();
        }
      }
    });
  }
}
