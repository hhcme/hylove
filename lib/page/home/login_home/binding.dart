import 'package:hy_get/hy_get.dart';

import 'logic.dart';

class LoginHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginHomeLogic());
  }
}
