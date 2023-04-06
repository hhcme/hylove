import 'package:hy_get/hy_get.dart';

import 'logic.dart';

class SetHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SetHomeLogic());
  }
}
