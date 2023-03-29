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

  Future<WanPage<Article>> getList() async =>
      await ArticleApi.getIns().getList(_page);

  loadMoreData() {
    _page++;
    getList().then((value) {
      refreshController.loadComplete();
      list.addAll(value.datas ?? []);
    });
  }

  refreshData() {
    _page = 0;
    getList().then((value) {
      refreshController.refreshCompleted();
      list.clear();
      list.addAll(value.datas ?? []);
    });
  }
}
