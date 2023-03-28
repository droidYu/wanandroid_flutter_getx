import 'package:dio/dio.dart';

final options = BaseOptions(
  baseUrl: 'https://www.wanandroid.com',
  connectTimeout: const Duration(seconds: 5),
  receiveTimeout: const Duration(seconds: 3),
);
final dio = Dio(options);