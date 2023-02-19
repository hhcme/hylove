
import 'package:get/get.dart';

import 'global_data/global_data.dart';



/// 一些全局数据在这里注册
abstract class AllData {
  static void init() {
    Get.put(GlobalData());
  }
}