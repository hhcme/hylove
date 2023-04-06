import 'package:hy_get/hy_get.dart';

import 'logic.dart';

class TestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestLogic());
  }
}
