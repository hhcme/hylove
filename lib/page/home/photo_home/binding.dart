import 'package:get/get.dart';

import 'logic.dart';

class PhotoHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PhotoHomeLogic());
  }
}
