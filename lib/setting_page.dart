import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('setting'.tr),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Get.updateLocale(const Locale('zh'));
                },
                child: Text('chinese'.tr)),
            ElevatedButton(
                onPressed: () {
                  Get.updateLocale(const Locale('en'));
                },
                child: Text('english'.tr)),
          ],
        ),
      ),
    );
  }
}
