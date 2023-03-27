import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wanandroid_flutter_getx/setting/setting_controller.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingController controller = Get.put(SettingController());
    return Scaffold(
      appBar: AppBar(
        title: Text('setting'.tr),
        actions: [
          IconButton(
              onPressed: controller.changeTheme,
              icon: Obx(() => Icon(controller.darkTheme.value
                  ? Icons.light_mode
                  : Icons.dark_mode)))
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
