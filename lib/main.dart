import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wanandroid_flutter_getx/hive_key.dart';
import 'package:wanandroid_flutter_getx/setting/setting_page.dart';
import 'package:wanandroid_flutter_getx/trans.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox(configKey);
  runApp(GetMaterialApp(
    translations: TransList(),
    locale: Locale(Hive.box(configKey)
        .get(languageKey, defaultValue: ui.window.locale.languageCode)),
    fallbackLocale: const Locale('de', 'DE'),
    home: const Home(),
  ));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('hello'.tr),
            ElevatedButton(
                onPressed: () {
                  Get.to(() => const SettingPage());
                },
                child: Text('setting'.tr))
          ],
        ),
      ),
    );
  }
}
