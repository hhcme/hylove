import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import 'state.dart';

class RegisterLogic extends GetxController {
  final RegisterState state = RegisterState();

  /// 跳转页面
  void jumpPage({int? appoint}) async {
    if (state.isAnimation) {
      return;
    }
    int? index;
    if (appoint != null) {
      index = appoint;
    } else {
      index = state.pageController.page?.toInt();
      if (index == null) {
        return;
      }
      if (index < 5) {
        index += 1;
      } else {
        /// 这里是测试用的
        index = 0;
      }
    }

    state.isAnimation = true;
    state.pageController
        .animateToPage(index, duration: const Duration(milliseconds: 700), curve: Curves.ease)
        .whenComplete(() {
      state.isAnimation = false;
      state.index.value = index!;
    });
  }
}
