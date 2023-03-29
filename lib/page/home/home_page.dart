import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wanandroid_flutter_getx/page/detail/detail_page.dart';
import 'package:wanandroid_flutter_getx/page/home/home_controller.dart';
import 'package:wanandroid_flutter_getx/page/setting/setting_page.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Wan Android'),
          actions: [
            IconButton(
                tooltip: 'setting'.tr,
                onPressed: () {
                  Get.to(() => const SettingPage());
                },
                icon: const Icon(Icons.settings))
          ],
        ),
        body: Obx(
          () => SmartRefresher(
              header: const WaterDropHeader(
                complete: Text('刷新完成'),
              ),
              controller: controller.refreshController,
              enablePullUp: true,
              onRefresh: controller.refreshData,
              onLoading: controller.loadMoreData,
              child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: controller.list.length,
                      (context, index) => InkWell(
                        onTap: () {
                          controller.article = controller.list[index];
                          Get.to(()=>DetailPage());
                        },
                        child: ListTile(
                          title: Text(controller.list[index].title ?? ''),
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ));
  }
}
