import 'package:hy_get/hy_get.dart';

import 'logic.dart';

class PhotoHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PhotoHomeLogic());
  }
}
