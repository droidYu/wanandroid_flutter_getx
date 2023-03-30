import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wanandroid_flutter_getx/net/api/article_api.dart';
import 'package:wanandroid_flutter_getx/net/article.dart';
import 'package:wanandroid_flutter_getx/net/wan_page.dart';

class HomeController extends GetxController {
  RxList<Article> list = <Article>[].obs;
  int _page = 0;
  Article? article;

  var refreshController = RefreshController();

  @override
  void onInit() {
    refreshData();
    refresh();
    super.onInit();
  }

  loadMoreData() {
    _page++;
    ArticleApi.getIns().getPageData(_page).then((value) {
      value.when(
          success: (WanPage page) {
            refreshController.loadComplete();
            list.addAll(
                page.datas?.map((e) => Article.fromJson(e)).toList() ?? []);
          },
          failure: (_, __) {

          });
    });
  }

  refreshData() {
    _page = 0;
    ArticleApi.getIns().getPageData(_page).then((value) {
      value.when(
          success: (WanPage page) {
            refreshController.refreshCompleted();
            list.clear();
            list.addAll(
                page.datas?.map((e) => Article.fromJson(e)).toList() ?? []);
          },
          failure: (_, __) {
            refreshController.refreshCompleted();
          });
    });
  }
}
