import 'package:flutter_nb_net/flutter_net.dart';
import 'package:wanandroid_flutter_getx/net/url.dart';
import 'package:wanandroid_flutter_getx/net/wan_page.dart';

class ArticleApi {
  ArticleApi._();

  ArticleApi? _api;

  ArticleApi.getIns() {
    _api ??= ArticleApi._();
  }

  Future<Result<WanPage>> getPageData(int page)  {
    return  get<WanPage, WanPage>('${WanUrl.getList}$page/json',
        decodeType: WanPage());
  }
}
