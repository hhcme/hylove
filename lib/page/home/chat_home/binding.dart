import 'package:hy_get/hy_get.dart';

import 'logic.dart';

class ChatHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatHomeLogic());
  }
}
