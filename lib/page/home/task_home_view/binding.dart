import 'package:get/get.dart';

import 'logic.dart';

class TaskHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskHomeLogic());
  }
}
