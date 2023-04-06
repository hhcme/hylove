import 'package:hy_get/hy_get.dart';

import 'logic.dart';

class ChatRoomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatRoomLogic());
  }
}
