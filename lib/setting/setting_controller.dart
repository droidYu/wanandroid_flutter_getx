import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingController extends GetxController {
  var darkTheme = Get.isDarkMode.obs;

  void changeTheme() {
    Get.changeTheme(darkTheme.value ? ThemeData.light() : ThemeData.dark());
    darkTheme.value = !darkTheme.value;
  }
}
