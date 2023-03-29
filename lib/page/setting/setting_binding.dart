import 'package:get/get.dart';
import 'package:wanandroid_flutter_getx/page/setting/setting_controller.dart';

class SettingBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SettingController>(() => SettingController());
  }
}