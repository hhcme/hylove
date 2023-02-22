import 'package:get/get.dart';

import 'logic.dart';

class SetHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SetHomeLogic());
  }
}
