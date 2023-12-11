import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:icloudready/app/common/my_app.dart';
import 'package:icloudready/app/resources/constant_manager.dart';
import 'package:icloudready/app/resources/string_manager.dart';
import 'package:path_provider/path_provider.dart';

Future<Box> openHiveBox(String boxName) async {
  if (!kIsWeb && !Hive.isBoxOpen(boxName)) {
    Hive.init((await getApplicationDocumentsDirectory()).path);
  }
  return await Hive.openBox(boxName);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await openHiveBox(AppStrings.localeHiveBox);
  AppConstants.configureLoading();
  runApp(MyApp());
}
