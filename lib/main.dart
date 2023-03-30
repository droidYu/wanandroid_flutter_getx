import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/io.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_nb_net/flutter_net.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wanandroid_flutter_getx/hive_key.dart';
import 'package:wanandroid_flutter_getx/lang/translation_service.dart';
import 'package:wanandroid_flutter_getx/net/url.dart';
import 'package:wanandroid_flutter_getx/net/wan_http_decoder.dart';
import 'package:wanandroid_flutter_getx/routes/app_pages.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await initServices();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppPages.home,
    getPages: AppPages.routes,
    translations: TranslationService(),
    locale: TranslationService.locale,
    fallbackLocale: TranslationService.fallbackLocale,
  ));
}

initServices() async {
  await Hive.initFlutter();
  await Hive.openBox(configKey);
  await initNetwork();
}

Future<void> initNetwork() async {
  Directory dir = await getTemporaryDirectory();

  NetOptions.instance
      .setBaseUrl(WanUrl.host)
      .setHttpClientAdapter(IOHttpClientAdapter()
        ..onHttpClientCreate = (client) {
          client.findProxy = (uri) {
            return 'PROXY 192.168.0.162:9091';
          };
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) => true;
          return client;
        })
      .addInterceptor(CookieManager(CookieJar()))
      // .addInterceptor(DioCacheManager(CacheConfig(
      //   baseUrl: "https://www.wanandroid.com/",
      // )).interceptor)
      // dio_cache_interceptor
      .addInterceptor(RetryInterceptor(
        dio: NetOptions.instance.dio,
        retries: 3,
      ))
      .addInterceptor(DioCacheInterceptor(
          options: CacheOptions(store: HiveCacheStore(dir.path))))
      .addInterceptor(DioCacheInterceptor(
          options: CacheOptions(
        store: MemCacheStore(),
        policy: CachePolicy.forceCache,
        hitCacheOnErrorExcept: [401, 403],
        maxStale: const Duration(days: 7),
        priority: CachePriority.normal,
        cipher: null,
        keyBuilder: CacheOptions.defaultCacheKeyBuilder,
        allowPostMethod: false,
      )))
      //  全局解析器
      .addInterceptor(InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          // 如果你想完成请求并返回一些自定义数据，你可以使用 `handler.resolve(response)`。
          // 如果你想终止请求并触发一个错误，你可以使用 `handler.reject(error)`。
          return handler.next(options);
        },
        onResponse:
            (dio.Response response, ResponseInterceptorHandler handler) {
          // 如果你想终止请求并触发一个错误，你可以使用 `handler.reject(error)`。
          return handler.next(response);
        },
        onError: (DioError e, ErrorInterceptorHandler handler) {
          // 如果你想完成请求并返回一些自定义数据，你可以使用 `handler.resolve(response)`。
          Get.snackbar(e.response?.statusCode.toString() ?? '',
              e.response?.statusMessage.toString() ?? '');
          return handler.next(e);
        },
      ))
      .setHttpDecoder(WanHttpDecoder.getInstance())
      //  超时时间
      .setConnectTimeout(const Duration(milliseconds: 3000))
      // 允许打印log，默认未 true
      .enableLogger(false)
      .create();
}
