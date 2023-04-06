import 'package:hy_get/hy_get.dart';

import 'logic.dart';

class TaskHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskHomeLogic());
  }
}
