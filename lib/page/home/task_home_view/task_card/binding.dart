import 'package:hy_get/hy_get.dart';
import 'logic.dart';

class TaskListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TaskCardLogic(Get.arguments));
  }
}
