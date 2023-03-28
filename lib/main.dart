import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wanandroid_flutter_getx/hive_key.dart';
import 'package:wanandroid_flutter_getx/page/home/home_page.dart';
import 'package:wanandroid_flutter_getx/trans.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(configKey);
  runApp(GetMaterialApp(
    translations: TransList(),
    locale: Locale(Hive.box(configKey)
        .get(languageKey, defaultValue: ui.window.locale.languageCode)),
    fallbackLocale: const Locale('de', 'DE'),
    home: const HomePage(),
  ));
}
