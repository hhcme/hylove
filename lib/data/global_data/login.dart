import 'package:get/get.dart';

/// 登录数据
class LoginData {
  /// 昵称
  RxString name = ''.obs;

  /// 手机号
  RxInt phone = 0.obs;

  /// 电子邮箱
  RxString email = ''.obs;

  /// 性别
  RxBool sex = true.obs;
}
