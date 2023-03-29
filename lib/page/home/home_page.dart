import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wanandroid_flutter_getx/page/home/home_controller.dart';
import 'package:wanandroid_flutter_getx/page/setting/setting_page.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return Scaffold(
        appBar: AppBar(
          title: const Text('Demo'),
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
              header: const WaterDropHeader(),
              controller: controller.refreshController,
              enablePullUp: true,
              onRefresh: () {
                controller.refreshData();
              },
              onLoading: () {
                controller.loadMoreData();
              },
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: controller.list.length,
                      (context, index) => ListTile(
                        title: Text(controller.list[index].title ?? ''),
                      ),
                    ),
                  )
                ],
              )),
        ));
  }
}
