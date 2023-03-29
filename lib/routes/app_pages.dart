import 'package:get/get.dart';
import 'package:wanandroid_flutter_getx/page/detail/detail_page.dart';
import 'package:wanandroid_flutter_getx/page/home/home_binding.dart';
import 'package:wanandroid_flutter_getx/page/home/home_page.dart';


part 'app_routes.dart';

// ignore: avoid_classes_with_only_static_members
class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: Routes.DETAIL,
          page: () =>  DetailPage(),
        ),
      ],
    ),
  ];
}
