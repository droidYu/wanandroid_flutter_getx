import 'package:get/get.dart';
import 'package:wanandroid_flutter_getx/page/home/home_controller.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }


}