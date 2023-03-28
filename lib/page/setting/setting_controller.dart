import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wanandroid_flutter_getx/hive_key.dart';

class SettingController extends GetxController {
  var darkTheme = Get.isDarkMode.obs;

  void changeTheme() {
    Get.changeTheme(darkTheme.value ? ThemeData.light() : ThemeData.dark());
    darkTheme.value = !darkTheme.value;
  }

  void saveLanguage(String language) {
    Get.updateLocale(Locale(language));
    Hive.box(configKey).put(languageKey, language);
  }
}
