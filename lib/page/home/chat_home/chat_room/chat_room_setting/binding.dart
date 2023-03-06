import 'package:get/get.dart';

import 'logic.dart';

class ChatRoomSettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatRoomSettingLogic());
  }
}
