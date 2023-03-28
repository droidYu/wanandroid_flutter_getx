import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wanandroid_flutter_getx/hive_key.dart';

class SettingController extends GetxController {
  var darkTheme = Get.isDarkMode.obs;

  @override
  void onInit() {
    ever(darkTheme, (callback) => printInfo(info: 'theme changed isDark: ${darkTheme.value}'));
    super.onInit();
  }

  void changeTheme() {
    Get.changeTheme(
        darkTheme.toggle().value ? ThemeData.dark() : ThemeData.light());
  }

  void saveLanguage(String language) {
    Get.updateLocale(Locale(language));
    Hive.box(configKey).put(languageKey, language);
  }
}
