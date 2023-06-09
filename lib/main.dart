import 'dart:io';
import 'dart:ui' as ui;

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:wanandroid_flutter_getx/hive_key.dart';
import 'package:wanandroid_flutter_getx/net/api/article_api.dart';
import 'package:wanandroid_flutter_getx/net/url.dart';
import 'package:wanandroid_flutter_getx/page/home/home_page.dart';
import 'package:wanandroid_flutter_getx/trans.dart';

final dioClient = Dio(BaseOptions(
  baseUrl: WanUrl.host,
  connectTimeout: const Duration(seconds: 5),
  receiveTimeout: const Duration(seconds: 3),
));

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
  initNetwork();
}

void initNetwork() {
  dioClient.httpClientAdapter =
      IOHttpClientAdapter(onHttpClientCreate: (client) {
    client.findProxy = (uri) {
      return 'PROXY 192.168.0.162:9091';
    };
    client.badCertificateCallback =
        (X509Certificate cert, String host, int port) => Platform.isAndroid;
    return client;
  });
  dioClient.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
    return handler.next(options);
  }, onResponse: (dio.Response<dynamic> e, ResponseInterceptorHandler handler) {

    return handler.next(e);
  }, onError: (DioError e, ErrorInterceptorHandler handler) {
    return handler.next(e);
  }));
  dioClient.interceptors.add(PrettyDioLogger());
  dioClient.interceptors.add(RetryInterceptor(
    dio: dioClient,
    retries: 3,
  ));
}
