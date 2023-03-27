import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(const GetMaterialApp(
  home: Home(),
));

class Controller extends GetxController {
  var count = 0.obs;

  inc() => count++;
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Controller c = Get.put(Controller());
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text('Clicks: ${c.count}')),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () => Get.to(Other()), child: const Text('Go to Other')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: c.inc,
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Other extends StatelessWidget {
  Other({Key? key}) : super(key: key);

  final Controller c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('${c.count}'),
      ),
    );
  }
}
