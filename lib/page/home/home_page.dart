import 'package:dio/dio.dart' as net;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanandroid_flutter_getx/net/net_util.dart';
import 'package:wanandroid_flutter_getx/page/setting/setting_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('hello'.tr),
            ElevatedButton(
                onPressed: () async {
                  net.Response res = await dio.get('/article/list/0/json');
                  printInfo(info: res.data.toString());
                },
                child: Text('net'))
          ],
        ),
      ),
    );
  }
}
