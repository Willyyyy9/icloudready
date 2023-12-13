import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:icloudready/app/modules/home/models/character.dart';
import 'package:icloudready/app/modules/home/models/character_response.dart';
import 'package:icloudready/app/modules/home/models/property.dart';
import 'package:icloudready/app/modules/home/models/property_response.dart';
import 'package:icloudready/app/modules/home/network/home_network.dart';
import 'package:icloudready/app/modules/search/models/filter_model.dart';
import 'package:icloudready/app/modules/search/network/search_network.dart';
import 'package:icloudready/app/resources/string_manager.dart';
import 'package:icloudready/generated/l10n.dart';

class SearchGetController extends GetxController {
  List<Property> filteredProperties = [];
  TextEditingController searchTextController = TextEditingController();
  FilterModel? selectedStatusFilterValue;
  FilterModel? selectedTypeFilterValue;

  List<FilterModel> statusFilters = [
    FilterModel(title: S.current.sale, value: AppStrings.sale),
    FilterModel(title: S.current.rent, value: AppStrings.rent),
  ];
  List<FilterModel> typeFilters = [
    FilterModel(title: S.current.villa, value: AppStrings.villa),
    FilterModel(title: S.current.apartment, value: AppStrings.apartment),
    FilterModel(title: S.current.studio, value: AppStrings.studio),
  ];
  String? nextPageUrl;
  Map<String, dynamic> query = {};
  late PropertyData propertyData;
  bool hasNextPageBeenCalled = false;
  ScrollController filterCharacterScrollController = ScrollController();

  clearData() {
    filteredProperties.clear();
    selectedTypeFilterValue = null;
    selectedStatusFilterValue = null;
    nextPageUrl = null;
    query.clear();
    hasNextPageBeenCalled = false;
    searchTextController.clear();
    update();
  }

  bool loadQueryMap() {
    query.clear();
    if (selectedTypeFilterValue != null) {
      query[AttributeStrings.type] = selectedTypeFilterValue!.value;
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
        filteredProperties.clear();
        final response = await SearchNetwork()
            .filter(AppLinks.baseUrl + AttributeStrings.properties, query);
        propertyData = PropertyData.fromJson(response);
        nextPageUrl = propertyData.nextUrl;
        filteredProperties.addAll(propertyData.data);
        EasyLoading.dismiss();
        update();
      } else {
        EasyLoading.showError(S.current.searchError);
      }
    } on DioException catch (_) {
      filteredProperties.clear();
      EasyLoading.dismiss();
      update();
    } catch (e) {
      filteredProperties.clear();
      EasyLoading.dismiss();
      update();
    }
  }

  Future filterNextPage() async {
    if (nextPageUrl != null) {
      try {
        hasNextPageBeenCalled = true;
        final response = await HomeNetwork().find(nextPageUrl.toString());
        propertyData = PropertyData.fromJson(response);
        nextPageUrl = propertyData.nextUrl;
        filteredProperties.addAll(propertyData.data);
        hasNextPageBeenCalled = false;
        update();
      } on DioException catch (_) {
        filteredProperties.clear();
        EasyLoading.dismiss();
        update();
      } catch (e) {
        filteredProperties.clear();
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
