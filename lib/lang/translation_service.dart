import 'dart:ui';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wanandroid_flutter_getx/hive_key.dart';
import 'package:wanandroid_flutter_getx/lang/en_US.dart';
import 'package:wanandroid_flutter_getx/lang/zh_CN.dart';

class TranslationService extends Translations {
  static Locale? get locale => Locale(Hive.box(configKey)
      .get(languageKey, defaultValue: Get.deviceLocale?.languageCode));

  static const fallbackLocale = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
        'zh_CN': zhCN,
        'en_US': enUS,
      };
}
