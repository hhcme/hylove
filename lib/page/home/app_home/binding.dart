import 'package:get/get.dart';

import 'logic.dart';

class AppHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppHomeLogic());
  }
}
