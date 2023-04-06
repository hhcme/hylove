import 'package:hy_get/hy_get.dart';

import 'logic.dart';

class NoteHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NoteHomeLogic());
  }
}
