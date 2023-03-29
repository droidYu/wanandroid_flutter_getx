import 'package:dio/dio.dart';
import 'package:wanandroid_flutter_getx/main.dart';
import 'package:wanandroid_flutter_getx/net/wan_response.dart';

class NetUtil {
  static Future<WanResponse> get(String path) async {
    Response response = await dioClient.get(path);
    WanResponse wanRes = WanResponse.fromJson(response.data);
    return wanRes;
  }
}
