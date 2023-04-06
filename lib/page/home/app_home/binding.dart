import 'package:hy_get/hy_get.dart';

import 'logic.dart';

class AppHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppHomeLogic());
  }
}
