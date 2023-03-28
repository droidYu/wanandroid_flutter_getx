import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanandroid_flutter_getx/page/setting/setting_controller.dart';

class SettingPage extends GetView<SettingController> {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SettingController());
    return Scaffold(
      appBar: AppBar(
        title: Text('setting'.tr),
        leading: IconButton(
            onPressed: Get.back, icon: const Icon(Icons.arrow_back_ios_new)),
        actions: [
          IconButton(
              tooltip: 'theme'.tr,
              onPressed: controller.changeTheme,
              icon: Obx(
                () => Icon(controller.darkTheme.value
                    ? Icons.light_mode
                    : Icons.dark_mode),
              )),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  controller.saveLanguage('zh');
                },
                child: Text('chinese'.tr)),
            ElevatedButton(
                onPressed: () {
                  controller.saveLanguage('en');
                },
                child: Text('english'.tr)),
          ],
        ),
      ),
    );
  }
}
