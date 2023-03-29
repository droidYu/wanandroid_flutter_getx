import 'package:wanandroid_flutter_getx/net/article.dart';
import 'package:wanandroid_flutter_getx/net/net_util.dart';
import 'package:wanandroid_flutter_getx/net/url.dart';
import 'package:wanandroid_flutter_getx/net/wan_page.dart';
import 'package:wanandroid_flutter_getx/net/wan_response.dart';

class ArticleApi {
  ArticleApi._();

  ArticleApi? _api;

  ArticleApi.getIns() {
    _api ??= ArticleApi._();
  }

  Future<WanPage<Article>> getList(int page) async {
    WanResponse res = await NetUtil.get('${WanUrl.getList}$page/json');
    WanPage<Article> resPage = WanPage.fromJson(res.data, Article.fromJson);
    return Future(() => resPage);
  }
}
