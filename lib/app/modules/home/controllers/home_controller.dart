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
import 'package:icloudready/app/modules/home/models/property.dart';
import 'package:icloudready/app/modules/home/models/property_response.dart';
import 'package:icloudready/app/modules/home/network/home_network.dart';
import 'package:icloudready/app/resources/string_manager.dart';
import 'package:icloudready/generated/l10n.dart';

class HomeController extends GetxController {
  LocaleController localeController = Get.find<LocaleController>();
  ScrollController propertiesScrollController = ScrollController();
  late PropertyData propertyData;
  List<Property> properties = [];
  String? nextPageUrl;
  bool hasNextPageBeenCalled = false;
  Property? selectedProperty;
  final Box hive = GetIt.I<Box>();

  String characterCount() {
    if (Get.locale == const Locale("en")) {
      return "${properties.length} / ${propertyData.totalCount}";
    } else {
      return "${replaceArabicNumber(properties.length.toString())} / ${replaceArabicNumber(propertyData.totalCount.toString())}";
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
    List<Map<String, dynamic>> propertiesMapList =
        properties.map((e) => e.toJson()).toList();
    String characterJsonString = jsonEncode(propertiesMapList);
    hive.put(AttributeStrings.properties, characterJsonString);

    //Cache Character Info
    String characterResponseInfo = jsonEncode(propertyData.toJson());
    hive.put(AttributeStrings.propertyData, characterResponseInfo);
  }

  getCachedCharacters(dynamic propertiesJsonMap, dynamic propertyDataJsonMap) {
    List propertiesDecodedData = jsonDecode(propertiesJsonMap);
    dynamic propertDataDecodedData = jsonDecode(propertyDataJsonMap);
    properties =
        propertiesDecodedData.map((e) => Property.fromJson(e)).toList();
    propertyData = PropertyData.fromJson(propertDataDecodedData);
    nextPageUrl = propertyData.nextUrl;
    update();
  }

  getCharacters() {
    dynamic propertiesJsonMap = hive.get(AttributeStrings.properties);
    dynamic propertyDataJsonMap = hive.get(AttributeStrings.propertyData);
    if (propertiesJsonMap != null && propertyDataJsonMap != null) {
      getCachedCharacters(propertiesJsonMap, propertyDataJsonMap);
    } else {
      findFirstPage();
    }
  }

  Future findFirstPage() async {
    try {
      EasyLoading.show(status: S.current.loading);
      properties.clear();
      final response = await HomeNetwork()
          .find(AppLinks.baseUrl + AttributeStrings.properties);
      propertyData = PropertyData.fromJson(response);
      nextPageUrl = propertyData.nextUrl;
      properties.addAll(propertyData.data);
      EasyLoading.dismiss();
      cacheCharacters();
      update();
    } on DioException catch (e) {
      print(e);

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
        propertyData = PropertyData.fromJson(response);
        nextPageUrl = propertyData.nextUrl;
        properties.addAll(propertyData.data);
        cacheCharacters();
        hasNextPageBeenCalled = false;
        update();
      } on DioException catch (e) {
        print(e);
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
    propertiesScrollController.addListener(() async {
      double maxScroll = propertiesScrollController.position.maxScrollExtent;
      double currentScroll = propertiesScrollController.position.pixels;
      double delta = 200.0;
      if (maxScroll - currentScroll <= delta) {
        if (!hasNextPageBeenCalled) {
          await find();
        }
      }
    });
  }
}
