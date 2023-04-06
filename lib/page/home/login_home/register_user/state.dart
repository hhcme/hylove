import 'package:flutter/cupertino.dart';
import 'package:hy_get/hy_get.dart';

class RegisterState {
  RegisterState();

  /// 页面控制器
  final PageController pageController = PageController();

  final RxInt index = 0.obs;

  /// 是否在跳转页面中
  bool isAnimation = false;
}

/// 注册页头部文字
const registerTitle = ['请选择注册方式', '1. 绑定手机号', '2. 设置密码', '3. 填写基本信息', '注册成功！'];
