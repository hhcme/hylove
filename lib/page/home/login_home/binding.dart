import 'package:get/get.dart';

import 'logic.dart';

class LoginHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginHomeLogic());
  }
}
