import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wanandroid_flutter_getx/page/home/home_controller.dart';
import 'package:wanandroid_flutter_getx/routes/app_pages.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('Wan'),
          actions: [
            IconButton(
                tooltip: 'setting'.tr,
                onPressed: () {
                  Get.toNamed(Routes.SETTING);
                },
                icon: const Icon(Icons.settings))
          ],
        ),
        body: Obx(
          () => SmartRefresher(
              header: WaterDropHeader(
                complete: LoadingIndicator(
                  indicatorType: Indicator.ballBeat,
                  colors: [
                    Colors.blue.withOpacity(.8),
                    Colors.blue.withOpacity(.5)
                  ],
                ),
                refresh: LoadingIndicator(
                  indicatorType: Indicator.ballBeat,
                  colors: [
                    Colors.blue.withOpacity(.8),
                    Colors.blue.withOpacity(.5)
                  ],
                ),
                waterDropColor: Colors.blue.withOpacity(.5),
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
                        borderRadius: BorderRadius.circular(8),
                        highlightColor: Colors.blue.withOpacity(.3),
                        onTap: () {
                          controller.article = controller.list[index];
                          Get.toNamed(Routes.DETAIL);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white.withOpacity(.8),
                          ),
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          controller.list[index]
                                                  .superChapterName ??
                                              '',
                                          style: TextStyle(
                                              color: Colors.grey[600]),
                                        ),
                                        Text(
                                          controller.list[index].title ?? '',
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                      borderRadius: BorderRadius.circular(50),
                                      highlightColor:
                                          Colors.red.withOpacity(.8),
                                      onTap: () {
                                      },
                                      child: Tooltip(
                                        message: '收藏',
                                        child: Padding(
                                            padding: const EdgeInsets.all(12),
                                            child: LikeButton(
                                              onTap: (collect) {
                                                controller.collect(
                                                    controller.list[index]);
                                                return Future(() => !collect);
                                              },
                                              likeBuilder: (collect) => Icon(
                                                collect
                                                    ? Icons.favorite
                                                    : Icons.favorite_outline,
                                                color: Colors.red.withOpacity(.8),
                                                size: 30,
                                              ),
                                            )),
                                      ))
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Text(
                                    controller.list[index].author ?? '',
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                  const Spacer(),
                                  Text(
                                    controller.list[index].niceDate ?? '',
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              )),
        ));
  }
}
