import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanandroid_flutter_getx/setting_page.dart';
import 'package:wanandroid_flutter_getx/trans.dart';

void main() => runApp(GetMaterialApp(
      translations: TransList(),
      locale: ui.window.locale,
      fallbackLocale: const Locale('de', 'DE'),
      home: const Home(),
    ));

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
