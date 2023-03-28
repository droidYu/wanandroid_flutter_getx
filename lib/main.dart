import 'dart:io';
import 'dart:ui' as ui;

import 'package:dio/io.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:wanandroid_flutter_getx/hive_key.dart';
import 'package:wanandroid_flutter_getx/net/net_util.dart';
import 'package:wanandroid_flutter_getx/page/home/home_page.dart';
import 'package:wanandroid_flutter_getx/trans.dart';

void main() async {
  await initServices();

  runApp(GetMaterialApp(
    translations: TransList(),
    locale: Locale(Hive.box(configKey)
        .get(languageKey, defaultValue: ui.window.locale.languageCode)),
    fallbackLocale: const Locale('de', 'DE'),
    home: const HomePage(),
  ));
}

initServices() async {
  await Hive.initFlutter();
  await Hive.openBox(configKey);
  dio.httpClientAdapter = IOHttpClientAdapter(
    onHttpClientCreate: (client){
    client.findProxy = (uri){
      return 'PROXY 192.168.0.162:9091';
    };
    client.badCertificateCallback = (X509Certificate cert, String host, int port) => Platform.isAndroid;
    return client;
    }
  );
}
