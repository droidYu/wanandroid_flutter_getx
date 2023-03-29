import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wanandroid_flutter_getx/net/api/article_api.dart';
import 'package:wanandroid_flutter_getx/net/article.dart';
import 'package:wanandroid_flutter_getx/net/wan_page.dart';

class HomeController extends GetxController {
  RxList<Article> list = <Article>[].obs;
  int _page = 0;

  var refreshController = RefreshController();

  @override
  void onInit() {
    refreshData();
    refresh();
    super.onInit();
  }

  Future<WanPage<Article>> getList() async =>
      await ArticleApi.getIns().getList(_page);

  loadMoreData() async{
    _page++;
    List<Article> data = (await getList()).datas ?? [];
    refreshController.loadComplete();
    list.addAll(data);
  }

  refreshData() async {
    _page = 0;
    List<Article> data = (await getList()).datas ?? [];
    refreshController.refreshCompleted();
    list.clear();
    list.addAll(data);
  }
}
